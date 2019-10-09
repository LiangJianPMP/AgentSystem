<%--
  Created by IntelliJ IDEA.
  User: DXY
  Date: 2019/9/25
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://heerey525.github.io/layui-v2.4.3/layui/css/layui.css">
<html>
<head>
    <title>Title</title>
</head>
<style type="text/css">
    #ku{

        height: 500px;
        border: slategrey solid 1px;
    }

</style>
<script src="https://heerey525.github.io/layui-v2.4.3/layui/layui.js"></script>

<body>

<ul class="layui-nav layui-bg-cyan">
    <li class="layui-nav-item">
        <a href="javascript:;">代理商管理</a>
        <dl class="layui-nav-child">

            <dd><a href="${pageContext.request.contextPath}/JSP/AgentManage.jsp">代理商客户管理</a></dd>
            <dd><a href="${pageContext.request.contextPath}/JSP/CheckByDateAccountDetails.jsp">代理商预付款</a></dd>
            <%--            <dd><a href="">关键词申请管理</a></dd>--%>
            <dd><a href="${pageContext.request.contextPath}/JSP/CheckAccountLogs.jsp">操作日志</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item">
        <a href="javascript:;">门户管理</a>
        <dl class="layui-nav-child">
            <dd><a href="${pageContext.request.contextPath}/JSP/PMIndex.jsp">门户管理</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item">
        <a href="javascript:;">报表管理</a>
        <dl class="layui-nav-child">
            <dd><a href="${pageContext.request.contextPath}/JSP/reportForms.jsp">报表管理</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item">
        <a href="javascript:;">系统管理</a>
        <dl class="layui-nav-child">
            <dd><a href="${pageContext.request.contextPath}/finance.html">财务管理</a></dd>
            <dd><a href="${pageContext.request.contextPath}/role.html">角色管理</a></dd>
            <dd><a href="${pageContext.request.contextPath}/authority.html">角色权限管理</a></dd>
            <dd><a href="${pageContext.request.contextPath}/user.html">用户管理</a></dd>
            <dd><a href="${pageContext.request.contextPath}/keywords.html">关键词审核</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item">
        <a href="javascript:;">系统配置管理</a>
        <dl class="layui-nav-child">
            <dd><a href="${pageContext.request.contextPath}/JSP/finances.jsp">财务类型</a></dd>
            <dd><a href="${pageContext.request.contextPath}/JSP/serve.jsp">服务类型</a></dd>
            <dd><a href="${pageContext.request.contextPath}/JSP/addnian.jsp">服务年限</a></dd>
            <dd><a href="${pageContext.request.contextPath}/JSP/addsite.jsp">APP地址</a></dd>
            <dd><a href="${pageContext.request.contextPath}/JSP/kehu.jsp">客户类型</a></dd>
            <dd><a href="${pageContext.request.contextPath}/JSP/sfz.jsp">证件类型</a></dd>
            <dd><a href="${pageContext.request.contextPath}/JSP/youhu.jsp">优惠类型</a></dd>
        </dl>
    </li>
</ul>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <div id="ku" >
        <div class="layui-input-block" align="center">

            <div class="layui-form-item">
                <h3 >APP URL管理-填写制作APP的系统的URL地址</h3>
            </div>

        </div>

        <hr>
       <form action="appadd" method="post">
           <div class="layui-input-block" align="center">

                   <div class="layui-form-item">
                           <input type="text" id="name" name="name" required="" lay-verify="required" placeholder="请输入URL地址" autocomplete="off" class="layui-input layui-form-danger" style="width: 300px  " readonly="readonly">

                   </div>

           </div>
                   <div class="layui-input-block" align="center">

                           <div class="layui-form-item" >
                                   <input type="text" name="url" required="" id="url" lay-verify="required" placeholder="请输入配置数值" autocomplete="off" class="layui-input layui-form-danger"style="width: 300px">

                           </div>
                   </div>

                   <div class="layui-form-item" align="center">

                       <button class="layui-btn" type="button" id="add" onclick="test()">确认</button>
                           <button class="layui-btn layui-btn-primary" type="reset">重置</button>

                   </div>



       </form>

    </div>





<script type="text/javascript">

    layui.use(['element','table'], function() {
        var element = layui.element;
        var table = layui.table;
    })
    function test() {
        var a = $("#name").val();
        var b = $("#url").val();

        $(function () {


            if(b==""){
                layer.confirm('url不能为空',{
                    btn: ['确定'] //可以无限个按钮
                    ,function(index, layero){

                    }
                });
            }else{

                $.ajax({
                    url: 'appadd',
                    type: 'GET',
                    data: {"configValue":b },
                    dataType: 'json',
                    success: function (result) {
                        datas = result;

                        if(result){
                            layer.confirm('修改成功',{
                                btn: ['确定'] //可以无限个按钮
                                ,function(index, layero){

                                }
                            });
                        }


                    },
                    erorr: function () {
                        alert("有异常！");
                    }

                })

            }



    }
        )}

</script>
<script>
    layui.use('element', function(){
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function(elem){
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>

</body>
</html>
