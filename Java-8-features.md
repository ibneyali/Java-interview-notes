
1. **Functional Interface:-**
Functional interfaces are interfaces that have exactly one abstract method. We don’t need to use @FunctionalInterface annotation to mark an interface as Functional Interface. It is not mandatory to use it, but it’s best practice to use it with functional interfaces to avoid addition of extra methods accidentally. If the interface is annotated with @FunctionalInterface annotation and we try to have more than one abstract method, then it will throws compiler error.

Why we use Functional Interface?
One of the major benefits of functional interface is we can use lambda expressions to instantiate them.

2. **Lambda Expression:-**
Lambda expression allow to implement the functional interfaces. It makes code more readable and expressive, especially when working with collections, streams, and functional programming constructs.

3. **Method Reference:**
Method references in Java 8 provide a concise way to refer to methods or constructors of classes, especially when working with functional interfaces. Each time when we use a lambda expression to just referring a method, we can replace lambda expression with a method reference.

There are four main types of method references in Java 8:

a. Reference to a Static Method
b. Reference to an Instance Method of a Particular Object
c. Reference to an Instance Method of an Arbitrary Object of a Particular Type
d. Reference to a Constructor

4. **Stream API: Simplifying Data Processing**

The Stream API in Java 8 is another powerful feature that simplifies data processing. It can be used in combination with lambda expressions to provide a more declarative and composable approach to iterating over and processing data.

5. **New Date and Time API:**
Making Date and Time Manipulations Easier
Java 8 also introduced a new Date and Time API that is more intuitive and easier to use than the older java.util.Date and java.util.Calendar.