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
    <link rel="stylesheet" href="static/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="static/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="static/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="static/ztree/js/jquery.ztree.core.js"></script>
    <%--    <script type="text/javascript" src="static/easyui/locale/easyui-lang-zh_CN.js"></script>--%>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
    </style>
</head>
<body>
<div id="cc" class="easyui-layout" style="width:100%;height:100%;">
    <div data-options="region:'north',split:true,collapsible:false,disabled:true" style="height:80px;"
         class="easyui-layout">
        <div data-options="region:'west',border:false"
             style="width:25%;height:100%;background-image: url('static/images/bg.png')">
            <img src="static/images/logo.png" style="margin-top: 14px;margin-left: 10px;">
        </div>
        <div data-options="region:'center',border:false"
             style="text-align:center;line-height:74px;font-size:36px;color:#fff;width:50%;height:100%;background-image: url('static/images/bg.png')">
            <span>Ting</span>&nbsp;&nbsp;<span style="letter-spacing:6px;">域主持人管理系统</span>
        </div>
        <div data-options="region:'east',border:false"
             style="position:relative;color:#fff;width:25%;height:100%;background-image: url('static/images/bg.png')">
            <div style="display: inline-block;width: 200px;position: absolute;top:36px;right:5px;">
                <span>用户名:${admin.aname}</span>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);"
                                                                    style="color:#fff;">退出登录</a>
            </div>
        </div>
    </div>
    <div data-options="region:'south',split:true,collapsible:false,disabled:true"
         style="height:60px;text-align: center;">
        <span>广东省佛山市尚学堂科技有限公司</span>
    </div>
    <div data-options="region:'west',split:true,collapsible:false,disabled:true" style="width:15%;">
        <ul id="menutree" class="ztree"></ul>
    </div>
    <%--    tabs 区域容器--%>
    <div data-options="region:'center',collapsible:false,disabled:true" style="">
        <div id="tabs" class="easyui-tabs" data-options="fit:true">
            <div title="欢迎" style="padding:50px 0 0 40px;"> 欢迎使用Ting域主持人管理系统</div>
        </div>
    </div>
</div>


<SCRIPT type="text/javascript">
    <!--
    var setting = {
        data: {
            simpleData: {
                enable: true,
                idKey: "mid",
                pIdKey: "pid"
            },
            key: {
                name: "mname",
                url: "xUrl"
            }
        },
        async: {
            enable: true,
            url: "menu/menuTreeByManager.do",
            /*预处理加载的数据*/
            dataFilter: ajaxDataFilter
        },
        callback: {
            onClick: zTreeOnClick
        }
    };

    function zTreeOnClick(event, treeId, treeNode) {
        //创建tab
        console.log(treeNode);
        // 获取 节点
        //判断该节点是否有children  如果没有 再判断tabs中是否已经有这个tab 如果没有就创建   如果有就选中
        var childrens = treeNode.children;
        if (childrens == null) {
            var flag = $("#tabs").tabs('exists',treeNode.mname);
            if(flag){
                $("#tabs").tabs("select",treeNode.mname);
            }else{
                $("#tabs").tabs("add",{
                    title: treeNode.mname,
                    closable:true,
                    content:"<iframe style='width:100%;height:100%;' src='"+treeNode.url+"'>"
                });
            }
        }
    };

    /*预处理数据调用的函数，在此函数内部预处理数据*/
    function ajaxDataFilter(treeId, parentNode, responseData) {
        if (responseData) {
            for (var i = 0; i < responseData.length; i++) {
                responseData[i].open = true;
            }
        }
        return responseData;
    };


    $(function () {
        $.fn.zTree.init($("#menutree"), setting);
    });
    //-->
</SCRIPT>
</body>
</html>
