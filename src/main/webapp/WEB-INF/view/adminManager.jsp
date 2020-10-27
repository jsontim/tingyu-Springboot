<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>hostManager</title>
    <link rel="stylesheet" type="text/css" href="static/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
    <link rel="stylesheet" href="static/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<%--    <link rel="stylesheet" href="static/bootstrap/css/bootstrap.css">--%>
    <script type="text/javascript" src="static/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="static/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="static/ztree/js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="static/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="static/js/jquery.serializejson.min.js"></script>
</head>
<body>
<%--添加管理员  查看权限   编辑管理员    删除管理员 --%>
<div id="toolbar">
    <a id="addbtn" href="javascript:void(0);" class="easyui-linkbutton"
       data-options="iconCls:'icon-add',plain:true">添加管理员</a>
    <a id="findPower" href="javascript:void(0);" class="easyui-linkbutton"
       data-options="iconCls:'icon-ok',plain:true">查看权限</a>
    <a id="editbtn" href="javascript:void(0);" class="easyui-linkbutton"
       data-options="iconCls:'icon-tip',plain:true">编辑管理员</a>
    <a id="delbtn" href="javascript:void(0);" class="easyui-linkbutton"
       data-options="iconCls:'icon-clear',plain:true">删除管理员</a>
</div>

<table id="adminTable"></table>

<%-- 添加 或 编辑 管理员窗口 --%>
<div id="adminWin" class="easyui-window" style="width:500px;height:500px"
     data-options="modal:true,collapsible:false,minimizable:false,maximizable:false,resizable:false,closed:true">
    <form id="adminForm" method="post">
        <input type="hidden" name="aid" />
        <%--    姓名--%>
        <div style="padding:0 50px;margin-top:30px;text-align: center">
            <input class="easyui-textbox" type="text" id="aname" name="aname" data-options="label:'姓名:'
,labelPosition:'before',labelWidth:60,required:true,width:330,height:34,missingMessage:'姓名不能为空'"/>
        </div>
        <%--    手机--%>
        <div style="padding:0 50px;margin-top:30px;text-align: center">
            <input class="easyui-textbox" type="text" id="aphone" name="aphone" data-options="label:'手机号:'
    ,labelPosition:'before',labelWidth:60,required:true,width:330,height:34,missingMessage:'手机号不能为空'"/>
        </div>
        <%--    密码--%>
        <div style="padding:0 50px;margin-top:30px;text-align: center">
            <input class="easyui-textbox" type="password" id="apwd" name="apwd" required="true" data-options="label:'密码:'
    ,labelPosition:'before',labelWidth:60,width:330,height:34,missingMessage:'密码不能为空'"/><%--     --%>
        </div>
        <div style="width: 80%;background-color: #9d9d9d;line-height: 30px;margin:30px auto;">&nbsp;&nbsp;角色设置</div>
        <%--        菜单权限   根据--%>
<%--        <c:forEach var="title" items="${titles}">--%>
<%--        <div style="padding:0 50px;margin-top:40px;overflow: hidden;">--%>
<%--            <div style="float: left;margin-right: 10px;width: 60px;">--%>
<%--                <span>${title.mname}:</span>--%>
<%--            </div>--%>
<%--            <div style="float: left;width: 390px;">--%>
<%--                <c:forEach var="item" items="${items}">--%>
<%--                <c:if test="${title.mid==item.pid}">--%>
<%--                <input class="easyui-checkbox" name="${item.pid}" value="${item.mid}" label="${item.mname}" labelWidth="100" data-options="labelPosition:'after'" />--%>
<%--                </c:if>--%>
<%--                </c:forEach>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        </c:forEach>--%>

        <div style="padding:0 50px;margin-top:40px;text-align: center;">
            <select class="easyui-combobox" id="rid" name="rid" label="角色:" labelWidth="60" labelPosition="before" style="width:80%;">
                <c:forEach var="item" items="${roles}">
                    <option value="${item.rid}">${item.rname}</option>
                </c:forEach>
            </select>
        </div>

        <div style="text-align: center;margin-top:60px;">
            <a id="adminSubmit" href="javascript:void(0);" class="easyui-linkbutton"
               data-options="width:288,height:38">提交</a>
        </div>
    </form>
</div>

<%-- 查看权限 --%>
<div id="powerWin" class="easyui-window" style="width:500px;height:500px"
     data-options="modal:true,collapsible:false,minimizable:false,maximizable:false,resizable:false,closed:true">
    <ul id="menuTree" class="ztree"></ul>
</div>

