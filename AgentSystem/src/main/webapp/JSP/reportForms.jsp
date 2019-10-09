<%--
  Created by IntelliJ IDEA.
  User: MI
  Date: 2019/9/25
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://heerey525.github.io/layui-v2.4.3/layui/css/layui.css">
    <script src="RESOURCES/JS/jquery-3.3.1.min.js" charset="utf-8"></script>
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


           </div>
           <form action="${pageContext.request.contextPath}/baobiao/show">
           <div style="width: 1000px;text-align: center">
               <div class="layui-form-item">操作类型：
                   <div class="layui-inline">
                       <div class="layui-input-inline">
                           <select name="quiz" style="height: 30px;" value="3">
                               <optgroup label="财务报表">
                                   <option value="代理商账户余额报表">代理商账户余额报表</option>
                                   <option value="预付款流水报表">预付款流水报表</option>
                                   <option value="代理商流水报表">代理商流水报表</option>
                               </optgroup>
                               <optgroup label="产品报表">
                                   <option value="产品分类数量">产品分类数量/金额总汇</option>
                               </optgroup>
                           </select>
                       </div>
                           <button class="layui-btn layui-btn-sm" type="submit">查询</button>
                   </div>
               </div>
           </div>
           </form>

<%--            预付款流水报表--%>
           <div style="width: 1000px;">
               <div class="table-responsive table2excel" data-tableName="Test Table 1">
                   <table class="layui-table" id="tableid">
                       <colgroup>
                           <col width="150">
                           <col width="150">
                           <col width="200">
                           <col>
                       </colgroup>
                       <thead>
                       <c:forEach items="${detail}" var="detail" end="0">
                           <tr>
                               <th>序号</th>
                               <th>代理商名称</th>
                               <th>预付款</th>
                               <th>账户余额</th>
                               <th>备注信息</th>
                               <th>时间</th>
                           </tr>
                       </c:forEach>
                       </thead>
                       <c:forEach items="${detail}" var="detail">
                           <tbody>
                           <tr>
                               <td class="success">${detail.accountDetail.id}</td>
                               <td class="success">${detail.userName}</td>
                               <td class="success">${detail.accountDetail.money}</td>
                               <td class="success">${detail.accountDetail.accountMoney}</td>
                               <td class="success">${detail.accountDetail.memo}</td>
                               <td class="success">${detail.accountDetail.detailDateTime}</td>
                           </tr>
                           </tbody>
                       </c:forEach>
                   </table>
               </div>
           </div>


           <%--  代理商账户余额报表--%>
             <div style="width: 1000px;">
                 <div class="table-responsive table2excel" data-tableName="Test Table 1">
                     <table class="layui-table" >
                         <colgroup>
                             <col width="150">
                             <col width="150">
                             <col width="200">
                             <col>
                         </colgroup>
                         <thead>
                         <c:forEach items="${reportForms}" var="user" end="0">
                         <tr>
                             <th>序号</th>
                             <th>代理商名称</th>
                             <th>账号余额</th>
                         </tr>
                         </c:forEach>
                         </thead>
                         <c:forEach items="${reportForms}" var="user">
                         <tbody>
                         <tr class="noExl">
                             <td class="success">${user.id}</td>
                             <td class="success">${user.userName}</td>
                             <td class="success">￥${user.account.money}</td>
                         </tr>
                         </tbody>
                         </c:forEach>
                     </table>
                 </div>
             </div>


        <%--  产品分类信息报表--%>
        <div style="width: 1000px;">
            <div class="table-responsive table2excel" data-tableName="Test Table 1">
                <table class="layui-table" >
                    <colgroup>
                        <col width="150">
                        <col width="150">
                        <col width="200">
                        <col>
                    </colgroup>
                    <thead>
                    <c:forEach items="${sys}" var="sys" end="0">
                        <tr>
                            <th>序号</th>
                            <th>产品分类名称</th>
                            <th>数量</th>
                            <th>价格</th>
                        </tr>
                    </c:forEach>
                    </thead>
                    <c:forEach items="${sys}" var="sys">
                        <tbody>
                        <tr class="noExl">
                            <td class="success">${sys.id}</td>
                            <td class="success">${sys.configTypeName}</td>
                            <td class="success">￥${sys.configTypeValue}</td>
                            <td class="success">${sys.configValue}</td>
                        </tr>
                        </tbody>
                    </c:forEach>
                </table>
            </div>
        </div>


<%--    <table class="layui-hide" id="test"></table>--%>

       </div>



