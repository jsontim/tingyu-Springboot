<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="<%=basePath %>"/>
    <title>Title</title>
    <%--引入easyUI的资源--%>
    <link rel="stylesheet" type="text/css" href="static/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
    <script type="text/javascript" src="static/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="static/easyui/locale/easyui-lang-zh_CN.js"></script>
    <style>
        *{margin:0;padding:0;}
    </style>
</head>
<body>
<div style="margin: 100px auto;width: 500px;">
    <div id="p" class="easyui-panel" title="Ting域主持人管理系统"
         style="width:500px;height:350px;"
         data-options="closable:false,collapsible:false,minimizable:false,maximizable:false">
        <form id="loginForm" method="post" action="admin/login.do">
            <div style="padding:0 100px;margin-top:50px;margin-bottom: 30px;">
                <input class="easyui-textbox" name="aname" style="width:100%;height:34px;" data-options="required:true,prompt:'Username',missingMessage:'用户名不能为空'">
            </div>
            <div style="padding:0 100px;margin-bottom: 30px;">
                <input class="easyui-passwordbox" iconWidth="28" name="apwd"
                       style="width:100%;height:34px;" data-options="required:true,prompt:'Password',missingMessage:'密码不能为空'">
            </div>
            <div style="text-align: center;">
                <a id="loginbtn" href="javascript:void(0);" class="easyui-linkbutton"
                   data-options="width:298,height:40">登录</a>
            </div>
            <div style="color:red;font-size:14px;margin: 0 auto;text-align: center">${ErrorMsg}</div>
        </form>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        $("#loginbtn").click(function () {
            var flag = $("#loginForm").form('validate');
            if(flag){
                $("#loginForm").submit();
            }
        });
    })
</script>

</body>
</html>
