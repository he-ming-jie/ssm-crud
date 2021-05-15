package controller;

import bean.Department;
import bean.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.DeptService;
import java.util.List;
@Controller
public class DeptController {
    @Autowired
    DeptService deptService;

    /**
     * 返回所有部门
     */
    @RequestMapping(value = "/depts")
    @ResponseBody
    public Msg getDepts(){
        List<Department> depts = deptService.getDepts();
        return Msg.success().add("depts",depts);
    }
}

