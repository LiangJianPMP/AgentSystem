<%--
  Created by IntelliJ IDEA.
  User: LinKaiKai
  Date: 2019/09/23
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
		<meta charset="utf-8">
		<title>角色权限配置</title>
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
				<div>系统管理\角色权限配置</div>
			</div>
			<div class="layui-row" style="background-color: #ffffff;">
				<div style="padding: 10px;">
					<div class="layui-tab layui-tab-brief" lay-filter='docDemoTabBrief'>
						<ul class="layui-tab-title">
							<c:forEach var="role" items="${roles}" varStatus="status">
								<li class="role_li <c:if test='${status.count==1}'>layui-this</c:if>" value="${role.id}" >${role.roleName}</li>
							</c:forEach>
						</ul>
						<div class="layui-tab-content">
							<h1 align="center" style="border-bottom: #0C0C0C 1px solid">功能列表</h1>
							<div class="layui-tab-item layui-show">
								<table id="demo" lay-filter="test"></table>
                            </div>
						</div>
					</div>
				</div>
			</div>
			<div>&nbsp;</div>
		</div>


		<div id="operation_function" align="center" style="width: 500px;height: 250px;position: fixed;top: 20%;left: 37%;border: #0C0C0C solid 1px;background-color: #FFFFFF;display: none;">
			<div style="width: 400px;">
				<div style="margin: 30px 0;padding-bottom: 10px;border-bottom: #000000 solid 1px;">
					<h2 id="description"></h2>
				</div>
				<form class="layui-form" id="from_function" method="post">
					<input type="hidden" name="functionId" id="functionId">
					<input type="hidden" name="roleId" id="roleId">
					<div class="layui-form-item">
						<label class="layui-form-label">是否启用：</label>
						<div class="layui-input-inline">
							<select name="isStart" id="isStart" lay-verify="required">
								<option value="1">启用</option>
								<option value="0">未启用</option>
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
			<a class="layui-btn layui-btn-xs" lay-event="edit">设置角色功能权限</a>
		</script>
		
		<script src="${pageContext.request.contextPath}/RESOURCES/layui/layui.js"></script>
		<script>
			//Demo
			layui.use(['table', 'element', 'jquery'], function() {
				var table = layui.table,
					element = layui.element,
					$ = layui.jquery;

				var roleId = 2;

				table.render({
					elem: '#demo'
					,url: 'showFunction.json' //设置异步接口
					,cols: [[
						{type:'numbers'},
						{field: 'id',hide: true},
						{field: 'functionName', title: '功能名称', align: 'center', sort: true, unresize: true},
						{field: 'funcUrl', title: '功能URL', align: 'center', unresize: true},
						{field: 'creationTime', title: '创建时间', align: 'center', sort: true, unresize: true},
						{field: 'isStart', title: '是否使用', align: 'center', unresize: true, templet: function(d){
								if(d.isStart=="1"){
									return "启用";
								}else{
									return "未启用";
								}
							}},
						{title: '设置权限',align: 'center',unresize: true,toolbar: '#barDemo'}
					]]//设置表头
				});
				
				$('.role_li').click(function () {
					roleId = this.value;
				})

				//监听行工具事件
				table.on('tool(test)', function(obj){
					var data = obj.data;
					//console.log(obj)
					if(obj.event === 'edit'){
						$('#functionId').val(data.id);
						$('#roleId').val(roleId);
						$('#from_function').attr('action','updFunction.html');
						$('#description').text('【'+roleId+'】的功能权限设置');
						$('#operation_function').show();
					}
				});

				$('#close').click(function () {
					$("#operation_function").hide();
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
