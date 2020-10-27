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
    <form id="companyQueryForm" method="post">
        <input class="easyui-textbox" name="cname" id="cname" type="text"
               data-options="prompt:'公司名称(可不全写)',width:140"/>
        <select class="easyui-combobox" name="status" id="status" style="width:100px;" data-options="panelHeight:120">
            <option value="">账号状态</option>
            <option value="0">禁用</option>
            <option value="1">正常</option>
            <option value="2">未审核</option>
        </select>
        <select class="easyui-combobox" name="ordernumber" id="ordernumber" style="width:120px;"
                data-options="panelHeight:120">
            <option value="">订单排序</option>
            <option value="0">订单量降序</option>
            <option value="1">订单量升序</option>
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
    <a id="editbtn" href="javascript:void(0);" class="easyui-linkbutton"
       data-options="iconCls:'icon-ok',plain:true">编辑</a>
    <a id="plannerlist" href="javascript:void(0);" class="easyui-linkbutton"
       data-options="iconCls:'icon-tip',plain:true">策划师列表</a>
    <a id="updateStatusdBtn" href="javascript:void(0);" class="easyui-linkbutton"
       data-options="iconCls:'icon-clear',plain:true">禁用启用账号</a>
    <a id="checkBtn" href="javascript:void(0);" class="easyui-linkbutton"
       data-options="iconCls:'icon-redo',plain:true">账号审核</a>
</div>

<table id="companyTable"></table>

<%--新增修改婚庆公司窗口--%>
<div id="companyWindow" data-options="closed:true" class="easyui-window" style="width: 400px;padding: 30px 30px">
    <form id="companyForm" class="easyui-form" method="post">
        <input name="cid" type="hidden">
        <div style="width: 100%">
            <input required data-options="label:'公司名称'" style="width: 100%" class="easyui-textbox" name="cname">
        </div>
        <div style="margin-top: 20px;width: 100%">
            <input required data-options="label:'公司法人'" style="width: 100%" class="easyui-textbox" name="ceo">
        </div>

        <div style="margin-top: 20px;width: 100%">
            <input id="cpwd" required data-options="label:'密码',showEye:false" style="width: 100%"
                   class="easyui-passwordbox" name="cpwd">
        </div>
        <div style="margin-top: 20px;width: 100%">
            <input id="cpwd1" validType="equals['#cpwd']" required data-options="label:'确认密码',showEye:false"
                   style="width: 100%" class="easyui-passwordbox" name="cpwd1">
        </div>
        <div style="margin-top: 20px;width: 100%">
            <input required data-options="label:'邮箱',validType:'email'" style="width: 100%" class="easyui-textbox"
                   name="cmail">
        </div>
        <div style="margin-top: 20px;width: 100%">
            <input required data-options="label:'手机'" style="width: 100%" class="easyui-textbox" name="cphone">
        </div>
        <div style="margin-top: 20px;width: 100%">
            <a id="companysubmit" href="javascript:void(0)" style="width: 100%" class="easyui-linkbutton">提交</a>
        </div>
    </form>
</div>

<%--策划师列表窗口--%>
<div id="plannerWindow" data-options="closed:true" data-options="modal:true" class="easyui-window"
     style="width: 80%;height: 60%">
    <%--策划师表格--%>
    <table id="plannerDatagrid" class="easyui-datagrid" data-options="pagination:true"
           style="width: 100%;height: 100%"></table>
</div>


