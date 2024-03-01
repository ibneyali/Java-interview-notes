Top 7 Spring Boot Design Patterns Unveiled!!

Spring Boot, built on top of the Spring framework, incorporates various design patterns to enhance the development, scalability, maintainability, and overall architecture of Java applications. Several reasons illustrate why Spring Boot utilizes design patterns

Why Spring Boot usage design patterns ?

Modularity and Reusability: Design patterns promote modularity by breaking down complex systems into smaller, more manageable parts. Spring Boot leverages patterns like Dependency Injection (DI) and Aspect-Oriented Programming (AOP) to create loosely coupled components that can be reused across the application.
Simplifying Development: Design patterns provide proven solutions to common problems in software development. Spring Boot integrates these patterns to offer developers a set of tools and abstractions that simplify the implementation of various functionalities like database access, RESTful APIs, security, and more.
Maintainability and Testability: By following well-established patterns, Spring Boot applications tend to be more maintainable and easier to test. For instance, the separation of concerns achieved through patterns like MVC (Model-View-Controller) allows developers to test individual components independently, facilitating better code maintenance.
Scalability and Performance: Design patterns, when used correctly, can contribute to better scalability and performance. For instance, patterns like the Factory pattern can help manage object creation efficiently, while strategies like caching (implemented via patterns like the Proxy pattern) can enhance performance.
Flexibility and Extensibility: Spring Boot’s use of design patterns allows for flexibility in system configurations and extensions. For instance, applying the Strategy pattern allows the selection of algorithms or implementations at runtime, making the system more adaptable to changes.
Standardization and Best Practices: Design patterns encapsulate best practices and standard solutions to recurring problems in software development. By adopting these patterns, Spring Boot encourages developers to follow established practices, leading to more robust and reliable applications.
Community Adoption and Ecosystem: Spring Boot’s extensive usage of design patterns is well-documented and widely recognized within the software development community. Developers familiar with these patterns find it easier to work within the Spring ecosystem, contributing to a more unified understanding and collaboration among developers.

Common used Patterns in Spring Boot

1. Singleton Pattern
2. Factory Pattern
3. Dependency Injection (DI)
4. Builder Pattern
5. Proxy Pattern
6. Observer Pattern
7. Decorator Pattern


1. Singleton Pattern:
Spring Boot extensively utilizes the Singleton pattern for managing and controlling the creation of beans (components managed by the Spring container). By default, Spring manages objects as singletons within the container unless specified otherwise.

When you define a bean in Spring (for example, using annotations like @Component, @Service, @Repository, or @Controller), the Spring IoC container manages the lifecycle of these beans. By default, Spring manages these beans as singletons within its container, meaning that Spring creates only one instance of the bean and reuses it wherever that bean is injected or required.

@Service
public class DemoService {
    // Your service logic here
}
In this example, the @Service annotation marks DemoService as a Spring-managed bean. Whenever you request an instance of DemoService from the Spring application context, the Spring container returns the same instance each time by default, adhering to the Singleton pattern.

However, it’s important to note that while Spring manages beans as singletons by default, developers can configure the scope of beans. They can use other scopes like prototype (creating a new instance for each request), session scope, request scope, etc., based on specific requirements.
For instance, using the @Scope annotation allows developers to specify different bean scopes:

@Service
@Scope("prototype")
public class DemoPrototype {
    // Your service logic here
}
In this case, the DemoPrototype bean will be created as a new instance every time it is requested from the Spring application context, diverging from the default Singleton behavior.

Factory Pattern:
In Spring Boot, the Factory pattern is applied in various scenarios to create objects and manage their instantiation. Here’s an example:

2. FactoryBean Interface: The FactoryBean interface in Spring Boot allows you to define custom factory logic for creating beans. This interface gives you control over the creation process of specific types of beans.

import org.springframework.beans.factory.FactoryBean;

public class MyFactoryBean implements FactoryBean<MyBean> {
    @Override
    public MyBean getObject() throws Exception {
        // Custom logic to create and return MyBean instance
        return new MyBean();
    }

    @Override
    public Class<?> getObjectType() {
        return MyBean.class;
    }

    @Override
    public boolean isSingleton() {
        return true; // Or false, depending on your bean's scope
    }
}
By implementing FactoryBean, you can define the logic to create instances of MyBean within the getObject() method. This way, Spring Boot manages the creation and lifecycle of MyBean instances

Factory Methods: Spring Boot encourages the use of factory methods to create objects. Static factory methods can be defined within classes to encapsulate object creation logic.

public class MyBeanFactory {
    public static MyBean createInstance() {
        // Custom logic to create and return MyBean instance
        return new MyBean();
    }
}
These static factory methods provide a convenient way to create instances of objects without directly calling constructors, allowing for more flexibility and encapsulation of the creation process.

3. Dependency Injection (DI):
In Spring Boot, Dependency Injection (DI) is a fundamental concept that’s integral to the framework’s design. DI is primarily achieved through annotations, allowing Spring Boot to manage and inject dependencies into components or beans. Here’s how DI works in Spring Boot:

