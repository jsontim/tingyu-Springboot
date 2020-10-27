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
    <script type="text/javascript" src="static/ztree/js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="static/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="static/js/jquery.serializejson.min.js"></script>
</head>
<body>

<div id="header">
    <form id="hostQueryForm" method="post">
        <input class="easyui-textbox" name="hname" id="hname" type="text"
               data-options="prompt:'请输入名称(可不全写)',width:140"/>
        <select class="easyui-combobox" name="status" id="status" style="width:100px;" data-options="panelHeight:120">
            <option value="">状态</option>
            <option value="0">禁用</option>
            <option value="1">正常</option>
        </select>
        <select class="easyui-combobox" name="strong" id="strong" style="width:100px;" data-options="panelHeight:120">
            <option value="">权重</option>
            <option value="desc">权重降序</option>
            <option value="asc">权重升序</option>
        </select>
        <select class="easyui-combobox" name="ordernumber" id="ordernumber" style="width:120px;"
                data-options="panelHeight:120">
            <option value="">订单排序</option>
            <option value="0">订单量降序</option>
            <option value="1">订单量升序</option>
        </select>
        <select class="easyui-combobox" name="hpstar" id="hpstar" style="width:100px;" data-options="panelHeight:120">
            <option value="">星推荐</option>
            <option value="1">是</option>
            <option value="0">否</option>
        </select>
        <select class="easyui-combobox" name="hpdiscount" id="hpdiscount" style="width:80px;"
                data-options="panelHeight:200">
            <option value="">折扣</option>
            <option value="9">9折</option>
            <option value="8">8折</option>
            <option value="7">7折</option>
            <option value="6">6折</option>
        </select>
        <a id="searchid" href="javascript:void(0);" class="easyui-linkbutton"
           data-options="iconCls:'icon-search',width:100">搜索</a>
        <a id="resetid" href="javascript:void(0);" class="easyui-linkbutton"
           data-options="iconCls:'icon-reload',width:100">重置条件</a>
    </form>
</div>

<div id="toolbar">
    <a id="addbtn" href="javascript:void(0);" class="easyui-linkbutton"
       data-options="iconCls:'icon-add',plain:true">添加</a>
    <a id="powerbtn" href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-tip',plain:true">权限设置</a>
    <a id="updateStatusdBtn" href="javascript:void(0);" class="easyui-linkbutton"
       data-options="iconCls:'icon-clear',plain:true">禁用启用账号</a>
</div>

<table id="hostTable"></table>

<%--添加主持人的window框--%>
<div id="addWin" class="easyui-window" title="添加主持人" style="width:400px;height:330px"
     data-options="modal:true,collapsible:false,minimizable:false,maximizable:false,resizable:false,closed:true">
    <form id="hostAddForm" method="post">
        <div style="padding:0 50px;margin-top:40px;">
            <input class="easyui-textbox" type="text" name="hname" data-options="label:'姓名:'
,labelPosition:'before',labelWidth:60,required:true,width:280,height:34,missingMessage:'用户名不能为空'"/>
        </div>
        <div style="padding:0 50px;margin-top:20px;">
            <input class="easyui-textbox" type="text" name="hphone" data-options="label:'手机号:'
,labelPosition:'before',labelWidth:60,required:true,width:280,height:34,missingMessage:'手机号不能为空'"/>
        </div>
        <div style="padding:0 50px;margin-top:20px;">
            <input class="easyui-passwordbox" type="password" name="hpwd" data-options="label:'密码:'
,labelPosition:'before',labelWidth:60,required:true,width:280,height:34,missingMessage:'密码不能为空'">
        </div>
        <div style="text-align: center;margin-top:20px;">
            <a id="addHostbtn" href="javascript:void(0);" class="easyui-linkbutton"
               data-options="width:288,height:38">提交</a>
        </div>
    </form>
</div>

<%--设置权限的window框--%>
<div id="powerWin" class="easyui-window" title="设置权限" style="width:500px;height:500px"
     data-options="modal:true,collapsible:false,minimizable:false,maximizable:false,resizable:false,closed:true">
    <form id="powerForm" method="post">
