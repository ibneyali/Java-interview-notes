import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class Employee{
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
