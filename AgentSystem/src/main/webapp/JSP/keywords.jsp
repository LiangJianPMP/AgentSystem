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
		<title>关键词审核</title>
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
				<div>系统管理\关键词审核</div>
			</div>
			<div class="layui-row" style="background-color: #ffffff;">
				<div style="padding: 10px;">
					<div>
						<h2 style="text-align: center;">关键词审核</h2>
					</div>
					<div class="layui-row">
						<div class="layui-input-inline">
							<input type="text" name="keywords" id="keywords" required lay-verify="required" placeholder="请输入关键词" autocomplete="off"
							 class="layui-input">
						</div>
						<div class="layui-input-inline">
							<button type="button" id="select_keywords" class="layui-btn"><i class="layui-icon">&#xe615;</i>&nbsp;&nbsp;&nbsp;查&nbsp;询</button>
						</div>
						<div class="layui-input-inline">

						</div>
					</div>
					<div class="layui-row">
						<table id="demo" lay-filter="test"></table>
					</div>
				</div>
			</div>
			<div>&nbsp;</div>
		</div>


		<div id="operation_keywords" align="center" style="width: 500px;height: 500px;position: fixed;top: 20%;left: 37%;border: #0C0C0C solid 1px;background-color: #FFFFFF;display: none;">
			<div style="width: 400px;">
				<div style="margin: 30px 0;padding-bottom: 10px;border-bottom: #000000 solid 1px;">
					<h2 id="description"></h2>
				</div>
				<form class="layui-form" id="from_keywords" method="post">
					<input type="hidden" name="id" id="id">
					<div class="layui-form-item">
						<label class="layui-form-label">客户名称：</label>
						<div class="layui-input-inline">
							<input type="text" id="customName" disabled name="customName" required lay-verify="required" placeholder="请输入客户名称" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">关键词：</label>
						<div class="layui-input-inline">
							<input type="text" id="keywordss" name="keywordss" disabled required lay-verify="required" placeholder="请输入关键词" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">服务类别：</label>
						<div class="layui-input-inline">
							<select name="productType" id="productType" lay-verify="required">
								<option value=" ">-请选择-</option>
								<c:forEach var="systemConfig" items="${systemConfigs}">
									<option value="${systemConfig.id}">${systemConfig.configTypeName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">服务年限：</label>
						<div class="layui-input-inline">
							<select name="serviceYears" id="serviceYears" lay-verify="required">
								<option value=" ">-请选择-</option>
								<option value="1">1年</option>
								<option value="2">2年</option>
								<option value="3">3年</option>
								<option value="4">4年</option>
								<option value="5">5年</option>
								<option value="6">6年</option>
								<option value="7">7年</option>
								<option value="8">8年</option>
								<option value="9">9年</option>
								<option value="10">10年</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">价格：</label>
						<div class="layui-input-inline">
							<input type="text" id="price" name="price" required lay-verify="required" placeholder="请输入价格" autocomplete="off" class="layui-input">
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
			<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="upd01">使用</a>
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="upd02">不使用</a>
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
					url: 'showKeywords.json' //数据接口
						,
					page: true //开启分页,
						,
					limit: 4,
					limits: [4, 8, 10],
					cols: [
						[ //表头
							{
								fixed: 'left',
								type: 'numbers'
							}, {
								field: 'price',
								hide: 'true'
							}, {
								field: 'id',
								title: 'ID',
								hide: 'true'
							}, {
								field: 'keywords',
								title: '关键词',
								align: 'center',
								sort: true,
								unresize: true
							}, {
								field: 'customName',
								title: '客户名称',
								sort: true,
								align: 'center',
								unresize: true
							}, {
								field: 'agentName',
								title: '代理商',
								align: 'center',
								sort: true,
								unresize: true
							}, {
								field: 'serviceYears',
								title: '申请年限',
								sort: true,
								align: 'center',
								unresize: true
							},{
								field: 'preRegDatetime',
								title: '申请日期',
								align: 'center',
								unresize: true
							}, {
								field: 'preRegPassDatetime',
								title: '到期日期',
								align: 'center',
								unresize: true
							}, {
								field: 'isPass',
								title: '申请到期状态',
								align: 'center',
								templet: function(d){
									if(d.isPass=="0"){
										return "不过期";
									}else if (d.isPass=="1"){
										return "预注册过期";
									}else{
										return "正式注册过期";
									}
								},
								unresize: true
							}, {
								field: 'checkStatus',
								title: '审核状态',
								align: 'center',
								templet: function(d){
									if(d.checkStatus=="0"){
										return "已申请";
									}else if (d.checkStatus=="1"){
										return "审核中";
									}else if (d.checkStatus=="2"){
										return "已通过";
									}else{
										return "未通过";
									}
								},
								unresize: true
							}, {
								field: 'isUse',
								title: '使用状态',
								align: 'center',
								templet: function(d){
									if(d.isUse=="0"){
										return "已使用";
									}else{
										return "未使用";
									}
								},
								unresize: true
							}, {
								field: 'sign',
								title: '操作',
								width: '16%',
								toolbar: '#barDemo',
								align: 'center',
								unresize: true
							}
						]
					]
				});

				//查询关键词
				$('#select_keywords').click(function () {
					var keywords = $("#keywords").val();
					tableIns.reload({
						where: {
							keywords:keywords
						},page: {
							cull: 1
						}
					})
				});



				$('#close').click(function () {
					$("#operation_keywords").hide();
				});

				//监听行工具事件
				table.on('tool(test)', function(obj) {
					var data = obj.data;
					//console.log(obj)
					if (obj.event === 'edit') {
						if(data.isUse == 0){
							$('#id').val(data.id);
							$('#customName').val(data.customName);
							$('#keywordss').val(data.keywords);
							$('#productType').val(data.productType);
							$('#serviceYears').val(data.serviceYears);
							$('#price').val(data.price);
							$('#from_keywords').attr('action','updKeywords.html');
							$('#description').text('当前为【'+data.keywords+'】进行续费操作');
							$('#operation_keywords').show();
						}else{
							layer.alert('对不起，当前状态不可以使用');
						}
					}else if (obj.event === 'upd01') {
						if(data.isUse == 1){
							$(location).attr('href', 'updStatus.html?id='+data.id+'&isUse='+0);
						}else{
							layer.alert('当前状态是使用，无须修改');
						}
					}else{
						layer.confirm('真的不使用了么', {icon: 3}, function () {
							if(data.isUse == 0){
								$(location).attr('href', 'updStatus.html?id='+data.id+'&isUse='+1);
							}else{
								layer.alert('当前状态是不使用，无须修改');
							}
						});
					}
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
