import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class EmployeeTest {
    
    public static void main(String[] args) {
            
        List<Employee> emp = Arrays.asList(
                new Employee("Bill Gates", 100000.0, "Admin"), 
                new Employee("Jeff Bezos", 200000.0, "Account"), 
                new Employee("Tim cook", 40000.0, "IT"),
                new Employee("Jack Ma", 50000.0, "IT"));
                
        //Sort employee according to department
        List<Employee> sortDept = emp.stream()
                .sorted((o1, o2) -> o1.getDept().compareTo(o2.getDept()))
                .collect(Collectors.toList());

        System.out.println("Sort employee using dept: "+sortDept);
        

        //Get highest salaried employee
        Employee highest = emp.stream().max(Comparator.comparing(Employee::getSal)).orElse(null);

        System.out.println("Highest salary of employee: "+highest);

        //Get 2nd highest paid employee

        Optional<Employee> secondHigest = emp.stream()
        .sorted(Comparator.comparing(Employee::getSal).reversed()).skip(1)
        .findFirst();

        System.out.println("2nd highest paid employee: "+ secondHigest.get());

        
    }
    
}
