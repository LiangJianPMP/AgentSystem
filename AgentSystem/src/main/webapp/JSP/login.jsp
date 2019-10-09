
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/RESOURCES/layui/css/layui.css">
	</head>
	<body>
		<div class="layui-container">
			<div style="padding: 20px; background-color: #F2F2F2;">
				<div class="layui-row layui-col-space15">
					<div class="layui-col-md12">
						<div class="layui-card">
							<div class="layui-card-header">
								<h1 id="" style="text-align: center;line-height: 40px;">
									登录系统 | Sign in
								</h1>
							</div>
							<div class="layui-card-body">
								<form method="post" action="${pageContext.request.contextPath}/sys/login.html" class="layui-form" style="width: 600px;margin: 50px auto 50px auto;">
									<div class="layui-form-item">
										<label class="layui-form-label">用户名：</label>
										<div class="layui-input-block">
											<input type="text" name="userCode" required="required" lay-verify="title" autocomplete="off" placeholder="请输入用户名"
											 class="layui-input">
											<label>${message}</label>
											<label>${exist}</label>
										</div>
									</div>
									<div class="layui-form-item">
										<label class="layui-form-label">密码：</label>
										<div class="layui-input-block">
											<input type="password" name="userPassword" required="required" lay-verify="title" autocomplete="off" placeholder="请输入密码"
											 class="layui-input">
											<label>${password}</label>
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-input-block">
											<button type="submit" class="layui-btn layui-btn-lg" lay-submit="" lay-filter="demo1">登录</button>
											<button type="reset" class="layui-btn layui-btn-lg">清空</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>

		<script src="${pageContext.request.contextPath}/RESOURCES/layui/layui.js"></script>

	</body>
</html>
