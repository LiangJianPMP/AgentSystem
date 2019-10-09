<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" href="https://heerey525.github.io/layui-v2.4.3/layui/css/layui.css">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'login.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cac he">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">



    <style type="text/css">


    </style>

</head>

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

<script src="https://heerey525.github.io/layui-v2.4.3/layui/layui.js"></script>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<button class="layui-btn layui-btn-sm" type="button" id="add" onclick="test()">用户添加</button>

<table class="layui-table" id="user" lay-filter="user"></table>

<script type="text/html" id="barDemo">
        <a><button class="layui-btn layui-btn-sm" type="button"><i class="layui-icon" lay-event="edit"></i></button></a>
        <a><button  class="layui-btn layui-btn-sm" type="button"><i class="layui-icon" lay-event="del"></i></button></a>
</script>


<script type="text/javascript">
    var j;
        //全部用户信息
    var datas;
    //窗口加载
    $(function() {

        $.ajax({
            url : 'sfzshow',
            type : 'GET',
            data : null,
            dataType : 'json',
            success : function(result){

                datas = result;
            },
            erorr : function() {
                alert("有异常！");
            }
        })
    })


    layui.use(['element','table'], function() {
        var element = layui.element;
        var table = layui.table;

        table.render({

            elem : '#user',
            cols : [ [
                {
                    field : 'id',
                    title : '用户id',
                    unresize : true,
                    sort : true
                },
                {
                    field : 'configTypeName',
                    title : '配置类型',
                    unresize : true,
                    sort : true
                },
                {
                    field : 'isStart',
                    title : '是否启用',
                    unresize : true,
                    templet : function(d) {
                        return d.isStart == 1 ? '启用' : '未启用';
                    }
                },
                {
                    fixed : 'right',
                    title : '操作',
                    toolbar : '#barDemo',
                    unresize : true
                }
            ] ],
            data : datas,
            page : true,
            limit : 8,
            limits : [ 8, 10, 15, 20 ]
        });


        //监听行工具事件
        table.on('tool(user)',function(obj) {
            var data = obj.data;
            //console.log(obj)
            if (obj.event === 'del') {
                layer.confirm('真的删除行么', function(index) {
                    var a=data.id;
                    window.location.href = "sfzdel?id="+data.id+"";
                    layer.close(index);

                });
            } else if (obj.event === 'edit') {

                var a = data.id;
                $(function () {

                    $.ajax({
                        url: 'sfzid',
                        type: 'GET',
                        data: {"id": a},
                        dataType: 'json',
                        success: function (result) {
                            j = result[0].configTypeName
                            var xi = result[0].isStart
                            var aaa = result[0].id
                            var cnm = result[0].configValue


                            layer.confirm('<div style="padding: 50px 30px;">' + '<b>您正在进行修改操作</b><hr><br><form action="sfzupdate" method="get" id="Sub">类型名称:<input type="text" name="configTypeName" id="name"><br><br>是否启用:<select  name="isStart" id="index"><option  value="1">启用</option><option   value="2">不启用</option></select><br> <br><input type="hidden" id="sa" name="id"></form>' + '</div>', {
                                btn: ['修改', '取消'] //可以无限个按钮
                                , yes: function (index, layero) {
                                    $("#Sub").submit();
                                }
                            }, function (index, layero) {

                            });
                            $("#asd ").val(cnm);
                            $("#sa").val(aaa);
                            $("#name").val(j);

                            if (xi == 1) {
                                var a = $("#index").val();
                                $("#index").attr("selected", true);

                            } else if (xi == 2) {
                                document.getElementById("index")[1].selected = true;

                            }
                        },
                        erorr : function() {
                            alert("有异常！");
                        }
                    })
                })
            }
        });

    })





    function test(){
        layer.confirm('<div style="padding: 50px 30px;">' + '<b>您正在进行修改操作</b><hr><br><form action="sfzadd" method="get" id="Sub">类型名称:<input type="text" name="configTypeName" id="name"><br><br>是否启用:<select  name="isStart" id="index"><option  value="1">启用</option><option   value="2">不启用</option></select><br> <br><input type="hidden" id="sa" name="configType" value="6"></form>' + '</div>', {
            btn: ['添加', '取消'] //可以无限个按钮
            ,yes: function(index, layero){
                $("#Sub").submit();
            }
        }, function(index, layero){

        });

    }




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
