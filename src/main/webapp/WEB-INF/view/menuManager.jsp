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

<div id="cc" class="easyui-layout" data-options="fit:true">
    <div data-options="region:'west',title:'操作',split:true" style="width:20%;">
        <div style="padding: 50px 50px 0 50px;margin-bottom: 20px;">
            <a id="addbtn" style="width: 100%;" href="javascript:void(0);" class="easyui-linkbutton">添加菜单</a>
        </div>
        <div style="padding: 0 50px;margin-bottom: 20px;">
            <a id="editbtn" style="width: 100%;" href="javascript:void(0);" class="easyui-linkbutton">编辑菜单</a>
        </div>
        <div style="padding: 0 50px;margin-bottom: 20px;">
            <a id="delbtn" style="width: 100%;" href="javascript:void(0);" class="easyui-linkbutton">删除菜单</a>
        </div>
        <div style="padding: 0 50px;margin-bottom: 20px;">
            <a id="refushbtn" style="width: 100%;" href="javascript:void(0);" class="easyui-linkbutton">刷新菜单</a>
        </div>
    </div>
    <div data-options="region:'center',title:'当前系统菜单'" style="width:80%">
        <ul id="menuTree" class="ztree"></ul>
    </div>
</div>

<%-- 弹出框  --%>
<%--菜单操作窗口--%>
<div id="menuWindow" data-options="closed:true,modal:true" class="easyui-window"
     style="width: 400px;padding: 30px 30px">
    <form id="menuForm" method="post">
        <%--修改菜单id--%>
        <input name="mid" type="hidden">

        <div style="width: 100%;margin-top: 30px;">
            <input id="parentMenu" name="pid" value="0" class="easyui-combobox" style="width:100%;"
                   data-options="valueField:'mid',textField:'mname',label:'父菜单'">
        </div>
        <div style="width: 100%;margin-top: 30px;">
            <input required data-options="label:'菜单名称'" style="width: 100%" class="easyui-textbox" name="mname">
        </div>
        <div style="margin-top: 30px;width: 100%">
            <input data-options="label:'菜单地址'" style="width: 100%" class="easyui-textbox" name="url">
        </div>
        <div style="margin-top: 30px;width: 100%">
            <input required data-options="label:'菜单描述'" style="width: 100%" class="easyui-textbox" name="mdesc">
        </div>
        <div style="margin-top: 30px;width: 100%">
            <a onclick="saveOrUpdateMenu();" href="javascript:void(0)" style="width: 100%"
               class="easyui-linkbutton">提交</a>
        </div>
    </form>
</div>

<script>
    // 初始化下拉框
    $("#parentMenu").combobox({
        url: 'menu/menuTree.do',
        loadFilter: function (data) {
            console.log(data);
            var parentNode = {mid: 0, mname: "顶级菜单"};
            data.unshift(parentNode);
            return data;
        }
    })

    // 添加菜单按钮
    $("#addbtn").click(function () {
        // 重新加载 combobox 下拉框的数据
        $('#parentMenu').combobox('reload');
        $("#menuWindow").window({
            closed: false,
            title: "新增菜单"
        })
    });

    //  提交  添加或者 编辑
    function saveOrUpdateMenu() {
        $('#menuForm').form('submit', {
            url:"menu/saveOrUpdateMenu.do",
            onSubmit: function () {
                return $("#menuForm").form("validate");
            },
            success:function(data){
                var json = JSON.parse(data);
                // 刷新 tree
                var treeObj = $.fn.zTree.getZTreeObj("menuTree");
                treeObj.reAsyncChildNodes(null, "refresh");
                //reset form
                $("#menuForm").form("reset");
                // 关闭窗口
                $("#menuWindow").window("close");
                // 重新加载 combobox 下拉框的数据
                //$('#parentMenu').combobox('reload');
                $.messager.alert("温馨提示",json.msg,"info");

            }
        });
    }

    //  编辑菜单按钮
    $("#editbtn").click(function () {
        //  判断是否有选中  菜单
        var treeObj = $.fn.zTree.getZTreeObj("menuTree");
        var nodes = treeObj.getSelectedNodes();
        console.log(nodes);
        if(nodes.length == 0){
            $.messager.alert("温馨提示","请选中您需要编辑的菜单!","info");
            return false;
        }
        // 重载下拉框数据
        $('#parentMenu').combobox('reload');
        // 回显数据
        var menu = nodes[0];
        $("#menuForm").form("load",menu);
        $("#menuWindow").window({
            closed:false,
            title:"编辑菜单"
        })
    });

    // 刷新 菜单
    $("#refushbtn").click(function () {
        var treeObj = $.fn.zTree.getZTreeObj("menuTree");
        treeObj.reAsyncChildNodes(null, "refresh");
    });

    // 删除  菜单
    $("#delbtn").click(function () {
        //  判断是否有选中  菜单
        var treeObj = $.fn.zTree.getZTreeObj("menuTree");
        var nodes = treeObj.getSelectedNodes();
        console.log(nodes);
        if(nodes.length == 0){
            $.messager.alert("温馨提示","请选中您需要删除的菜单!","info");
            return false;
        }

        var menu = nodes[0];
        if(menu.children != undefined){
            $.messager.alert("温馨提示","不能删除多个菜单!","info");
            return false;
        }

        $.messager.confirm("温馨提示","你确定要删除此菜单吗?",function(r){
            if(r){
                $.get(
                    "menu/delMenu.do",
                    {mid:menu.mid},
                    function (data) {
                        // 刷新 tree
                        var treeObj = $.fn.zTree.getZTreeObj("menuTree");
                        treeObj.reAsyncChildNodes(null, "refresh");
                        $.messager.alert("温馨提示",data.msg,"info");
                    }
                );
            }
        })

    });
</script>


<script>
    // 加载menutree
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
