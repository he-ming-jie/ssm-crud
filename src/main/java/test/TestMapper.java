package test;

import bean.Department;
import bean.Employee;
import mapper.DepartmentMapper;
import mapper.EmployeeMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * @ContextConfiguration
 */
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class TestMapper {
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSessionTemplate sqlSessionTemplate;
    /**
     * test dept mapper
     */
    @Test
    public void test(){
        //获取ioc容器，拿bean
//        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
//        ioc.getBean(DepartmentMapper.class);
//        departmentMapper.insertSelective(new Department(null,"开发部"));
//        departmentMapper.insertSelective(new Department(null,"测试部"));
//        employeeMapper.insertSelective(new Employee(null,"sally","F","111111@qq.com",2));
        EmployeeMapper mapper = sqlSessionTemplate.getMapper(EmployeeMapper.class);
        for (int i = 0;i < 1000; i++){
            String uuid = UUID.randomUUID().toString().substring(0, 5)+i;
            mapper.insertSelective(new Employee(null,uuid,"M","@qq.com",1));
        }
    }
}