<%--    <script type="text/javascript">--%>
<%--        var j;--%>
<%--        //全部用户信息--%>
<%--        var datas;--%>
<%--        //窗口加载--%>
<%--        $(function() {--%>
<%--            $.ajax({--%>
<%--                url : 'fuwu',--%>
<%--                type : 'GET',--%>
<%--                data : null,--%>
<%--                dataType : 'json',--%>
<%--                success : function(result){--%>
<%--                    datas = result;--%>
<%--                },--%>
<%--                erorr : function() {--%>
<%--                    alert("有异常！");--%>
<%--                }--%>
<%--            })--%>
<%--        })--%>
<%--        layui.use(['element','table'], function() {--%>
<%--            var element = layui.element;--%>
<%--            var table = layui.table;--%>

<%--            table.render({--%>

<%--                elem : '#user',--%>
<%--                cols : [ [--%>
<%--                    {--%>
<%--                        field : 'id',--%>
<%--                        title : '用户id',--%>
<%--                        unresize : true,--%>
<%--                        sort : true--%>
<%--                    },--%>
<%--                    {--%>
<%--                        field : 'configTypeName',--%>
<%--                        title : '配置类型',--%>
<%--                        unresize : true,--%>
<%--                        sort : true--%>
<%--                    },--%>
<%--                    {--%>
<%--                        field : 'configValue',--%>
<%--                        title : '配置数值',--%>
<%--                        unresize : true,--%>
<%--                        sort : true--%>
<%--                    }--%>
<%--                ] ],--%>
<%--                data : datas,--%>
<%--                page : true,--%>
<%--                limit : 8,--%>
<%--                limits : [ 8, 10, 15, 20 ]--%>
<%--            })--%>
<%--    </script>--%>
            <button onclick="toexcel()">下载Excel</button>
            <script type="text/javascript">
                var tableId = document.getElementById('tableid');
                function toexcel() {
                    methodtable2excel(tableId);
                }
                // $(document).ready(function(){
                //    alert("哈哈哈哈哈")
                // });
            </script>

           <script src="JS/jquery.table2excel.js"></script>
           <script type="text/javascript">
               /* Table 生成 Excel */
               var idTmr;
               function  getExplorer() {
                   var explorer = window.navigator.userAgent ;
                   //ie
                   if (explorer.indexOf("MSIE") >= 0) {
                       return 'ie';
                   }
                   //firefox
                   else if (explorer.indexOf("Firefox") >= 0) {
                       return 'Firefox';
                   }
                   //Chrome
                   else if(explorer.indexOf("Chrome") >= 0){
                       return 'Chrome';
                   }
                   //Opera
                   else if(explorer.indexOf("Opera") >= 0){
                       return 'Opera';
                   }
                   //Safari
                   else if(explorer.indexOf("Safari") >= 0){
                       return 'Safari';
                   }
               }
               function methodtable2excel(tableid) {//整个表格拷贝到EXCEL中
                   if(getExplorer()=='ie')
                   {
                       var curTbl = document.getElementById(tableid);
                       var oXL = new ActiveXObject("Excel.Application");//创建AX对象excel

                       var oWB = oXL.Workbooks.Add();//获取workbook对象
                       var xlsheet = oWB.Worksheets(1);//激活当前sheet
                       var sel = document.body.createTextRange();
                       sel.moveToElementText(curTbl);//把表格中的内容移到TextRange中
                       sel.select();//全选TextRange中内容
                       sel.execCommand("Copy");//复制TextRange中内容
                       xlsheet.Paste();//粘贴到活动的EXCEL中
                       oXL.Visible = true;//设置excel可见属性

                       try {
                           var fname = oXL.Application.GetSaveAsFilename("Excel.xls", "Excel Spreadsheets (*.xls), *.xls");
                       } catch (e) {
                           print("Nested catch caught " + e);
                       } finally {
                           oWB.SaveAs(fname);
                           oWB.Close(savechanges = false);
                           //xls.visible = false;
                           oXL.Quit();
                           oXL = null;
                           //结束excel进程，退出完成
                           //window.setInterval("Cleanup();",1);
                           idTmr = window.setInterval("Cleanup();", 1);
                       }
                   }
                   else
                   {
                       tableToExcel(tableid);
                   }
               }
               function Cleanup() {
                   window.clearInterval(idTmr);
                   CollectGarbage();
               }
               var tableToExcel = (function() {
                   var uri = 'data:application/vnd.ms-excel;base64,',
                       template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta charset="UTF-8"></head><body><table>{table}</table></body></html>',
                       base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) },
                       format = function(s, c) {
                           return s.replace(/{(\w+)}/g,
                               function(m, p) { return c[p]; }) };
                   return function(table, name) {
                       if (!table.nodeType) table = document.getElementById(table);
                       var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML};
                       window.location.href = uri + base64(format(template, ctx))
                   }
               })();

           </script>




           <script src="https://heerey525.github.io/layui-v2.4.3/layui/layui.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
           <script type="text/javascript" src="RESOURCES/JS/jquery.table2excel.js"></script>
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
