Functional interfaces are new concept introduced in Java 8. An interface with exactly one abstract method is called Functional Interface. We don’t need to use @FunctionalInterface annotation to mark an interface as Functional Interface. It is not mandatory to use it, but it’s best practice to use it with functional interfaces to avoid addition of extra methods accidentally. If the interface is annotated with @FunctionalInterface annotation and we try to have more than one abstract method, it throws compiler error.

One of the major benefits of functional interface is we can use lambda expressions to instantiate them.

For example in Java if we have to instantiate runnable interface anonymously, then our code looks like below. Its bulky

Runnable r = new Runnable(){
    @Override
    public void run() {
    System.out.println("My Runnable");
 }};
Since functional interfaces have only one method, lambda expressions can easily provide the method implementation. We just need to provide method arguments and business logic. For example, we can write above implementation using lambda expression as:

Runnable r1 = () -> {
	System.out.println("My Runnable");
};
So lambda expressions are means to create anonymous classes of functional interfaces easily. There are no runtime benefits of using lambda expressions, but it makes code lines less.

A new package java.util.function has been added with bunch of functional interfaces to provide target types for lambda expressions and method references.

2. Parallel Operations
Classes in the new java.util.stream package provide a Stream API to support functional-style operations on streams of elements. The Stream API is integrated into the Collections API, which enables bulk operations on collections, such as sequential or parallel map-reduce transformations. Stream API will allow sequential as well as parallel execution. This is one of the best features to work with collections.

Collection interface has been extended with stream() and parallelStream() default methods to get the Stream for sequential and parallel execution. Let’s see their usage with simple example.

Stream Example:

List<Integer> myList = new ArrayList<>();
Stream<Integer> sequentialStream = myList.stream();
This will print numbers in sequential order.

Parallel Example:

List<Integer> myList = new ArrayList<>();
Stream<Integer> parallelStream = myList.parallelStream();
This will print numbers in parallel.

3. New Date / Time APIs
The complexity of the current native Java library API has been a cause of pain for Java developers for many years. Joda time has been filling this vacuum for years now, and with Java 8. An immediate question that arose early on was why didn’t Java 8 adopt Joda as its native time framework. Java 8 implemented its own new date / time API from scratch. Java 8 has added java.time package that will streamline the process of working with time in java.

It has some sub-packages java.time.format that provides classes to print and parse dates and times and java.time.zone provides support for time-zones and their rules.

The new Time API prefers enums over integer constants for months and days of the week. One of the useful class is DateTimeFormatter for converting datetime objects to strings.

4. Concurrent Accumulators
One of the most common scenarios in concurrent programming is updating of numeric counters accessed by multiple threads. There have been many idioms to do this over the years, starting from synchronized blocks (which introduce a high level of contention), to read/write locks to AtomicInteger(s). While the last ones are more efficient, as they rely directly on processor CAS instructions, they require a higher degree of familiarity to implement the required semantics correctly.

With Java 8 this problem is solved at the framework level with new concurrent accumulator classes that enable you to very efficiently increase / decrease the value of a counter in a thread safe manner. This is really a case where it’s not a question of taste, or preference – using these new classes in your code is really a no-brainer.

5. Collection API improvements
Some new methods added in Collection API are:

Iterator default method forEachRemaining(Consumer action) to perform the given action for each remaining element until all elements have been processed or the action throws an exception.
Collection default method removeIf(Predicate filter) to remove all of the elements of this collection that satisfy the given predicate.
Collection spliterator() method returning Spliterator instance that can be used to traverse elements sequentially or parallel.
Map replaceAll(), compute(), merge() methods.
Performance Improvement for HashMap class with Key Collisions
6. Concurrency API improvements
Some important concurrent API enhancements are:

ConcurrentHashMap compute(), forEach(), forEachEntry(), forEachKey(), forEachValue(), merge(), reduce() and search() methods.
CompletableFuture that may be explicitly completed (setting its value and status).
Executors newWorkStealingPool() method to create a work-stealing thread pool using all available processors as its target parallelism level.
7. Java IO improvements
Some IO improvements known to me are:

Files.list(Path dir) that returns a lazily populated Stream, the elements of which are the entries in the directory.
Files.lines(Path path) that reads all lines from a file as a Stream.
Files.find() that returns a Stream that is lazily populated with Path by searching for files in a file tree rooted at a given starting file.
BufferedReader.lines() that return a Stream, the elements of which are lines read from this BufferedReader.
