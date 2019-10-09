<%--
  Created by IntelliJ IDEA.
  User: LinKaiKai
  Date: 2019/09/23
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="utf-8">
		<title>LOG日志</title>
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

		<div class="layui-container" style="background-color: #A0DAF4;">
			<div class="layui-row" style="padding: 15px 0;">
				<div>账号：【${userName}】LOG操作日志</div>
			</div>
			<div class="layui-row" style="background-color: #ffffff;">
				<div style="padding: 10px;">
					<div class="layui-row">
						<div class="layui-input-inline">
							<input type="text" name="operateDatetime" id="operateDatetime" lay-verify="date" placeholder="请输入操作时间" autocomplete="off" class="layui-input">
						</div>
						<div class="layui-input-inline">
							<button type="button" id="select_log" class="layui-btn"><i class="layui-icon">&#xe615;</i>&nbsp;&nbsp;&nbsp;查&nbsp;询</button>
						</div>
					</div>
					<div class="layui-row">
						<table id="demo" lay-filter="test"></table>
					</div>
				</div>
			</div>
			<div>&nbsp;</div>
		</div>

		<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
		</script>

		<script src="${pageContext.request.contextPath}/RESOURCES/layui/layui.js"></script>
		<script>
			//Demo
			layui.use(['table', 'element', 'jquery', 'laydate'], function() {
				var table = layui.table,
					element = layui.element,
					$ = layui.jquery,
					laydate = layui.laydate;


				//第一个实例
				var tableIns = table.render({
					elem: '#demo',
					height: 312,
					url: 'showLog.json' //数据接口
						,
					page: true //开启分页,
						,
					limit: 4,
					limits: [4, 8, 10],
					cols: [
						[ //表头
							{
								field: 'id',
								title: 'ID',
								hide: 'true'
							}, {
								field: 'userName',
								title: '登陆账号',
								align: 'center',
								sort: true,
								unresize: true
							}, {
								field: 'operateInfo',
								title: '操作信息',
								align: 'center',
								unresize: true
							}, {
								field: 'operateDatetime',
								title: '操作时间',
								align: 'center',
								sort: true,
								unresize: true
							}
						]
					]
				});

				//日期
				laydate.render({
					elem: '#operateDatetime'
				});

				//查询log
				$('#select_log').click(function () {
					var operateDatetime = $("#operateDatetime").val();
					tableIns.reload({
						where: {
							operateDatetime:operateDatetime
						},page: {
							cull: 1
						}
					})
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
