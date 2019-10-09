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
		<title>角色管理</title>
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
				<div>系统管理\角色管理</div>
			</div>
			<div class="layui-row" style="background-color: #ffffff;">
				<div style="padding: 10px;">
					<div>
						<button id="addRole" type="button" class="layui-btn"><i class="layui-icon">&#xe654;</i>&nbsp;&nbsp;&nbsp;新&nbsp;增</button>
					</div>
					<div>
						<table id="demo" lay-filter="test"></table>
					</div>
				</div>
			</div>
			<div>&nbsp;</div>
		</div>

		<div id="operation_role" align="center" style="width: 500px;height: 300px;position: fixed;top: 20%;left: 37%;border: #0C0C0C solid 1px;background-color: #FFFFFF;display: none;">
			<div style="width: 400px;">
				<div style="margin: 30px 0;padding-bottom: 10px;border-bottom: #000000 solid 1px;">
					<h2 id="description"></h2>
				</div>
				<form class="layui-form" id="from_role" method="post">
					<input type="hidden" name="id" id="id">
					<div class="layui-form-item">
						<label class="layui-form-label">角色名称：</label>
						<div class="layui-input-inline">
							<input type="text" id="roleName" name="roleName" required lay-verify="required" placeholder="请输入角色名称" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">是否启用：</label>
						<div class="layui-input-inline">
							<select name="isStart" id="isStart" lay-verify="required">
								<option value="1">启用</option>
								<option value="2">未启用</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block" style="margin-left: 0;">
							<button class="layui-btn" lay-submit lay-filter="formDemo">保存</button>
							<a id="close" class="layui-btn">取消</a>
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		</script>

		<script src="${pageContext.request.contextPath}/RESOURCES/layui/layui.js"></script>
		<script>
			//Demo
			layui.use(['table', 'element', 'jquery'], function() {
				var table = layui.table,
					element = layui.element,
					$ = layui.jquery;

				//第一个实例
				table.render({
					elem: '#demo',
					height: 312,
					url: 'showRole.json' //数据接口
						,
					page: true //开启分页,
						,
					limit: 4
						,
					limits: [4,8,10]
						,
					cols: [
						[ //表头
							{
								field: 'id',
								title: 'ID',
								hide: true
							}, {
								field: 'roleName',
								title: '用户名称',
								align: 'center',
								sort: true,
								unresize: true
							}, {
								field: 'creationTime',
								title: '创建时间',
								align: 'center',
								sort: true,
								unresize: true
							}, {
								field: 'isStart',
								title: '是否使用',
								align: 'center',
								templet: function(d){
									if(d.isStart=="1"){
										return "启用";
									}else{
										return "未启用";
									}
								},
								unresize: true
							}, {
								field: 'sign',
								title: '操作',
								align: 'center',
								toolbar: '#barDemo',
								unresize: true
							}
						]
					]
				});
				
				//监听行工具事件
				table.on('tool(test)', function(obj) {
					var data = obj.data;
					//console.log(obj)
					if (obj.event === 'del') {
						layer.confirm('真的删除了么', {icon: 3}, function () {
							$(location).attr('href', 'delRole.html/'+data.id);
						});
					} else if (obj.event === 'edit') {
						$('#id').val(data.id);
						$('#roleName').val(data.roleName);
						$('#isStart').val(data.isStart);
						$('#from_role').attr('action','updRole.html');
						$('#description').text('修改角色信息');
						$('#operation_role').show();
					}
				});

				$('#close').click(function () {
					$("#operation_role").hide();
				});

				$('#addRole').click(function () {
					$('#description').text('添加角色信息');
					$('#from_role').attr('action','addRole.html');
					$('#operation_role').show();
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
