<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="utf-8">
		<title>用户管理</title>
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
				<div>系统管理\用户管理</div>
			</div>
			<div class="layui-row" style="background-color: #ffffff;">
				<div style="padding: 10px;">
					<div class="layui-form">
						<div class="layui-row">
							<div class="layui-col-md1" style="width: 7%;">
								<div style="line-height: 38px;"> &nbsp;用户名称：</div>
							</div>
							<div class="layui-col-md2">
								<div class="layui-input-inline">
									<input type="text" name="select_userCode" id="select_userCode" required lay-verify="required" placeholder="请输入用户名称" autocomplete="off"
										   class="layui-input">
								</div>
							</div>
							<div class="layui-col-md1" style="width: 5%;">
								<div style="line-height: 38px;"> &nbsp;角色：</div>
							</div>
							<div class="layui-col-md2">
								<div class="layui-input-inline">
									<select name="select_roleId" id="select_roleId" lay-verify="required">
										<option value=" ">-请选择-</option>
										<c:forEach var="role" items="${roles}">
											<option value="${role.id}">${role.roleName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="layui-col-md1" style="width: 7%;">
								<div style="line-height: 38px;"> &nbsp;是否启用：</div>
							</div>
							<div class="layui-col-md2">
								<div class="layui-input-inline">
									<select name="select_isStart" id="select_isStart" lay-verify="required">
										<option value=" ">-请选择-</option>
										<option value="1">启用</option>
										<option value="2">未启用</option>
									</select>
								</div>
							</div>
							<div class="layui-col-md3">
								&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" id="select_user" class="layui-btn"><i class="layui-icon">&#xe615;</i>&nbsp;&nbsp;&nbsp;查&nbsp;询</button>
							</div>
						</div>
					</div>
					<div class="layui-row" style="margin-top: 10px;">
						<button id="addUser" type="button" class="layui-btn"><i class="layui-icon">&#xe654;</i>&nbsp;&nbsp;&nbsp;新&nbsp;增</button>
					</div>
					<div class="layui-row">
						<table id="demo" lay-filter="test"></table>
					</div>
				</div>
			</div>
			<div>&nbsp;</div>
		</div>

		<div id="operation_user" align="center" style="width: 500px;height: 500px;position: fixed;top: 20%;left: 37%;border: #0C0C0C solid 1px;background-color: #FFFFFF;display: none;">
			<div style="width: 400px;">
				<div style="margin: 30px 0;padding-bottom: 10px;border-bottom: #000000 solid 1px;">
					<h2 id="description"></h2>
				</div>
				<form class="layui-form" id="from_user" method="post">
					<input type="hidden" name="id" id="id">
					<div class="layui-form-item">
						<label class="layui-form-label">登录账号：</label>
						<div class="layui-input-inline">
							<input type="text" id="userCode" name="userCode" required lay-verify="required" placeholder="请输入登录账号" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">用户名称：</label>
						<div class="layui-input-inline">
							<input type="text" id="userName" name="userName" required lay-verify="required" placeholder="请输入用户名称" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">登录密码：</label>
						<div class="layui-input-inline">
							<input type="password" id="userPassword" name="userPassword" required lay-verify="required" placeholder="请输入用户登录密码" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">角色：</label>
						<div class="layui-input-inline">
							<select name="roleId" id="roleId" lay-verify="required">
								<option value=" ">-请选择-</option>
								<c:forEach var="role" items="${roles}">
									<option value="${role.id}">${role.roleName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">是否启用：</label>
						<div class="layui-input-inline">
							<select name="isStart" id="isStart" lay-verify="required">
								<option value=" ">-请选择-</option>
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
			<a class="layui-btn layui-btn-xs" lay-event="payment">预支付</a>
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="log">LOG日志</a>
		</script>

		<script src="${pageContext.request.contextPath}/RESOURCES/layui/layui.js"></script>
		<script>
			//Demo
			layui.use(['table', 'element', 'jquery'], function() {
				var table = layui.table,
					element = layui.element,
					$ = layui.jquery;

				//第一个实例
				var tableIns = table.render({
					elem: '#demo',
					height: 312,
					url: '${pageContext.request.contextPath}/showUser.json' //数据接口
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
								hide: true
							}, {
								field: 'userCode',
								title: '登录账号',
								align: 'center',
								width: '15%',
								sort: true,
								unresize: true
							}, {
								field: 'userName',
								title: '用户名称',
								width: '15%',
								align: 'center',
								sort: true,
								unresize: true
							}, {
								field: 'roleName',
								title: '角色',
								align: 'center',
								width: '15%',
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
								width: '10%',
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
								toolbar: '#barDemo',
								align: 'center',
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
							$(location).attr('href', 'delUser.html/'+data.id);
						});
					} else if (obj.event === 'edit') {
						$('#id').val(data.id);
						$('#userCode').val(data.userCode);
						$('#userName').val(data.userName);
						$('#userPassword').val(data.userPassword);
						$('#isStart').val(data.isStart);
						$('#roleId').val(data.roleId);
						$('#from_user').attr('action','updUser.html');
						$('#description').text('修改供应商用户信息');
						$('#operation_user').show();
					}else if (obj.event === 'payment') {
						$(location).attr('href', 'payment.html?id='+data.id+'&userName='+data.userName);
					}else {
						$(location).attr('href', 'log.html?userName='+data.userName);
					}
				});

				$('#close').click(function () {
					$("#operation_user").hide();
				});

				$('#addUser').click(function () {
					$('#description').text('添加供应商用户信息');
					$('#from_user').attr('action','addUser.html');
					$('#operation_user').show();
				});

				$('#select_user').click(function () {
					var select_userCode = $('#select_userCode').val();
					var select_roleId = $('#select_roleId').val();
					var select_isStart = $('#select_isStart').val();
					tableIns.reload({
						where: {
							userCode:select_userCode,
							roleId:select_roleId,
							isStart:select_isStart
						},page: {
							curr: 1
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
