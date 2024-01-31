What is Microservices?
Microservice is a small, loosly coupled distributed service. Microservice architecture evolved as a solution to the scalability, independently deployable. These services are organized around business capabilities and communicate with each other via APIs.

"Features of microservices":
"Scalability"

Microservices are designed to be independently deployable and scalable, which means that organizations can easily add or remove instances of individual services as needed to handle changes in traffic or demand.

"Flexibility"

By breaking down applications into smaller services, teams can work on individual services independently, which makes it easier to introduce new features and make changes without affecting the entire application.

"Reusability"

Since each service is independent in a microservice architecture,  organizations can easily reuse individual services across multiple applications and use cases. For example, consider something like user authentication. This service could be developed as a separate microservice that handles user authentication and authorization and can be used across many services.
So you dont need build another application we can use it.

--------------------------------------------------------------------------------------------------


"What are the design pattern in Microservice architecture?"

"Service Registery(Discovery Server)"->It manage the service registry and instance. All the microservices are registered in Service Registery So in service registery all microservice information are there like which microservice is running on which port. Every information like domain and number of instances. It handle load balancing as well.

Service Discovery: Clients dynamically locate services by querying the service registry, enabling flexible and resilient communication between microservices.

"API Gateway:" An entry point for clients to access the microservices ecosystem. API gateways handle routing, authentication, rate limiting, and protocol translation, simplifying client interactions with multiple services.

"Circuit Breaker:" It prevents cascading failures by temporarily halting requests to a failing service. Circuit breakers monitor service health and open circuits when failures exceed a threshold, providing graceful degradation.
circuit breaker has three distinct states: Closed, Open, and Half-Open

1. Closed State:- During normal operation, the circuit breaker remains in the closed state, allowing requests to pass through. In this phase, the system consistently monitors for failures. Upon surpassing a predefined failure threshold, it transitions to the open state.

2. Open State:- In the open state, the circuit breaker forestalls all requests, preventing them from reaching the destination. This approach allows the faulty system time to recover without being overwhelmed by incoming requests.

3. Half-Open State:- The circuit breaker enters a half-open state after a designated recovery period. During this phase, it allows a limited number of requests to pass through, serving as a test to evaluate whether the system has recovered adequately to resume normal operations.

"Saga Pattern": Manages distributed transactions across multiple services. Sagas use a sequence of local transactions that are compensated if a failure occurs, ensuring eventual consistency without the need for a two-phase commit protocol.

"Event Sourcing:" Stores domain events as a sequence of state-changing events. Event sourcing provides an immutable audit log of changes and enables reconstructing application state by replaying events.

"Event-driven Architecture:" Enables loose coupling between services by communicating through asynchronous events. Services publish events to notify other services of state changes, facilitating real-time updates and decoupling service dependencies.

"Config Server" -> Configuration related information stored in config service like we store other microservices config. In other word we can say other microservices will ask the configuration to the Config Server.


"How Microservices communicate with each other?"

There are three types

"1. HTTP Communication:"

Microservices often communicate through the HTTP protocol, which allows them to interact with each other using standard HTTP methods like ‘GET, POST, PUT, and DELETE.’ This ‘RESTful API’ communication ensures decoupled services and platform independence. HTTP-based communication is well-suited for request-response scenarios and synchronous interactions.

"2. Message Communication:"

Message-based communication involves the use of message brokers or queues to enable asynchronous interactions between microservices. This method ensures loose coupling, fault tolerance, and scalability. Services can send messages to queues, and other services can consume these messages at their own pace, facilitating better resilience in distributed systems.

Checkout the Guide on Microservices Testing

"3. Event-Driven Communication:"

In event-driven communication, microservices emit events when certain actions occur. Other services can subscribe to these events and respond accordingly. This pattern allows services to be loosely coupled and react to changes in the system in real time. Event-driven communication is valuable for implementing event sourcing and event-driven architectures.