<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>hostManager</title>
    <link rel="stylesheet" type="text/css" href="static/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
    <link rel="stylesheet" href="static/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="static/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="static/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="static/ztree/js/jquery.ztree.all.js"></script>
    <script type="text/javascript" src="static/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="static/js/jquery.serializejson.min.js"></script>
</head>
<body>
<div id="header">
    <form id="merriedQueryForm" method="post">
        <input class="easyui-textbox" name="pname" type="text"
               data-options="prompt:'新人名称',width:140"/>
        <input class="easyui-textbox" name="phone" type="text"
               data-options="prompt:'新人手机号',width:140"/>
        <a id="searchid" href="javascript:void(0);" class="easyui-linkbutton"
           data-options="iconCls:'icon-search',width:100">搜索</a>
        <a id="resetid" href="javascript:void(0);" class="easyui-linkbutton"
           data-options="iconCls:'icon-reload',width:100">重置条件</a>
    </form>
</div>
<table id="marriedTable"></table>

<script type="text/javascript">
$(function () {
    // 注册搜索事件
    $("#searchid").click(function () {
        var merriedPerson = $("#merriedQueryForm").serializeJSON();
        console.log(merriedPerson);
        $("#marriedTable").datagrid("load",merriedPerson);
    });

    // 重置条件
    $("#resetid").click(function () {
        $("#merriedQueryForm").form("reset");
        var merriedPerson = $("#merriedQueryForm").serializeJSON();
        $("#marriedTable").datagrid("load",merriedPerson);
    });

    //加载datagrid 数据
    $("#marriedTable").datagrid({
        header:'#header',
        fit:true,
        pagination: true,
        checkOnSelect: false,
        selectOnCheck: true,
        singleSelect: true,
        rownumbers: true,
        pageList: [2, 4, 6, 8, 10, 12],
        pageNumber: 1,
        pageSize: 10,
        striped: true,
        url: 'married/list.do',
        columns: [[
            {field:'cc',checkbox:true},
            {field: 'pid', title: '编号', width: 100, align: 'center'},
            {field: 'pname', title: '新人名称', width: 150, align: 'center'},
            {field: 'phone', title: '新人电话号码', width: 150, align: 'center'},
            {field: 'pmail', title: '新人邮箱', width: 150, align: 'center'},
            {
                field: 'marrydate',
                title: '婚礼时间',
                width: 150,
                align: 'center',
                formatter: function (value, row, index) {
                    return value.year + "-" + value.monthValue + "-" + value.dayOfMonth;
                }
            },
            {
                field: 'regdate',
                title: '注册时间',
                width: 150,
                align: 'center',
                formatter: function (value, row, index) {
                    return value.year + "-" + value.monthValue + "-" + value.dayOfMonth;
                }
            },
            {
                field: 'status',
                title: '账号状态',
                width: 150,
                align: 'center',
                formatter: function (value, row, index) {
                    return value == 0 ? " <span style='color:red'>禁用</span>" : " <span style='color:green'>启用</span>";
                }
            }
        ]]
    })
})

</script>

</body>
</html>