<script>
    //  禁用或启用 按钮
    $("#updateStatusdBtn").click(function () {
        var rows = $("#companyTable").datagrid("getChecked");
        if (rows.length == 0) {
            $.messager.alert("温馨提示", "请选择婚庆公司!", "info");
            return false;
        }
        // 判断状态status  如果为2  请先审核账号
        var status = rows[0].status;
        // if (status == "2") {
        //     $.messager.alert("温馨提示", "该公司账号尚未审核,请先审核账号!", "info");
        //     return false;
        // }

        $.messager.confirm('温馨提示', status=="1"?'您确定要禁用此婚庆公司吗?':'您确定要启用此婚庆公司吗?', function (r) {
            if (r) {
                $.post("company/updateStatus",
                    {cid: rows[0].cid,status:status},
                    function (data) {
                        if (data.code == 400) {
                            $.messager.alert("温馨提示", data.msg, "info");
                            return false;
                        }
                        // 审核成功  刷新界面
                        $("#companyTable").datagrid("reload");
                        $.messager.alert("温馨提示", data.msg, "info");
                    },
                    "json"
                );
            }
        });

    });

        // 点击审核账号
        $("#checkBtn").click(function () {
            var rows = $("#companyTable").datagrid("getChecked");
            if (rows.length == 0) {
                $.messager.alert("温馨提示", "请选择婚庆公司!", "info");
                return false;
            }
            // 获取状态  判断  如果状态为0或1, 就不用更新
            var status = rows[0].status;
            if (status == "0" || status == "1") {
                $.messager.alert("温馨提示", "此婚庆公司已审核,无需再次审核!", "info");
                return false;
            }

            $.post("company/checkedStatus",
                {cid: rows[0].cid},
                function (data) {
                    if (data.code == 400) {
                        $.messager.alert("温馨提示", data.msg, "info");
                        return false;
                    }
                    // 审核成功  刷新界面
                    $("#companyTable").datagrid("reload");
                    $.messager.alert("温馨提示", data.msg, "info");

                },
                "json"
            );


        });

        // 公司的策划师列表
        $("#plannerlist").click(function () {
            // 判断是否选择了公司
            var rows = $("#companyTable").datagrid("getChecked");
            if (rows.length == 0) {
                $.messager.alert("温馨提示", "请选择婚庆公司!", "info");
            } else if (rows.length == 1) {
                //获取公司的数据
                var company = rows[0];
                // 设置标题
                $("#plannerWindow").window("setTitle", company.cname + "策划师列表");
                $("#plannerWindow").window("open");

                /*加载策划师列表的数据*/
                $("#plannerDatagrid").datagrid({
                    pagination: true,
                    checkOnSelect: false,
                    selectOnCheck: true,
                    singleSelect: true,
                    rownumbers: true,
                    pageList: [2, 4, 6, 8, 10, 12],
                    pageNumber: 1,
                    pageSize: 10,
                    striped: true,
                    url: 'planner/list.do?cid=' + company.cid,
                    columns: [[
                        {field: 'nid', title: '编号', width: 100, align: 'center'},
                        {field: 'nname', title: '策划师姓名', width: 150, align: 'center'},
                        {field: 'nphone', title: '策划师电话', width: 150, align: 'center'},
                        {
                            field: 'addtime',
                            title: '添加时间',
                            width: 150,
                            align: 'center',
                            formatter: function (value, row, index) {
                                return value.year + "-" + value.monthValue + "-" + value.dayOfMonth;
                            }
                        },
                        {field: 'ordernumber', title: '订单数量', width: 150, align: 'center'},
                        {
                            field: 'status',
                            title: '状态',
                            width: 150,
                            align: 'center',
                            formatter: function (value, row, index) {
                                return value == 0 ? " <span style='color:red'>禁用</span>" : " <span style='color:green'>启用</span>";
                            }
                        }
                    ]]
                })
            }
        });


        // 密码校验
        $.extend($.fn.validatebox.defaults.rules, {
            equals: {
                validator: function (value, param) {
                    return value == $(param[0]).val();
                },
                message: '两个密码不一致!'
            }
        });

        //初始化datagrid数据
        $('#companyTable').datagrid({
            header: '#header',
            toolbar: '#toolbar',
            checkOnSelect: true,
            singleSelect: true,
            selectOnCheck: true,
            rownumbers: true,
            striped: true,
            fit: true,
            url: 'company/list.do',
            pagination: true,
            pageList: [4, 6, 8, 10, 12, 14, 16, 18, 20],
            pageNumber: 1,
            pageSize: 10,
            columns: [[
                {field: 'checkbox', checkbox: true},
                {field: 'cname', title: '婚庆公司名称', width: 200, align: 'center'},
                {field: 'ceo', title: '公司法人', width: 150, align: 'center'},
                {field: 'cphone', title: '法人手机', width: 150, align: 'center'},
                {field: 'cmail', title: '邮箱', width: 150, align: 'center'},
                {
                    field: 'starttime',
                    title: '开通时间',
                    width: 150,
                    align: 'center',
                    formatter: function (value, row, index) {
                        return value.year + "-" + value.monthValue + "-" + value.dayOfMonth;
                    }
                },
                {field: 'ordernumber', title: '订单数量', width: 150, align: 'center'},
                {
                    field: 'status',
                    title: '审核状态',
                    width: 150,
                    align: 'center',
                    formatter: function (value, row, index) {
                        if ("0" == value) {
                            return "<span style='color:red;'>禁用</span>";
                        } else if ("1" == value) {
                            return "<span style='color:green;'>正常</span>";
                        } else if ("2" == value) {
                            return "<span style='color:red;'>未审核</span>";
                        }
                    }
                }
            ]]
        });

        $("#searchid").click(function () {
            //提交表单
            //序列化表单数据
            //datagrid 数据重新加载
            var company = $("#companyQueryForm").serializeJSON();
            $("#companyTable").datagrid("load", company);
        });

        // 重置 按钮
        $("#resetid").click(function () {
            $("#companyQueryForm").form("reset");
            var formJson = $("#companyQueryForm").serializeJSON();
            $("#companyTable").datagrid("load", formJson);
        });


        // 点击 添加公司  按钮
        $("#addbtn").click(function () {
            //打开添加窗口  设置标题
            $("#companyWindow").window("setTitle", "新增婚庆公司");
            $("#companyWindow").window("open");
        });

        //  点击提交 添加公司 或 修改公司信息
        $("#companysubmit").click(function () {
            // 使用easyui 内置的表单提交  校验数据操作
            $('#companyForm').form('submit', {
                url: "company/addorupdateCompany.do",
                onSubmit: function () {
                    return $("#companyForm").form("validate");
                },
                success: function (data) {
                    var json = JSON.parse(data);
                    if (json.code == 200) {
                        $("#companyForm").form("reset");
                        $("#companyWindow").window("close");
                        $("#companyTable").datagrid("reload");
                        $.messager.alert("温馨提示", json.msg, "info");
                    }
                }
            });
        });

        //  点击编辑按钮
        $("#editbtn").click(function () {
            // 判断是否有选择
            var rows = $("#companyTable").datagrid("getChecked");
            if (rows.length == 0) {
                $.messager.alert("温馨提示", "请选择其中一家公司!", "info");
            } else if (rows.length == 1) {
                //获取公司的数据
                var company = rows[0];
                company.cpwd = "";
                console.log(company);
                // 回显数据到表单
                $('#companyForm').form('load', company);
                // 设置标题
                $("#companyWindow").window("setTitle", "修改婚庆公司信息");
                $("#companyWindow").window("open");
            }
        });


</script>
</body>
</html>