<%--  查看权限  --%>
<script>
    $("#findPower").click(function () {
        var rows = $("#adminTable").datagrid("getChecked");
        if(rows.length > 1){
            $.messager.alert("温馨提示","只能查看一个管理员权限","info");
            return false;
        }else if(rows.length == 0){
            $.messager.alert("温馨提示","请选择你要查看的管理员","info");
            return false;
        }
        console.log(rows);
        var admin = rows[0];
        console.log(admin.aid);

        // $.post(
        //     "menu/menuTreeByadmin.do",
        //     {aid:admin.aid},
        //     function (data) {
        //         console.log(data)
        //         // 重新加载树
        //         var treeObj = $.fn.zTree.getZTreeObj("menuTree");
        //         treeObj.reAsyncChildNodes(data, "refresh");
        //     }
        // );

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
                url: "menu/menuTreeByadmin?aid="+ admin.aid,
                dataFilter: ajaxDataFilter
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
            $.fn.zTree.init($("#menuTree"), setting);
        });





        $("#powerWin").window({
            closed:false,
            title:'权限查看'
        })

    });

    // 加载menutree
    // var setting = {
    //     data: {
    //         simpleData: {
    //             enable: true,
    //             idKey: "mid",
    //             pIdKey: "pid"
    //         },
    //         key: {
    //             name: "mname",
    //             url: "xUrl"
    //         }
    //     },
    //     async: {
    //         enable: true,
    //         url: "menu/menuTree.do",
    //         dataFilter: ajaxDataFilter
    //     }
    // };
    // /*预处理数据调用的函数，在此函数内部预处理数据*/
    // function ajaxDataFilter(treeId, parentNode, responseData) {
    //     if (responseData) {
    //         for (var i = 0; i < responseData.length; i++) {
    //             responseData[i].open = true;
    //         }
    //     }
    //     return responseData;
    // };
    //
    // $(function () {
    //     $.fn.zTree.init($("#menuTree"), setting);
    // });
</script>

<script>
    //初始化datagrid数据
    $('#adminTable').datagrid({
        // header: '#header',
        // toolbar: '#toolbar',
        checkOnSelect: true,
        singleSelect: true,
        selectOnCheck: true,
        rownumbers: true,
        striped: true,
        fit: true,
        url: 'admin/list.do',
        pagination: true,
        pageList: [4, 6, 8, 10, 12, 14, 16, 18, 20],
        pageNumber: 1,
        pageSize: 10,
        columns: [[
            {field: 'checkbox', checkbox: true},
            {field: 'aname', title: '管理员名称', width: 200, align: 'center'},
            {field: 'aphone', title: '手机号码', width: 200, align: 'center'},
            {
                field: 'starttime',
                title: '账号开通时间',
                width: 220,
                align: 'center',
                formatter: function (value, row, index) {
                    return value.year + "-" + value.monthValue + "-" + value.dayOfMonth + " " +
                        value.hour + ":" + value.minute + ":" + value.second;
                }
            },
        ]]
    });

    // 添加 按钮
    $("#addbtn").click(function () {
        $("#adminForm").form("reset");
        $("#adminWin").window({
            closed:false,
            title:"添加管理员"
        })
    });

    // 编辑 按钮
    $("#editbtn").click(function () {
        $("#adminForm").form("reset");
        var rows = $("#adminTable").datagrid("getChecked");
        if(rows.length > 1){
            $.messager.alert("温馨提示","只能编辑一个管理员","info");
            return false;
        }else if(rows.length == 0){
            $.messager.alert("温馨提示","请选择你要编辑的管理员","info");
            return false;
        }
        console.log(rows);
        var admin = rows[0];
        $("#adminForm").form("load",admin);

        $.post(
            "admin/getRoleByAid",
            {aid:admin.aid},
            function (data) {
                console.log(data[0].rid);
                $("#rid").combobox('setValue',data[0].rid);
            }
        );


        $("#adminWin").window({
            closed:false,
            title:"编辑管理员"
        })
    });

    // 添加 或 编辑 提交按钮
    $("#adminSubmit").click(function () {
        var flag = $("#adminForm").form("validate");
        if(flag){
            var admin = $("#adminForm").serialize();
            $.post(
                "admin/insertorupdateAdmin",
                admin,
                function (data) {
                    $("#adminWin").window("close");
                    $("#adminForm").form("reset");
                    $("#adminTable").datagrid("load");
                    $.messager.alert("温馨提示",data.msg,"info");
                }
            );
        }
    });

</script>

</body>
</html>