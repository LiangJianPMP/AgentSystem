<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/RESOURCES/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/RESOURCES/layui/layui.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <title>查看账户明细</title>
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

<table class="layui-table">
    <colgroup>
        <col width="200">
        <col width="200">
        <col width="200">
        <col>
    </colgroup>
    <thead>
    <tr>
        <th>序号</th>
        <th>用户名称</th>
        <th>操作信息</th>
        <th>操作时间</th>
    </tr>
    </thead>
    <tbody id="biuuu_city_list">

    </tbody>
</table>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend></legend>
</fieldset>
<div id="demo3"></div>


<script>
    var datas;//所有客户数据
    $(function () {
        $.ajax({
            url : '${pageContext.request.contextPath}/logs/getLogs.json',
            type : 'post',
            data : null,
            dataType : 'json',
            async: false,
            success : function(result) {
                console.log("数据得到的");
                datas = result;
                console.log(datas);
                dataload();
            },
            erorr : function() {
                alert("有异常！");
            }
        })
    })
    //数据加载
    function dataload(){
        layui.use(['table','laypage'],function(){
            var table=layui.table;
            var laypage=layui.laypage;
            //每页显示条数
            var nums=5;
            //自定义首页、尾页、上一页、下一页文本
            laypage.render({
                first: '首页'
                ,last: '尾页'
                ,prev: '<em>←</em>'
                ,next: '<em>→</em>'
                ,elem: 'demo3'
                ,count: datas.length
                ,limit:nums
                ,jump: function(obj){
                    //模拟渲染
                    document.getElementById('biuuu_city_list').innerHTML = function(){
                        var curr=obj.curr;
                        var arr = []
                            ,thisData = datas.concat().splice(curr*nums-nums, nums);
                        console.log(thisData)

                        layui.each(thisData, function(index, item){

                            var ht="<tr>\n" +
                                "                <th>"+item.id+"</th>\n" +
                                "                <th>"+item.userName+"</th>\n" +
                                "                <th>"+item.operateInfo+"</th>\n" +
                                "                <th>"+item.operateDatetime+"</th>\n" +
                                "            </tr>"
                            arr.push(ht);
                        });
                        return arr.join('');
                    }();
                }
            });
        })
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
