<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
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

<div class="layui-container" style="padding: 20px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">注册的移动云端信息</div>
                <div class="layui-card-body">
                    <table width="100%" style="margin-left: 10px;">
                        <tr>
                            <td>登录账号:<label>${keywords.appUserName}</label></td>
                            <td>登录密码:<label>${keywords.appPassword}</label></td>
                        </tr>
                        <tr>
                            <td>关键词:<label>${keywords.keywords}</label></td>
                            <td>登录地址:<label>${keywords.loginUrl}</label></td>
                        </tr>
                        <tr>
                            <td>客户端下载地址(IOS):<label>${keywords.iosDownloadUrl}</label></td>
                            <td>二维码下载地址(IOS):<label>${keywords.codeIosUrl}</label></td>
                        </tr>
                        <tr>
                            <td>客户端下载地址(Android):<label>${keywords.androidDownloadUrl}</label></td>
                            <td>二维码下载地址(Android):<label>${keywords.codeAndroidUrl}</label></td>
                        </tr>
                        <tr>
                            <td>关键词开始日期:<label>${keywords.regDatetime}</label></td>
                            <td>关键词结束日期:<label>${keywords.regPassDatetime}</label></td>
                        </tr>
                        <tr>
                            <td>关键词有效年期:<label>${keywords.serviceYears}</label></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">基本信息</div>
                <div class="layui-card-body">
                    <table width="100%" style="margin-left: 10px;">
                        <tr>
                            <td>企业名称:<label>${custom.customName}</label></td>
                            <td>状态:
                                <c:if test="${custom.customStatus == 1}">
                                    <label color="green">启用</label>
                                </c:if>
                                <c:if test="${custom.customStatus == 0}">
                                    <label color="red">停用</label>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td>企业类型:<label>${custom.customTypeName}</label></td>
                            <td>企业主页:<label>${custom.siteUrl}</label></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">门户信息</div>
                <div class="layui-card-body">
                    <table width="100%" style="margin-left: 10px;">
                        <tr>
                            <td>法人代表:<label>${custom.bossName}</label></td>
                            <td>注册日期:<label>${custom.regDatetime}</label></td>
                        </tr>
                        <tr>
                            <td>证件类型:<label>${custom.cardTypeName}</label></td>
                            <td>证件号码:<label>${custom.cardNum}</label></td>
                        </tr>
                        <tr>
                            <td>国家:<label>${custom.country}</label></td>
                            <td>省/地区:<label><c:out value="${province}"/></label></td>
                        </tr>
                        <tr>
                            <td>区:<label><c:out value="${area}"/></label></td>
                            <td>城市:<label><c:out value="${city}"/></label></td>
                        </tr>
                        <tr>
                            <td>公司电话:<label>${custom.companyTel}</label></td>
                            <td>公司传真:<label>${custom.companyFax}</label></td>
                        </tr>
                        <tr>
                            <td>公司地址:<label>${custom.companyAddress}</label></td>
                            <td>备注
                                :<label></label>${custom.memo}</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">联系人信息</div>
                <div class="layui-card-body">
                    <ul>
                        <c:if test="${contactList != null}">
                            <c:forEach var="contactList" items="${contactList}">
                                <li>
                                    <div>姓名：<c:out value="${contactList.contactName}"/></div>
                                    <div>电话：<c:out value="${contactList.contactTel}"/></div>
                                    <div>传真：<c:out value="${contactList.contactFax}"/></div>
                                    <div>邮箱：<c:out value="${contactList.contactEmail}"/></div>
                                    <div>职务：<c:out value="${contactList.contactRole}"/></div>
                                </li>
                            </c:forEach>
                        </c:if>
                        <c:if test="${contactList == null}">
                            <li>没有任何联系人</li>
                        </c:if>
                    </ul>
                </div>
                <div style="width: 100%; text-align: center;">
                    <a href="${pageContext.request.contextPath}/JSP/PMIndex.jsp" class="layui-btn layui-btn-sm">返回</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/RESOURCES/layui/layui.js"></script>
<script>
    layui.use('element', function () {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
</body>

</html>
