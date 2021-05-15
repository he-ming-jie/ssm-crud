<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap 101 Template</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <!-- 员工修改 模态框-->
    <div class="modal fade" id="empUpdatemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">员工修改</h4>
                </div>
                <div class="modal-body">
                    <!--          表单内容              -->
                    <form class="form-horizontal" id="emp_update_form">
                        <div class="form-group">
                            <label for="emp_name_input" class="col-sm-2 control-label">empName</label>

                            <p class="form-control-static" id="emp_name_static_update"></p>
                        </div>
                        <div class="form-group">
                            <label for="emp_email_input" class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="emp_email_input_update" placeholder="email" name="email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" id="emp_gender_update1" value="M" name="gender" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" id="emp_gender_update2" value="F" name="gender"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">部门名</label>
                            <div class="col-sm-5">
                                <select class="form-control" name="dId" id="depts_update">

                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="emp_update_save">更新</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 员工添加 模态框 -->
    <div class="modal fade" id="empAddmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">员工添加</h4>
                </div>
                <div class="modal-body">
                    <!--          表单内容              -->
                    <form class="form-horizontal" id="emp_add_form">
                        <div class="form-group">
                            <label for="emp_name_input" class="col-sm-2 control-label">empName</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="emp_name_input" placeholder="empName" name="empName">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="emp_email_input" class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="emp_email_input" placeholder="email" name="email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" id="emp_gender_input1" value="M" name="gender" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" id="emp_gender_input2" value="F" name="gender"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">部门名</label>
                            <div class="col-sm-5">
                                <select class="form-control" name="dId" id="depts_add">

                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="emp_save">保存</button>
                </div>
            </div>
        </div>
    </div>
    <!--标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>ssm-crud</h1>
        </div>
    </div>
    <!--按钮 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button id="emp_add_btn" class="btn btn-primary" data-toggle="modal" data-target="#myModal">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <!--表格 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <!--分页信息 -->
    <div class="row">
        <!-- 分页文字信息-->
        <div class="col-md-6" id="page_info_area">
        </div>
        <!--分页条信息 -->
        <div class="col-md-6" id="page_nav_area">
        </div>
    </div>
    <script type="text/javascript">
        var currentPageNum ;
        $(function () {
            to_page(1);
        });
        function to_page(page) {
            $.ajax({
                url:"http://localhost:8080/ssm-crud/empsWithJson",
                data:"page="+page,
                type:"GET",
                success:function (res) {
                    //console.log(res);
                    //解析并显示员工数据
                    build_emps_table(res);
                    //解析并显示分页数据
                    build_page_info(res);
                    build_page_nav(res);
                }
            });

        }
        function build_emps_table(res) {
            $("#emps_table tbody").empty();
            var emps = res.extend.pageInfo.list;
            $.each(emps,function (index,item) {
                /**
                 * <button class="btn btn-primary">新增</button>
                 * @type {void | jQuery}
                 */
                var empIdTd = $("<td></td>").append(item.empId);
                var empNameTd = $("<td></td>").append(item.empName);
                var gender = item.gender=="M"?"男":"女";
                var genderTd = $("<td></td>").append(gender);
                var emailTd = $("<td></td>").append(item.email);
                var deptNameTd = $("<td></td>").append(item.department.deptName);
                var editBtn = $("<button></button>").addClass("btn btn-primary edit_btn").append($("<span></span>")).append("修改");
                var deleteBtn = $("<button></button>").addClass("btn btn-primary delete_btn").append($("<span></span>")).append("删除");
                editBtn.attr("edit_id",item.empId);
                deleteBtn.attr("del_id",item.empId);
                var btn = $("<td></td>").append(editBtn).append(" ").append(deleteBtn);
                $("<tr></tr>").append(empIdTd).append(empNameTd)
                    .append(genderTd).append(emailTd).append(deptNameTd)
                    .append(btn).appendTo("#emps_table tbody");
            })
        }
        //解析分页信息
        function build_page_info(res) {
            $("#page_info_area").empty();
            $("#page_info_area")
                .append("当前" + res.extend.pageInfo.pageNum + "页,总共"
                    + res.extend.pageInfo.pages + "页.总共"
                    + res.extend.pageInfo.total+ "条记录");
            currentPageNum = res.extend.pageInfo.pageNum;
        }
        //解析分页条
        function build_page_nav(res) {
            $("#page_nav_area").empty();
            var ul = $("<ul></ul>").addClass("pagination");
            var firstPage = $("<li></li>").append($("<a></a>").append("首页")).attr("herf","#");
            firstPage.click(function () {
                to_page(1);
            })
            var lastPage = $("<li></li>").append($("<a></a>").append("末页")).attr("herf","#");
            lastPage.click(function () {
                to_page(res.extend.pageInfo.pages);
            })
            ul.append(firstPage);
            $.each(res.extend.pageInfo.navigatepageNums,function (index, item) {
                var numLi = $("<li></li>").append($("<a></a>").append(item));
                if (res.extend.pageInfo.pageNum == item){
                    numLi.addClass("active");
                }
                numLi.click(function () {
                    to_page(item);
                })
                ul.append(numLi);
            })
            ul.append(lastPage);
            var nav = $("<nav></nav>").append(ul);
            $("#page_nav_area").append(nav);
        }
        //删除员工
        $(document).on("click",".delete_btn",function () {
            // $(this).parents("tr").find("td:eq(1)").text();
            $.ajax({
                url:"http://localhost:8080/ssm-crud/emp/"+$(this).attr("del_id"),
                type:"DELETE",
                success:function (res) {
                    alert(res.msg);
                    to_page(currentPageNum);
                }
            });
        })
        //修改员工弹出模态框edit_btn ,edit_btn前面要加点
        $(document).on("click",".edit_btn",function () {
            // 显示员工信息 和 要选择的部门信息
            getEmp($(this).attr("edit_id"));
            getDepts("#depts_update");
            //传递id 给模态框的更新按钮
            $("#emp_update_save").attr("edit-id",$(this).attr("edit_id"));
            $("#empUpdatemodal").modal({
                backdrop:"static"
            });
        })
        //新增员工弹出模态框
        $("#emp_add_btn").click(function () {
            getDepts("#depts_add");
            $("#empAddmodal").modal({
                backdrop:"static"
            });
        })
        //查出所有部门信息，显示在下拉列表中
        function getDepts(ele) {
            $(ele).empty();
            $.ajax({
                url:"http://localhost:8080/ssm-crud/depts",
                type:"GET",
                success:function (res) {
                    $("#depts").append();
                    $.each(res.extend.depts,function () {
                        var option = $("<option></option>").attr("value",this.deptId).append(this.deptName);
                        option.appendTo(ele)
                    })
                }
            });
        }
        //查出员工信息
        function getEmp(id) {
            $.ajax({
                url:"http://localhost:8080/ssm-crud/emp/"+id,
                type:"GET",
                success:function (res) {
                    // $("#depts").append();
                    // $.each(res.extend.depts,function () {
                    //     var option = $("<option></option>").attr("value",this.deptId).append(this.deptName);
                    //     option.appendTo("#depts")
                    // })
                    var emp = res.extend.emp;
                    $("#emp_name_static_update").text(emp.empName);
                    $("#emp_email_input_update").val(emp.email);
                    $("#empUpdatemodal input[name=gender]").val([emp.gender]);
                    $("#empUpdatemodal select[id=depts_update]").val([emp.dId]);
                }
            });
        }
        //保存员工，添加员工
        $("#emp_save").click(function () {
            $.ajax({
                url:"http://localhost:8080/ssm-crud/emp",
                type:"POST",
                data:$("#emp_add_form").serialize(),
                success:function (res) {
                    alert(res.msg);
                    $("#empAddmodal").modal("hide");
                    to_page(99999);
                }
            });
        })
        //更新员工按钮事件
        $("#emp_update_save").click(function () {
            $.ajax({
                url:"http://localhost:8080/ssm-crud/emp/"+$(this).attr("edit-id"),
                type:"POST",
                data:$("#emp_update_form").serialize()+"&_method=PUT",
                success:function (res) {
                    alert(res.msg);
                    $("#empUpdatemodal").modal("hide");
                    to_page(currentPageNum);
                }
            });
        })
    </script>
</div>
</body>
</html>
