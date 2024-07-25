import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

public class EmployeeTest {
    
    public static void main(String[] args) {

        List<Employee> emp = Arrays.asList(
                new Employee(1L, "Bill Gates", 100000.0, "Admin"), 
                new Employee(2L, "Jeff Bezos", 200000.0, "Account"), 
                new Employee(3L, "Tim cook", 40000.0, "IT"),
                new Employee(4L, "Jack Ma", 50000.0, "IT"));
                
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

        //Get all the employee's only name whose salary is grater than or equal 100000
        Map<Long, String> name = emp.stream().filter(r->r.getSal()>=100000).collect(Collectors.toMap(Employee::getId, Employee::getName));
        System.out.println("name of employee's only name whose salary is grater than or equal 100000" + name);

    }
    
}
