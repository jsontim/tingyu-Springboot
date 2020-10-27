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
<div id="toolbar">
    <a id="addbtn" href="javascript:void(0);" class="easyui-linkbutton"
       data-options="iconCls:'icon-add',plain:true">添加角色</a>
    <a id="editbtn" href="javascript:void(0);" class="easyui-linkbutton"
       data-options="iconCls:'icon-ok',plain:true">更新角色</a>
    <a id="delbtn" href="javascript:void(0);" class="easyui-linkbutton"
       data-options="iconCls:'icon-cancel',plain:true">删除角色</a>
</div>

<table id="roleTable"></table>

<div id="roleWin" class="easyui-window" title="新增角色" style="width:1000px;height:500px"
     data-options="modal:true,closed:true">
    <div id="cc" class="easyui-layout" style="width:600px;height:400px;" data-options="fit:true">
        <div data-options="region:'west',title:'角色信息',split:true" style="width:50%;padding:50px;">
            <form id="roleForm" class="easyui-form" method="post">
                <input name="rid" type="hidden">
                <div style="width: 100%">
                    <input required data-options="label:'角色名称'" style="width: 100%" class="easyui-textbox" name="rname">
                </div>
                <div style="margin-top: 20px;width: 100%">
                    <input required data-options="label:'角色描述'" style="width: 100%" class="easyui-textbox" name="rdesc">
                </div>
                <div style="margin-top: 20px;width: 100%;">
                    <a onclick="saveOrUpdateRole();" href="javascript:void(0)" style="width: 100%"
                       class="easyui-linkbutton">提交</a>
                </div>
            </form>
        </div>
        <div data-options="region:'center',title:'角色菜单'" style="width:50%;padding:5px;background:#eee;">
            <ul id="menuTree" class="ztree"></ul>
        </div>
    </div>
</div>

<script>
    // 加载datagrid数据
    $("#roleTable").datagrid({
        toolbar: '#toolbar',
        fit: true,
        pagination: true,
        checkOnSelect: false,
        selectOnCheck: true,
        singleSelect: true,
        rownumbers: true,
        pageList: [2, 4, 6, 8, 10, 12],
        pageNumber: 1,
        pageSize: 10,
        striped: true,
        url: 'role/rolelist.do',
        columns: [[
            {field: 'cc', checkbox: true},
            {field: 'rname', title: '角色名称', width: 200, align: 'center'},
            {field: 'rdesc', title: '角色描述', width: 200, align: 'center'},
        ]]
    })
</script>
<script>
    //  删除角色按钮
    $("#delbtn").click(function () {
        var rows = $("#roleTable").datagrid("getChecked");
        console.log(rows[0]);
        if(rows.length == 0){
            $.messager.alert("温馨提示","请选择你要删除的角色!","info");
            return false;
        }
        $.messager.confirm("确认提示","你确定要删除权限吗?",function(r){
            if (r){
                $.get(
                    "role/delRole.do",
                    {rid: rows[0].rid},
                    function (data) {
                        $("#roleTable").datagrid("reload");
                        $.messager.alert("温馨提示",data.msg,"info");
                    }
                );
            }
        });
    });

    // 新增角色按钮
    $("#addbtn").click(function () {
        var treeObj = $.fn.zTree.getZTreeObj("menuTree");
        treeObj.reAsyncChildNodes(null, "refresh");

        $("#roleForm").form("reset");
        $("#roleWin").window({
            closed:false,
            title:"添加角色"
        });
    });

    // 新增或修改角色  提交按钮
    function saveOrUpdateRole() {
        $('#roleForm').form('submit', {
            url:"role/saveOrUpdateRole.do",
            onSubmit: function (param) {
                // 1.表单验证
                var flag = $("#roleForm").form("validate");
                // 2.树也一定要打勾
                var treeObj = $.fn.zTree.getZTreeObj("menuTree");
                var nodes = treeObj.getCheckedNodes(true);
                if(nodes.length == 0){
                    $.messager.alert("温馨提示","请选择菜单","info");
                    return false;
                }
                // 把节点的mid放到数组里面
                var mids = [];
                $.each(nodes,function (index,node) {
                    mids.push(node.mid);
                })
                param.mids = mids.toString();
                console.log(nodes);
                return flag;
            },
            success:function(data){
                var json = JSON.parse(data);
                if(json.code == 400){
                    $.messager.alert("温馨提示",json.msg,"info");
                    return false;
                }
                // 操作成功
                $("#roleForm").form("reset");
                $("#roleWin").window("close");
                $("#roleTable").datagrid("load");
                // 重新加载树
                var treeObj = $.fn.zTree.getZTreeObj("menuTree");
                treeObj.reAsyncChildNodes(null, "refresh");
                $.messager.alert("温馨提示",json.msg,"info");
            }
        });

    }

    //编辑角色按钮
    $("#editbtn").click(function () {
        var treeObj = $.fn.zTree.getZTreeObj("menuTree");
        treeObj.reAsyncChildNodes(null, "refresh");
        // 判断是否有选中 角色
        var rows = $("#roleTable").datagrid("getChecked");
        if(rows.length == 0){
            $.messager.alert("温馨提示","请选择你要编辑的角色!","info");
            return false;
        }
        var role = rows[0];
        console.log(role);
        $("#roleForm").form("load",role);

        $("#roleWin").window({
            closed:false,
            title:"修改权限"
        });

        $.get(
            "roleMenu/getMidByRid.do",
            {rid:role.rid},
            function (data) {
                // 回写一个多个mid 的json数据
                console.log(data);
                // 把这些个mid 填到tree
                var treeObj = $.fn.zTree.getZTreeObj("menuTree");
                for(var i=0;i<data.length;i++){
                        var node = treeObj.getNodeByParam("mid", data[i], null);
                        console.log(node);
                        treeObj.checkNode(node, true, false);
                }
            },
            "json"
        );
    });





</script>

<script>
    // 加载menutree
    var setting = {
        check: {
            enable: true
        },
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
            url: "menu/menuTree.do",
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
</script>
</body>
</html>