<%--        星推荐--%>
        <div style="padding:0 50px;margin-top:40px;">
            <span style="padding-top:3px;margin-right: 10px;">星推荐:</span>
            <input class="easyui-radiobutton" name="hpstar" value="1" label="是" labelPosition="after" labelWidth="50">
            <input class="easyui-radiobutton" name="hpstar" value="0" label="否" checked="true" labelPosition="after" labelWidth="50">
        </div>

        <%--星推荐有效期--%>
        <div style="padding:0 50px;margin-top:30px;">
            <span style="padding-top:3px;margin-right: 10px;">星推荐有效期:</span>
            <input class="easyui-datebox" style="width:30%;" name="hpstartBegindate">
            <span>-</span>
            <input class="easyui-datebox" style="width:30%;" name="hpstarEnddate">
        </div>

<%--     自添订单   --%>
        <div style="padding:0 50px;margin-top:30px;">
            <span style="padding-top:3px;margin-right: 10px;">自添订单:</span>
            <input class="easyui-radiobutton" name="hpOrderPower" value="1" label="允许" labelPosition="after" labelWidth="50">
            <input class="easyui-radiobutton" name="hpOrderPower" value="0" label="不允许" checked="true" labelPosition="after" labelWidth="50">
        </div>


    <%--     星推荐有时间   --%>
        <div style="padding:0 50px;margin-top:30px;">
            <span style="padding-top:3px;margin-right: 10px;">星推荐有时间:</span>
            <input id="ss" class="easyui-timespinner" name="hpstarBegintime" style="width:30%;" value="08:30:00" data-options="min:'08:30',max:'18:30',showSeconds:true">
            <span>-</span>
            <input id="dd" class="easyui-timespinner" name="hpstarEndtime" style="width:30%;" value="18:30:00" data-options="min:'08:30',max:'18:30',showSeconds:true">
        </div>

<%--    折扣--%>
        <div style="padding:0 50px;margin-top:30px;">
            <input class="easyui-textbox" type="text" id="hpdiscountid" name="hpdiscount" data-options="label:'折扣:'
,labelPosition:'before',labelWidth:60,required:true,width:330,height:34,missingMessage:'折扣不能为空'"/>
        </div>

<%--    折扣时间--%>
        <div style="padding:0 50px;margin-top:30px;">
            <span style="padding-top:3px;margin-right: 10px;">折扣时间:</span>
            <input class="easyui-datebox" name="hpDisStarttime" style="width:30%;">
            <span>-</span>
            <input class="easyui-datebox" name="hpDisEndtime" style="width:30%;">
        </div>

    <%--    价格--%>
        <div style="padding:0 50px;margin-top:30px;">
    <input class="easyui-textbox" type="text" name="hpprice" data-options="label:'价格:'
    ,labelPosition:'before',labelWidth:60,required:true,width:330,height:34,missingMessage:'价格不能为空'"/>
</div>

    <%--    管理费--%>
        <div style="padding:0 50px;margin-top:30px;">
            <input class="easyui-textbox" type="text" name="hpcosts" data-options="label:'管理费:'
    ,labelPosition:'before',labelWidth:60,required:true,width:330,height:34,missingMessage:'价格不能为空'"/>
        </div>

        <div style="text-align: center;margin-top:20px;">
            <a id="powerSubmit" href="javascript:void(0);" class="easyui-linkbutton"
               data-options="width:288,height:38">提交</a>
        </div>
    </form>
</div>


