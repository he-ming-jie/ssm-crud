package service;

import bean.DepartmentExample;
import bean.Employee;
import bean.EmployeeExample;
import mapper.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmpServiceImpl implements EmpService{
    @Autowired
    EmployeeMapper employeeMapper;
    @Override
    public List<Employee> getAll() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    @Override
    public Integer addEmp(Employee employee) {
        return employeeMapper.insertSelective(employee);
    }

    @Override
    public Employee searchEmp(Integer id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    @Override
    public Integer saveEmp(Employee employee) {
        return employeeMapper.updateByPrimaryKeySelective(employee);
    }

    @Override
    public Integer deleteEmp(Integer empId) {
        return employeeMapper.deleteByPrimaryKey(empId);
    }
}
