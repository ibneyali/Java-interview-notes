import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

class Employee{
	private String name;
	private Double Sal;
	private String dept;
	
	public Employee(String name, Double sal, String dept) {
		this.name = name;
		Sal = sal;
		this.dept = dept;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getSal() {
		return Sal;
	}
	public void setSal(Double sal) {
		Sal = sal;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	@Override
	public String toString() {
		return "Employee [name=" + name + ", Sal=" + Sal + ", dept=" + dept + "]";
	}
	
}

public class EmployeeTest {

	public static void main(String[] args) {
		
		List<Employee> emp = Arrays.asList(
				new Employee("Ikram Ali", 100000.0, "Admin"), 
				new Employee("Sunil", 6000.0, "Account"), 
				new Employee("Ali", 1200.0, "IT"),
				new Employee("Ali Ibraheem", 17772.0, "IT"));
		
		List<Employee> result = emp.stream()
				.sorted((o1, o2) -> o1.getDept().compareTo(o2.getDept()))
				.collect(Collectors.toList());
				
		//List<Employee> result1 = emp.stream().sorted((a,a1)->a.getDept())
		
		System.out.println(result);
	}
}