<script>
    var hostids = [];
    // 点击 权限设置
    $("#powerbtn").click(function () {
        //获取点击的个数
        var selected = $("#hostTable").datagrid("getChecked");
        var count = selected.length;
        console.log(selected);
        if(count == 0){
            $.messager.alert("温馨提示","至少选择一个主持人!","info");
            return false;
        }else if(count==1){
            // 如果选中一条,就判断该主持人是否已经存在权限   如果有权限就回显,如果没有权限,就直接打开窗口
            // 获取数据
            var host = selected[0];
            console.log(host);
            $.post("hostPower/getHostPower",
                {hostid:host.hid},
                function (data) {
                    console.log("data:"+data[0]);
                    //console.log("hpid"+data[0].hpid);
                    if(data[0]==undefined){
                        // 没有设置过权限  直接打开 不用回写
                        $("#powerWin").window("setTitle",host.hname +" 设置权限");
                        $("#powerWin").window("open");
                        return false;
                    }
                    // 这里返回一个json对象 用来回显数据
                    //处理json数据
                    var hpstar = data[0].hpstar;
                    var hpstartBegindate = data[0].hpstartBegindate.year +"-"+ data[0].hpstartBegindate.monthValue +"-"+ data[0].hpstartBegindate.dayOfMonth;
                    var hpstarEnddate = data[0].hpstarEnddate.year +"-"+ data[0].hpstarEnddate.monthValue +"-"+ data[0].hpstarEnddate.dayOfMonth;
                    var hpOrderPower = data[0].hpOrderPower;
                    var hpstarBegintime = data[0].hpstarBegintime.hour+":"+data[0].hpstarBegintime.minute+":"+data[0].hpstarBegintime.second;
                    var hpstarEndtime = data[0].hpstarEndtime.hour+":"+data[0].hpstarEndtime.minute+":"+data[0].hpstarEndtime.second;
                    var hpdiscount = data[0].hpdiscount;
                    var hpDisStarttime = data[0].hpDisStarttime.year +"-"+ data[0].hpDisStarttime.monthValue +"-"+ data[0].hpDisStarttime.dayOfMonth;
                    var hpDisEndtime = data[0].hpDisEndtime.year +"-"+ data[0].hpDisEndtime.monthValue +"-"+ data[0].hpDisEndtime.dayOfMonth;
                    var hpprice = data[0].hpprice;
                    var hpcosts = data[0].hpcosts;
                    $("#powerForm").form("load",{
                        hpstar:hpstar,
                        hpstartBegindate:hpstarEnddate,
                        hpstarEnddate:hpstarEnddate,
                        hpOrderPower:hpOrderPower,
                        hpstarBegintime:hpstarBegintime,
                        hpstarEndtime:hpstarEndtime,
                        hpdiscount:hpdiscount.toString(),
                        hpDisStarttime:hpDisStarttime,
                        hpDisEndtime:hpDisEndtime,
                        hpprice:hpprice.toString(),
                        hpcosts:hpcosts.toString()
                    });
                    $("#powerWin").window("setTitle",host.hname +" 设置权限");
                    $("#powerWin").window("open");
                    return false;
                }
            );
            // 回显数据
        }
        // 批量设置  添加权限
        for(var i=0;i<selected.length;i++){
            hostids.push(selected[i].hid);
        }
        console.log("hostids" + hostids);
        var hnames = [];
        for(var i=0;i<selected.length;i++){
            hnames.push(selected[i].hname);
        }
        console.log(hostids);
        console.log(hostids.toString());
        $("#powerWin").window("setTitle",hnames.toString() +" 设置权限");
        $("#powerWin").window("open");
    });

    // 点击权限设置提交
    $("#powerSubmit").click(function () {
        var flag = $("#powerForm").form("validate");
        if(flag){
            var hostPower = $("#powerForm").serializeJSON();
            console.log(hostPower);
            //这里要注意发送的是string
            hostPower.hostids = hostids.toString();
            console.log(hostPower.hostids);

            $.post(
                "hostPower/setPower",
                hostPower,
                function (data) {
                    // console.log("权限设置成功!");
                    $.messager.alert("温馨提示",data.msg,"info");
                    $('#hostTable').datagrid('reload');
                    $("#powerWin").window("close");
                    $("#powerForm").form("reset");
                    hostids.length = 0;
                },
                "json"
            );
        }
    });

    // 退出powerWin 窗口的时候  数组要设置为空
    $("#powerWin").window({
        onClose:function () {
            hostids.length = 0;
            $("#powerForm").form("reset");
            console.log(hostids);
        }
    });



    // 验证表单提交数据  并使用easyui表单提交数据到服务器
    $("#addHostbtn").click(function () {
        var flag = $("#hostAddForm").form("validate");
        if (flag) {
            // console.log("验证成功");
            $('#hostAddForm').form('submit', {
                url: 'host/addHost',
                success: function (data) {
                    console.log(data);
                    var json = JSON.parse(data);
                    console.log(json);
                    $.messager.alert("温馨提示", json.msg, "info");
                    $("#hostAddForm").form("reset");
                    $("#addWin").window("close");
                    $('#hostTable').datagrid('load');
                }
            });
        }
    });

    //初始化datagrid数据
    $('#hostTable').datagrid({
        header: '#header',
        toolbar: '#toolbar',
        checkOnSelect: false,
        rownumbers: true,
        striped: true,
        fit: true,
        url: 'host/pageData.do',
        pagination: true,
        pageList: [4, 6, 8, 10, 12, 14, 16, 18, 20],
        pageNumber: 1,
        pageSize: 10,
        columns: [[
            {field: 'checkbox', checkbox: true},
            {
                field: 'strong',
                title: '权重',
                width: 70,
                align: 'center',
                formatter: function (value, row, index) {
                    return "<input onchange='updateStrong(this," + row.hid + ");' style='width: 40px;outline: none;' type='text' value='" + value + "' />";
                }
            },
            {field: 'hname', title: '主持人姓名', width: 120, align: 'center'},
            {field: 'hphone', title: '手机', width: 150, align: 'center'},
            {
                field: 'starttime',
                title: '开通时间',
                width: 200,
                align: 'center',
                formatter: function (value, row, index) {
                    return value;
                }
            },
            {field: 'hprice', title: '价格', width: 100, align: 'center'},
            {field: 'ordernumber', title: '订单量', width: 100, align: 'center'},
            {field: 'hpdiscount', title: '折扣', width: 100, align: 'center'},
            {
                field: 'hpstar',
                title: '是否星推荐',
                width: 100,
                align: 'center',
                formatter: function (value, row, index) {
                    return value == '1' ? "是" : "否";
                }
            },
            {
                field: 'status',
                title: '账号状态',
                width: 100,
                align: 'center',
                formatter: function (value, row, index) {
                    return value == '0' ? "<span style='color:red;'>禁用</span>" : "<span style='color:green;'>正常</span>";
                }
            }
        ]]
    });

    // 修改 权重 数值 触发  函数
    function updateStrong(obj, hid) {
        console.log(obj);
        console.log(hid);
        var strong = obj.value;
        console.log(strong);
        $.post(
            "host/updateStrong.do",
            {"hid": hid, "strong": strong},
            function (data) {
                $.messager.alert("温馨提示", data.msg, "info");
            },
            "json"
        );
    }

    //点击搜索 查询条件 reload 重新加载datagrid数据
    $("#searchid").click(function () {
        // 序列化
        var formJson = $("#hostQueryForm").serializeJSON();
        console.log(formJson);
        $('#hostTable').datagrid('load', formJson);
    });

    //点击重置
    $("#resetid").click(function () {
        $("#hostQueryForm").form("reset");
        var formJson = $("#hostQueryForm").serializeJSON();
        $('#hostTable').datagrid('load', formJson);
    });

    //点击添加按钮  弹出window框
    $("#addbtn").click(function () {
        $("#addWin").window('open');
    });

    //修改状态  禁用或启动主持人
    $("#updateStatusdBtn").click(function () {
        // 获取选中的个数
        var selectobj = $("#hostTable").datagrid("getChecked");
        var count = selectobj.length;
        if (count == 0) {
            $.messager.alert("温馨提示", "请选择其中一个主持人!", "info");
        } else if (count > 1) {
            $.messager.alert("温馨提示", "每次只能修改一个主持人!", "info");
        } else {
            $.post(
                "host/updateStatus.do",
                {"hid": selectobj[0].hid, "status": selectobj[0].status},
                function (data) {
                    $.messager.alert("温馨提示", data.msg, "info");
                    $("#hostTable").datagrid("reload");
                },
                "json"
            );
        }
    });


</script>

</body>
</html>
