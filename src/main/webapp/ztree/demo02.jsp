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


<ul id="menutree" class="ztree"></ul>

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
        },
        async: {
            enable: true,
            url: "menu/menuTree.do",
            /*预处理加载的数据*/
            dataFilter: ajaxDataFilter
        }
    };

    /*预处理数据调用的函数，在此函数内部预处理数据*/
    function ajaxDataFilter(treeId, parentNode, responseData) {
        if (responseData) {
            for(var i =0; i < responseData.length; i++) {
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
