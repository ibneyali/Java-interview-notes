**Core Annotations:**

1. @SpringBootApplication: Combines @ComponentScan, @Configuration, and @EnableAutoConfiguration for bootstrapping the application.
2. @Configuration: Marks a class as a source of bean definitions.
3. @ComponentScan: Scans for components, services, repositories, and other components.
4. @EnableAutoConfiguration: Enables automatic configuration based on classpath settings.
5. @Bean: Defines a method that produces a bean to be managed by the Spring container.
6. @Component: Indicates a class as a component to be managed by Spring.
7. @Service: Stereotype annotation for services.
8. @Repository: Stereotype annotation for data access layers.
9. @Autowired: Autowires dependencies by type.
10. @Qualifier: Used to disambiguate autowiring when multiple beans of the same type are available.


**Web Annotations:**

1. @Controller: Marks a class as a controller for handling web requests.
2. @RestController: A specialized version of @Controller that returns JSON, XML, or other content directly.
3. @RequestMapping: Maps HTTP requests to handler methods.
4. @GetMapping, @PostMapping, @PutMapping, @DeleteMapping, @PatchMapping: Specialized versions of @RequestMapping for HTTP methods.
5. @RequestParam: Binds request parameters to method parameters. Or Extracts values from query string of a URL.
example: - @GetMapping("/products")
public String getProducts(@RequestParam(value = "category" , required = false) String category){

}
6. @PathVariable: Binds URI template variables to method parameters. Or Extracts values form the URI template of URL
example: - @GetMapping("/products/{productId}")
public String getProducts(@PathVariable Long category){
    
}
7. @RequestBody: Binds the HTTP request body to a method parameter.
8. @ResponseBody: Writes the return value to the HTTP response body.
9. @ModelAttribute: Binds form data to model attributes.


**Data Access Annotations:**

1. @Entity: Marks a class as a JPA entity.
2. @Table: Specifies the table name for a JPA entity.
3. @Id: Specifies the primary key column.
4. @Column: Specifies column mapping for entity properties.
5. @GeneratedValue: Specifies how the primary key is generated.
6. @Transactional: Marks a method as transactional.


**Testing Annotations:**

1. @SpringBootTest: Boots up a Spring application for testing.
2. @Test: Marks a method as a test method.
3. @RunWith: Specifies a test runner.
4. @MockBean: Creates a mock bean for testing.