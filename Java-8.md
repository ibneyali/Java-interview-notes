
1. **Lambda Expressions**: Lambda expressions help us to write our code in functional style. They provide a clear and concise way to implement SAM interface (Single Abstract Method) by using an expression. It is very useful in collection library in which it helps to iterate, filter and extract data.

```java
List<String> names = Arrays.asList("John", "Mike", "David", "Alice");
Collections.sort(names, (a, b) -> a.compareTo(b));
```

2. **Method References**: Java 8 Method reference is used to refer method of functional interface. It is compact and easy form of lambda expression. Each time when you are using lambda expression to just referring a method, you can replace your lambda expression with method reference.

```java
List<String> names = Arrays.asList("John", "Mike", "David", "Alice");
names.forEach(System.out::println);
```

3. **Functional Interfaces**: An Interface that contains only one abstract method is known as functional interface. It can have any number of default and static methods. It can also declare methods of object class. Functional interfaces are also known as Single Abstract Method Interfaces (SAM Interfaces).

```java
@FunctionalInterface
interface Adder {
    int add(int a, int b);
}

public class Main {
    public static void main(String[] args) {
        Adder adder = (a, b) -> a + b;
        System.out.println(adder.add(5, 10));
    }
}
```

4. **Optional**: Java introduced a new class Optional in Java 8. It is a public final class which is used to deal with NullPointerException in Java application. We must import java.util package to use this class. It provides methods to check the presence of value for particular variable.    

```java
Optional<String> name = Optional.of("John");
System.out.println(name.isPresent()); // Output: true
name = Optional.empty();
System.out.println(name.isPresent()); // Output: false
```

5. **Date/Time API**: Java has introduced a new Date and Time API since Java 8. The java.time package contains Java 8 Date and Time classes.

```java
LocalDate date = LocalDate.now();
System.out.println(date); // Output: 2024-01-31
```