package service;

import bean.Department;
import bean.Msg;
import mapper.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptServiceImpl implements DeptService{
    @Autowired
    DepartmentMapper departmentMapper;
    @Override
    public List<Department> getDepts() {
        return departmentMapper.selectByExample(null);
    }
}
