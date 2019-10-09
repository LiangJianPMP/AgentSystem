<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<div class="layui-container">
    <div style="margin: 20px 0px;">
        <a href="#" style="text-decoration: none;">门户管理</a> \ <a href="#" style="text-decoration: none;">门户管理</a>
    </div>
    <div style="padding: 20px; background-color: #F2F2F2;">
        <div class="layui-card">
            <div class="layui-card-header">
                <form class="layui-form" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">关键词:</label>
                            <div class="layui-input-inline">
                                <input id="keywords" name="keywords" autocomplete="off" class="layui-input" type="text"/>
                            </div>
                            <label class="layui-form-label">个人名称:</label>
                            <div class="layui-input-inline">
                                <input id="customName" name="customName" autocomplete="off" class="layui-input" type="text"/>
                            </div>
                        </div>
                        <button class="layui-btn" onclick="return false;" data-type="reload" id="selectbyCondition" >搜索</button>
                    </div>
                </form>
            </div>
            <div class="layui-card-body">
                <div class="layui-form" id="table-list">
                    <table class="layui-table"  lay-skin="nob" id="userTable" lay-filter="userTable"></table>
                </div>
            </div>
        </div>
    </div>
    <div class="wrap-container clearfix">
        <div class="column-content-detail">


        </div>
    </div>
</div>


<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
</script>
<script src="${pageContext.request.contextPath}/RESOURCES/layui/layui.js"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;
        table.render({
            elem: '#userTable',
            url:'${pageContext.request.contextPath}/keyword/getList.json',
            cellMinWidth: 80,
            cols: [[
                {checkbox: true, fixed: true}
                , {field: 'id', title: '序号', width: 80, sort: true}
                , {field: 'keywords', title: '用户名称', width: 100}
                , {field: 'customName', title: '客户名称', sort: true}
                , {field: 'bossName', title: '法人代表'}
                , {field: 'agentName', title: '代理商', width: 80,}
                , {field: 'regDatetime', title: '注册日期', sort: true}
                , {field: 'customTypeName', title: '类型', sort: true, width: 80}
                , {
                    field: 'isUse', title: '状态', width: 80, templet: function (item) {
                        if (item.isUse == '0') {
                            return "未使用";
                        } else {
                            return "已使用";
                        }
                    }
                }
                , {fixed: 'right', width: 120, align: 'center', toolbar: '#barDemo'}
            ]],
            id:'userTableReload',
            limit: 5,
            page:true
        });

        //根据条件查询表格数据重新加载
        var $ = layui.$, active = {
            reload: function(){
                //获取用户名
                var keywords = $('#keywords');
                var customName = $('#customName');
                //执行重载
                table.reload('userTableReload', {
                    page: {
                        curr: 0 //重新从第 1 页开始
                    }
                    ,url : '${pageContext.request.contextPath}/keyword/getListByName.json'
                    //根据条件查询
                    ,where: {
                        keywords:keywords.val(),
                        customName:customName.val()
                    }
                });
            }
        };

        //监听工具条
        table.on('tool(userTable)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                window.location = "${pageContext.request.contextPath}/keyword/checkInfoById.html/" + data.id
            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                window.location = "${pageContext.request.contextPath}/keyword/upInfoById.html/" + data.id
            }
        });



        //点击搜索按钮根据用户名称查询
        $('#selectbyCondition').on('click',
            function(){
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
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
