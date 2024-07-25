import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class Employee{
	private Long id;
	private String name;
	private Double sal;
	private String dept;
	
	public Employee(Long id, String name, Double sal, String dept) {
		this.id=id;
		this.name = name;
		this.sal = sal;
		this.dept = dept;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getSal() {
		return sal;
	}
	public void setSal(Double sal) {
		this.sal = sal;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Employee [id=" + id + ", name=" + name + ", sal=" + sal + ", dept=" + dept + "]";
	}
	
	
}
