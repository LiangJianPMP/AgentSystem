<%--
  Created by IntelliJ IDEA.
  User: 29007
  Date: 2019/9/21
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        var provinces;//省
        var citys;//城市
        var districts;//区
        layui.use(['form'],function () {
            var form=layui.form;
            form.on('select(provinces)', function(data) {
                renders()
                form.render('select');
            })

            form.on('select(citys)',function(){
                read()
                form.render('select');
            })
        })
        $(function () {
            //得到省
            $.ajax({
                url : '${pageContext.request.contextPath}/pro/get_province',
                type : 'post',
                data : null,
                dataType : 'json',
                async: false,
                success : function(result) {
                    console.log("省数据得到");
                    provinces = result;

                },
                erorr : function() {
                    alert("有异常！");
                }
            })
            //城市
            $.ajax({
                url : '${pageContext.request.contextPath}/pro/get_City',
                type : 'post',
                data : null,
                dataType : 'json',
                async: false,
                success : function(result) {
                    console.log("城市数据得到");
                    citys = result;

                },
                erorr : function() {
                    alert("有异常！");
                }
            })
            //区
            $.ajax({
                url : '${pageContext.request.contextPath}/pro/get_Area',
                type : 'post',
                data : null,
                dataType : 'json',
                async: false,
                success : function(result) {
                    console.log("区域数据得到");
                    districts = result;

                },
                erorr : function() {
                    alert("有异常！");
                }
            })

           renderdata()
        })

        //渲染数据
        function renderdata() {
            var provincse=$('#province')//省

            var prht="";
            console.log(provinces)
            for (i=0;i<provinces.length;i++) {
                var obj=provinces[i];
                var ht;
                if (i==2){
                    ht="<option value="+obj.provinceID+">"+obj.province+"</option>"
                    prht+=ht;
                }
                else{
                    ht="<option value="+obj.provinceID+">"+obj.province+"</option>"
                    prht+=ht;
                }


            }
            provincse.html(prht);
            renders();
        }

        function renders() {

            console.log("方法执行")
            //得到当前选中省的值
            var price=$('#province option:selected').val();
            console.log(price+"---------------->省ID")
            var city=$('#city');//城市

            var ciht="";
            for (i=0;i<citys.length;i++){
                var ht;
                var obj=citys[i];
                if (i==0)
                    console.log(obj.cityID+""+obj.city)
                if (obj.father==price){
                    if (i==0){
                        console.log("进入判断")
                        ht="<option value="+obj.cityID+">"+obj.city+"</option>"
                        ciht+=ht;
                    }
                    else{
                        ht="<option value="+obj.cityID+">"+obj.city+"</option>"
                        ciht+=ht;
                    }
                }

            }

            city.html(ciht);
            read()
        }


        function read() {
            var areaT=$('#area')//区
            console.log("方法执行")
            var arht="";
            //得到当前选中城市的值
            var price=$('#city option:selected').val();
            console.log(price+"-----------城市ID")
            for (i=0;i<districts.length;i++){
                var ht;
                var obj=districts[i];
                if (obj.father==price){

                    if (i==0){
                        ht="<option value="+obj.areaID+">"+obj.area+"</option>"
                        arht+=ht;
                    }
                    else{
                        ht="<option value="+obj.areaID+">"+obj.area+"</option>"
                        arht+=ht;
                    }

                }

            }
            areaT.html(arht);

        }

    </script>
    <title>添加客户</title>
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

