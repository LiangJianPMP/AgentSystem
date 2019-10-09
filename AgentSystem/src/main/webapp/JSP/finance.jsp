<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>财务管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/RESOURCES/layui/css/layui.css">
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


    <div class="layui-container" style="background-color: #A0DAF4">
        <div class="layui-row" style="padding: 15px 0;">
            <div>系统管理\财务管理</div>
        </div>
        <div class="layui-row" style="background-color: #ffffff;">
            <div style="padding: 10px;">
                <form class="layui-form" action="addFinance.html" method="post">
                    <div class="layui-form-item">
                        <label class="layui-form-label">搜索用户：</label>
                        <div class="layui-input-inline">
                            <select name="userId" lay-verify="required">
                                <option value=" ">-请选择-</option>
                                <c:forEach var="user" items="${users}">
                                    <option value="${user.id}">${user.userCode}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="layui-form-mid layui-word-aux">请选择你的用户</div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">操作类型：</label>
                        <div class="layui-input-inline">
                            <select name="detailType" lay-verify="required">
                                <option value=" ">-请选择-</option>
                                <c:forEach var="systemConfig" items="${systemConfigs}">
                                    <option value="${systemConfig.id}">${systemConfig.configTypeName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">操作资金：</label>
                        <div class="layui-input-inline">
                            <input type="text" name="accountMoney" required lay-verify="required" placeholder="请输入操作资金" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux">重要提示：输入的资金数，正数（1000）为向账户增加1000圆，负数（-1000）为向账户减少1000圆，精确到小数点两位数</div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">操作备注：</label>
                        <div class="layui-input-block">
                            <textarea name="memo" placeholder="请输入备注" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <h2 style="color: #FF0000">${show}</h2>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div>&nbsp;</div>
    </div>


    <script src="${pageContext.request.contextPath}/RESOURCES/layui/layui.js"></script>
    <script>
        //Demo
        layui.use(['form','element'], function(){
            var form = layui.form,
                element = layui.element;

            //监听提交
            form.on('submit(formDemo)', function(){
                return true;
            });
        });
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
