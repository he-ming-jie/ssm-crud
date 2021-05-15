package controller;

import bean.Employee;
import bean.Msg;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import service.EmpService;
import java.util.List;
@Controller
public class EmpController {
    @Autowired
    EmpService empService;
    /**
     * 分页查询员工返回json格式
     */
    @RequestMapping(value = "/empsWithJson")
    @ResponseBody
    public Msg EmpsWithJson(@RequestParam(value = "page",defaultValue = "1")Integer page){
        PageHelper.startPage(page,8);
        List<Employee> list = empService.getAll();
        // pageInfo 包装查询结果,里面有很多信息可以交给页面
        PageInfo pageInfo = new PageInfo(list);
        return Msg.success().add("pageInfo",pageInfo);
    }

    /**
     * 分页查询员工
     */
    @RequestMapping(value = "/emps")
    public String Emps(@RequestParam(value = "page",defaultValue = "1")Integer page, Model model){
        PageHelper.startPage(page,10);
        List<Employee> list = empService.getAll();
        // pageInfo 包装查询结果,里面有很多信息可以交给页面
        PageInfo pageInfo = new PageInfo(list);
        model.addAttribute("pageInfo",pageInfo);
        return "list";
    }

    /**
     * 添加员工
     */
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public Msg addEmp(Employee employee){
        empService.addEmp(employee);
        return Msg.success();
    }

    /**
     * 查询员工
     */
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg searchEmp(@PathVariable("id")Integer id){
        Employee employee = empService.searchEmp(id);
        return Msg.success().add("emp",employee);
    }

    /**
     * 更新员工
     */
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg saveEmp(@PathVariable("empId")Integer empId, Employee employee){
        employee.setEmpId(empId);
        empService.saveEmp(employee);
        return Msg.success();
    }

    /**
     * 删除员工
     */
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteByIdEmp(@PathVariable("empId")Integer empId){
        empService.deleteEmp(empId);
        return Msg.success();
    }
}
