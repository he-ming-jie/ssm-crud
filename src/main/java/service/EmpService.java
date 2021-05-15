package service;

import bean.Employee;
import java.util.List;
public interface EmpService {
    List<Employee> getAll();
    Integer addEmp(Employee employee);

    Employee searchEmp(Integer id);

    Integer saveEmp(Employee employee);

    Integer deleteEmp(Integer empId);
}