Annotations for Dependency Injection: Spring Boot uses annotations like @Autowired, @Resource, @Inject, and @Qualifier to inject dependencies into beans or components.

@Service
public class MyService {
    private final MyRepository myRepository;

    @Autowired
    public MyService(MyRepository myRepository) {
        this.myRepository = myRepository;
    }

    // Service methods utilizing MyRepository
}

@Repository
public class MyRepository {
    // Repository methods implementation
}
In this example, MyService has a dependency on MyRepository, which is injected through constructor injection using @Autowired.

Constructor Injection: Constructor injection is a preferred way of performing DI in Spring Boot. By annotating the constructor with @Autowired, Spring automatically resolves and injects the required dependencies.

@Service
public class UserService {
    private final UserRepository userRepository;

    // Constructor Injection
    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    // Service methods utilizing UserRepository
}
UserService is marked with @Service, making it a Spring-managed bean.
The UserService class has a UserRepository dependency injected via constructor injection, annotated with @Autowired.
The UserRepository is automatically provided by Spring when creating an instance of UserService.
Setter Injection: Setter-based injection involves using setter methods annotated with @Autowired to inject dependencies. However, constructor injection is often favored due to its benefits in terms of immutability and easier testing.

@Service
public class MyService {
    private MyRepository myRepository;

    @Autowired
    public void setMyRepository(MyRepository myRepository) {
        this.myRepository = myRepository;
    }

    // Service methods utilizing MyRepository
}
Interface-based Injection: Spring Boot supports interface-based injection, where interfaces are injected rather than concrete implementations. This promotes loose coupling and makes components more testable and interchangeable.

Consider an interface NotificationService that defines the contract for different notification mechanisms:

public interface NotificationService {
    void sendNotification(String message);
}
Then, implement multiple classes that fulfill this contract:

@Service
public class EmailNotificationService implements NotificationService {
    @Override
    public void sendNotification(String message) {
        // Logic to send notification via email
    }
}

@Service
public class SMSService implements NotificationService {
    @Override
    public void sendNotification(String message) {
        // Logic to send notification via SMS
    }
}
Now, a class that depends on the NotificationService interface can be injected with any implementation at runtime:

@Service
public class NotificationHandler {
    private final NotificationService notificationService;

    @Autowired
    public NotificationHandler(NotificationService notificationService) {
        this.notificationService = notificationService;
    }

    public void performNotification(String message) {
        // Perform some business logic
        notificationService.sendNotification(message);
    }
}
NotificationHandler has a dependency on NotificationService.
Spring Boot’s DI resolves this dependency and injects an instance of a class that implements the NotificationService interface at runtime.
By using interface-based injection, you can easily switch between different implementations of NotificationService without altering the NotificationHandler class.
Qualifiers: When multiple beans of the same type exist, @Qualifier is used to specify which bean to inject.

@Service
public class MyService {
    private final MyRepository myRepository;

    @Autowired
    public MyService(@Qualifier("myRepositoryImpl") MyRepository myRepository) {
        this.myRepository = myRepository;
    }

    // Service methods utilizing MyRepository
}
DI in Spring Boot allows for loosely coupled components, promotes reusability, simplifies testing, and enables easier management of dependencies throughout the application

4. Builder Pattern:
In Spring Boot, the Builder pattern is commonly used to create complex objects by providing an elegant way to construct them with multiple optional parameters or configurations. Although the Builder pattern itself is not explicitly implemented as a design pattern within Spring Boot, developers frequently utilize it for building complex objects or configuring components.

Builders in Spring Boot can be implemented using various approaches, including the usage of Lombok’s @Builder annotation, or creating custom builder classes manually. Here's an example:

Example: Using Lombok

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class User {
    private String username;
    private String email;
    private int age;
    // Other fields
}
With Lombok’s @Builder annotation, a builder class is automatically generated for the User class, allowing for a fluent way to construct User objects:

User user = User.builder()
    .username("john_doe")
    .email("john@example.com")
    .age(30)
    .build();
Example: Manually Implement

public class User {
    private String username;
    private String email;
    private int age;

    private User(Builder builder) {
        this.username = builder.username;
        this.email = builder.email;
        this.age = builder.age;
        // Set other fields
    }

    // Getters for User fields

    public static class Builder {
        private String username;
        private String email;
        private int age;

        public Builder username(String username) {
            this.username = username;
            return this;
        }

        public Builder email(String email) {
            this.email = email;
            return this;
        }

        public Builder age(int age) {
            this.age = age;
            return this;
        }

        public User build() {
            return new User(this);
        }
    }

    // Other methods
}
Usage of the custom builder:

User user = new User.Builder()
    .username("john_doe")
    .email("john@example.com")
    .age(30)
    .build();
The Builder pattern facilitates the creation of complex objects with a fluent and readable interface, allowing for the creation of objects with specific configurations while maintaining flexibility and readability within Spring Boot applications.

5. Proxy Pattern:
In Spring Boot, the Proxy pattern is used within the Aspect-Oriented Programming (AOP) framework to apply cross-cutting concerns to components without modifying their core logic. AOP allows developers to separate concerns (such as logging, security, caching) from the main business logic, promoting modularity and reusability.