<form enctype="multipart/form-data" class="layui-form" method="post" action="${pageContext.request.contextPath}/customcontroller/set_client">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>基本信息</legend>
    </fieldset>


    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">企业名称</label>
            <div class="layui-input-inline">
                <input type="text" name="customName" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">企业类型</label>
            <div class="layui-input-block">
                <select name="customType" lay-filter="aihao">
                    <option value="">-请选择-</option>
                    <option value="17">个人</option>
                    <option value="16" selected="">企业</option>
                    <option value="18">政府</option>
                </select>
            </div>
        </div>
    </div>


    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">企业主页</label>
            <div class="layui-input-inline">
                <input type="text" name="siteUrl" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">企业类型</label>
            <div class="layui-input-block">
                <select name="customStatus" lay-filter="aihao">
                    <option value="">-请选择-</option>
                    <option value="1" selected="">启用</option>
                    <option value="0">停用</option>
                </select>
            </div>
        </div>
    </div>

    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>基本信息</legend>
    </fieldset>


    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">法人代表</label>
            <div class="layui-input-inline">
                <input type="text" name="bossName" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <%--<div class="layui-inline">
            <label class="layui-form-label">注册日期</label>
            <div class="layui-input-block">
                <input type="text" name="regDatetime" id="date1" autocomplete="off" class="layui-input" value="">
            </div>
        </div>--%>
    </div>


    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">证件类型</label>
            <div class="layui-input-block">
                <select name="cardType" lay-filter="aihao">
                    <option value="">-请选择-</option>
                    <option value="19" selected="">国内身份证</option>
                    <option value="20">境内身份证</option>
                    <option value="21">营业执照</option>
                    <option value="22">其他类型</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">证件号码</label>
            <div class="layui-input-inline">
                <input type="text" name="cardNum" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">国家</label>
            <div class="layui-input-inline">
               <input name="country" class="layui-input layui-disabled" value="中国" disabled>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">省/地区</label>
            <div class="layui-input-block">
                <select name="province" lay-filter="provinces" id="province">

                </select>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">公司传真</label>
            <div class="layui-input-inline">
                <input type="text" name="companyFax" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">城市</label>
            <div class="layui-input-block">
                <select name="city" lay-filter="citys" id="city" onchange="read()">

                </select>
            </div>
        </div>
    </div>


    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">公司电话</label>
            <div class="layui-input-inline">
                <input type="text" name="companyTel" lay-verify="required | phone" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">区</label>
            <div class="layui-input-block">
                <select name="area" lay-filter="aihao" id="area" >

                </select>
            </div>
        </div>
    </div>


    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">公司地址</label>
            <div class="layui-input-inline">
                <input type="text" name="companyAddress" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" name="memo"></textarea>
        </div>
    </div>
    <button type="button" class="layui-btn" onclick="addlinkman()">添加一个联系人</button>
    <table class="layui-table" id="addlinkman">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="200">
            <col>
        </colgroup>
        <thead>
            <tr>
                <th>姓名</th>
                <th>电话</th>
                <th>传真</th>
                <th>邮箱</th>
                <th>职位</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
    <div class="layui-form-item">
        <button class="layui-btn" lay-submit="" lay-filter="demo2">跳转式提交</button>
        <button class="layui-btn">取消</button>
    </div>
</form>
<script>
    var j=0;
    function addlinkman() {

        //获取标签中的tbody
        var linkman=$('#addlinkman tbody');
        var linkmanht=linkman.html();
        var name=" <div class=\"layui-input-inline\">\n" +
            "                <input type=\"text\" name=\"list["+j+"].contactName\" lay-verify=\"required\" autocomplete=\"off\" class=\"layui-input\">\n" +
            "            </div>";

        var phone=" <div class=\"layui-input-inline\">\n" +
            "                <input type=\"text\" name=\"list["+j+"].contactTel\" lay-verify=\"required | phone\" autocomplete=\"off\" class=\"layui-input\">\n" +
            "            </div>";

        var fax=" <div class=\"layui-input-inline\">\n" +
            "                <input type=\"text\" name=\"list["+j+"].contactFax\" lay-verify=\"required\" autocomplete=\"off\" class=\"layui-input\">\n" +
            "            </div>";
        var mailbox=" <div class=\"layui-input-inline\">\n" +
            "                <input type=\"text\" name=\"list["+j+"].contactEmail\" lay-verify=\"required | email\" autocomplete=\"off\" class=\"layui-input\">\n" +
            "            </div>";

        var position=" <div class=\"layui-input-inline\">\n" +
            "                <input type=\"text\" name=\"list["+j+"].contactRole\" lay-verify=\"required\" autocomplete=\"off\" class=\"layui-input\">\n" +
            "            </div>";

        var del=" <button type=\"button\" class=\"layui-btn layui-btn-primary layui-btn-sm\" onclick='del(this)'><i class=\"layui-icon\"></i></button>";
        var ht="<tr> <th>"+name+"</th> <th>"+phone+"</th> <th>"+fax+"</th> <th>"+mailbox+"</th> <th>"+position+"</th> <th>"+del+"</th> </tr>";
        console.log("插入值："+ht+"原始值："+linkmanht);

        //判断是否存在原始值
        if(linkmanht==undefined || linkmanht.replace(/\s+/g,"")=="" || linkmanht==null){
            linkman.html(ht);
        }else {
            linkman.append(ht)
        }
        j++;
    }

    function del(th) {
        var th=$(th).parent().parent();
        th.remove();
    }
</script>
<script>
    layui.use(['form', 'layedit', 'laydate'],function(){
        //获取layui标签
        var form=layui.form;
        var layedit=layui.layedit;
        var laydate=layui.laydate;
        //渲染窗口组件
        form.render();
        //设置默认时间
       var date1=document.getElementById("date1");
        var date = new Date();
        var dateString = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
        date1.value=dateString;
        //渲染日期组件
        laydate.render({
            elem: '#date1'
        });

    })
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
