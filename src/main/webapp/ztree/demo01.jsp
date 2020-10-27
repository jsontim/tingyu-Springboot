<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="<%=basePath %>"/>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="static/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
    <link rel="stylesheet" href="static/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <%--    <link rel="stylesheet" href="static/ztree/css/metroStyle/metroStyle.css" type="text/css">--%>
    <script type="text/javascript" src="static/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="static/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="static/ztree/js/jquery.ztree.core.js"></script>
</head>
<body>


<ul id="menutree" class="ztree" style="width:230px; overflow:auto;"></ul>

<SCRIPT type="text/javascript">
    <!--
    var setting = {
        data: {
            simpleData: {
                enable: true,
                idKey: "mid",
                pIdKey: "pid",
            },
            key: {
                name: "mname"
            }
        }
    };

    var zNodes = [{
        "mid": 1,
        "mname": "成员管理",
        "pid": 0,
        "isparent": "1",
        "status": "0",
        "url": null,
        "mdesc": "一级菜单"
    }, {
        "mid": 5,
        "mname": "主持人管理",
        "pid": 1,
        "isparent": "1",
        "status": "0",
        "url": "host/hostManager.do",
        "mdesc": "二级菜单"
    }, {
        "mid": 6,
        "mname": "婚庆公司管理",
        "pid": 1,
        "isparent": "0",
        "status": "0",
        "url": "company/companyManager.do",
        "mdesc": "二级菜单"
    }, {
        "mid": 7,
        "mname": "新人管理",
        "pid": 1,
        "isparent": "0",
        "status": "0",
        "url": "married/marriedManager.do",
        "mdesc": "二级菜单"
    }, {"mid": 2, "mname": "成员订单中心", "pid": 0, "isparent": "1", "status": "0", "url": null, "mdesc": "一级菜单"}, {
        "mid": 8,
        "mname": "主持人订单中心",
        "pid": 2,
        "isparent": "0",
        "status": "0",
        "url": null,
        "mdesc": "二级菜单"
    },
        {
        "mid": 3,
            "mname": "内容管理",
            "pid": 0,
            "isparent": "1",
            "status": "0",
            "url": null,
            "mdesc": "一级菜单"
        },
        {
        "mid": 9,
        "mname": "banner管理",
        "pid": 3,
        "isparent": "0",
        "status": "0",
        "url": null,
        "mdesc": "二级菜单"
    },
        {
        "mid": 10,
        "mname": "首页推荐管理",
        "pid": 3,
        "isparent": "0",
        "status": "0",
        "url": null,
        "mdesc": "二级菜单"
    },
        {
        "mid": 11,
        "mname": "底部文案、二维码设置",
        "pid": 3,
        "isparent": "0",
        "status": "0",
        "url": null,
        "mdesc": "二级菜单"
    },
        {
        "mid": 12,
        "mname": "加入团队介绍文案",
        "pid": 3,
        "isparent": "0",
        "status": "0",
        "url": null,
        "mdesc": "二级菜单"
    },
        {
        "mid": 13,
        "mname": "关于团队文案",
        "pid": 3,
        "isparent": "0",
        "status": "0",
        "url": null,
        "mdesc": "二级菜单"
    },
        {
        "mid": 4, "mname": "其他管理", "pid": 0, "isparent": "1", "status": "0", "url": null, "mdesc": "一级菜单"}, {
        "mid": 14,
        "mname": "菜单管理",
        "pid": 4,
        "isparent": "0",
        "status": "0",
        "url": "menu/menuManager.do",
        "mdesc": "二级菜单"
    }, {
        "mid": 15,
        "mname": "角色管理",
        "pid": 4,
        "isparent": "0",
        "status": "0",
        "url": "role/roleManager.do",
        "mdesc": "二级菜单"
    }, {"mid": 16,
        "mname": "管理员管理",
        "pid": 4, "isparent":
            "0", "status": "0",
        "url": null,
        "mdesc": "二级菜单"
    }];


    $(function () {
        $.fn.zTree.init($("#menutree"), setting, zNodes);
    });
    //-->
</SCRIPT>


</body>
</html>