To implement the Proxy pattern via Spring Boot’s AOP:

Create an Aspect: An aspect encapsulates the cross-cutting concern. It contains advice that defines what actions to take and where to apply them.

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
@Component
public class LoggingAspect {
    
    @Before("execution(* com.example.service.*.*(..))")
    public void beforeServiceMethods() {
        // Logic to be executed before service methods
        System.out.println("Logging before service methods...");
    }
}
Define Pointcuts: Pointcuts specify where the advice (cross-cutting concern) should be applied. In the example above, the pointcut expression (execution(* com.example.service.*.*(..))) targets all methods in the com.example.service package.

Apply Advice: The advice defines the behavior that should be executed before, after, or around the method invocation. In this case, the @Before advice executes the logging logic before the targeted methods are invoked.

Enable Aspect Auto-Proxying: Ensure that AOP is enabled in your Spring Boot application. It’s often enabled by default when using annotations like @EnableAspectJAutoProxy.

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
@Component
public class LoggingAspect {
    
    @Before("execution(* com.example.service.*.*(..))")
    public void beforeServiceMethods() {
        // Logic to be executed before service methods
        System.out.println("Logging before service methods...");
    }
}
Apply Aspect to Target Components: Annotate the target components or methods with annotations like @Service, @Repository, or @Controller to let Spring know which beans the aspect should be applied to.

6. Observer Pattern:
In Spring Boot, the Observer pattern is typically implemented using Spring’s event-driven architecture, allowing components to act as event publishers and subscribers. This mechanism enables communication and notification between different parts of the application when certain events occur.

To implement the Observer pattern in Spring Boot:
Define Custom Events: Create custom event classes that extend ApplicationEvent. These events encapsulate information related to specific occurrences within the application.

import org.springframework.context.ApplicationEvent;

public class OrderPlacedEvent extends ApplicationEvent {
    private final Order order;

    public OrderPlacedEvent(Object source, Order order) {
        super(source);
        this.order = order;
    }

    // Getters for order information
}
Publish Events: Use ApplicationEventPublisher to publish custom events when certain actions occur in your application.

import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;

@Service
public class OrderService {
    private final ApplicationEventPublisher eventPublisher;

    public OrderService(ApplicationEventPublisher eventPublisher) {
        this.eventPublisher = eventPublisher;
    }

    public void placeOrder(Order order) {
        // Logic to place order

        // Publish OrderPlacedEvent
        eventPublisher.publishEvent(new OrderPlacedEvent(this, order));
    }
}
Subscribe to Events: Create components that listen for specific events by using @EventListener annotation on methods that should respond to those events.

import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
public class EmailService {

    @EventListener
    public void sendEmailOnOrderPlacement(OrderPlacedEvent event) {
        Order order = event.getOrder();
        // Logic to send email based on the placed order
    }
}
Application Context Configuration: Ensure that all components, including the event publisher and event subscribers, are managed by Spring (annotated with @Component, @Service, etc.) to be included in the application context.

By following this approach, Spring Boot enables the Observer pattern, allowing components to publish events and other components to subscribe to and respond to those events. This facilitates loose coupling between different parts of the application, enhancing modularity and maintainability.

7. Decorator Pattern:
In Spring Boot, the Decorator pattern is commonly used to add functionalities or behaviors to components dynamically without altering their original structure. Although Spring Boot doesn’t have a built-in Decorator pattern, developers can achieve similar results by leveraging various Spring features like AOP, proxies, and wrapper classes.

Here’s an example illustrating how to apply a decorator-like pattern in Spring Boot using AOP:
Let’s assume we have a UserService interface and its implementation:

public interface UserService {
    void saveUser(User user);
    // Other methods
}

@Service
public class UserServiceImpl implements UserService {
    @Override
    public void saveUser(User user) {
        // Logic to save user
        System.out.println("Saving user: " + user.getName());
    }
}
Now, let’s create an aspect to add additional functionality (decorator-like behavior) before and after the saveUser method:

@Aspect
@Component
public class UserLoggingAspect {

    @Before("execution(* com.example.service.UserService.saveUser(..)) && args(user)")
    public void beforeSaveUser(User user) {
        System.out.println("Logging before saving user: " + user.getName());
    }

    @AfterReturning("execution(* com.example.service.UserService.saveUser(..)) && args(user)")
    public void afterSaveUser(User user) {
        System.out.println("Logging after saving user: " + user.getName());
    }
}
The UserLoggingAspect aspect defines @Before and @AfterReturning advices that run before and after the saveUser method of the UserService.
The aspect acts as a decorator by adding logging behavior around the saveUser method.
When saveUser is called, the logging advice defined in the aspect will be executed before and after the method, effectively adding extra behavior without modifying the original UserServiceImpl class.

While Spring Boot doesn’t have a direct implementation of the Decorator pattern, utilizing AOP allows developers to achieve similar functionality by intercepting method calls and adding cross-cutting concerns, effectively decorating components with additional behaviors or functionalities.