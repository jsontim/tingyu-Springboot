<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="<%=basePath %>"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="static/css/index.css">
    <link rel="stylesheet" href="static/css/base.css">
    <link rel="stylesheet" href="static/css/about.css">
    <link rel="stylesheet" href="static/bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="static/js/jquery-1.12.3.min.js"></script>
    <script type="text/javascript" src="static/layer/layer.js"></script>
    <script type="text/javascript" src="static/js/jquery.validate.js"></script>
    <script type="text/javascript" src="static/js/messages_zh.js"></script>
    <script type="text/javascript" src="static/js/validate-methods.js"></script>
    <script type="text/javascript" src="static/js/jquery.serializejson.min.js"></script>

    <title>注册</title>

    <style>
        label.error {
            font-size: 14px;
            font-weight: bold;
            color: red;
        }
    </style>
</head>
<body>
<!-- 顶部导航布局开始 -->
<div>
    <div class="nav_login">
        <div class="juzhong">
            <p>Ting域主持人欢迎您！ 客服：18812345678</p>
            <p class="p_login"> <a href="javascrip:void(0);"> 登录 | 注册</a></p>
        </div>
    </div>
    <div class="nav_logo">
        <div class="juzhong">
            <img src="static/img/logo.jpg" alt="">
        </div>
    </div>
    <div class="nav_img">
        <img src="static/img/主持人_-_筛选列表_02.jpg" alt="">
    </div>
    <div class="nav_label">
        <div class="juzhong">
            <ui>
                <li class="active"> <a href="javascript:void(0);">首页</a> </li>
                <li> <a href="javascript:void(0);">主持人</a> </li>
                <li> <a href="javascript:void(0);">加入我们</a> </li>
                <li> <a href="javascript:void(0);">关于我们</a> </li>
            </ui>
        </div>
    </div>
</div>
<!-- 顶部导航布局结束 -->


<%--注册表单 开始--%>
<div class="container" style="border-radius:25px;border:1px solid orange;width: 70%;
margin-top:30px;padding:0 18%;margin-bottom: 30px;">
    <div class="row" style="margin-bottom: 30px;margin-top: 20px;">
        <div class="col-md-5" style="text-align: right;">
            <a id="companytab" href="javascript:void(0);" onclick="companyorpersonBtn('company')" style="color:red;font-size:30px;text-decoration:none;">我是公司</a>
        </div>
        <div class="col-md-2" style="text-align: center;"><span style="font-size:30px;">|</span></div>
        <div class="col-md-5">
            <a id="persontab" href="javascript:void(0);" onclick="companyorpersonBtn('marryperson')" style="color:#000;font-size:30px;text-decoration:none;">我是新人</a>
        </div>
    </div>
<%--    我是公司开始--%>
    <div class="row" id="companydiv">
        <form class="form-horizontal">
            <div class="form-group">
                <label for="cname" class="col-sm-3 control-label">公司名称</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="cname" name="cname" placeholder="请输入公司名称">
                </div>
            </div>
            <div class="form-group">
                <label for="ceo" class="col-sm-3 control-label">公司法人</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="ceo" name="ceo" placeholder="请输入公司法人">
                </div>
            </div>
            <div class="form-group">
                <label for="cpwd" class="col-sm-3 control-label">密码</label>
                <div class="col-sm-9">
                    <input type="password" class="form-control" id="cpwd" name="cpwd" placeholder="请输入密码">
                </div>
            </div>
            <div class="form-group">
                <label for="cphone" class="col-sm-3 control-label">手机</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="cphone" name="cphone" placeholder="请输入手机">
                </div>
            </div>
            <div class="form-group">
                <label for="cmail" class="col-sm-3 control-label">公司邮箱</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="cmail" name="cmail" placeholder="请输入邮箱">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-5 col-sm-7">
                    <button type="submit" class="btn btn-primary" style="width:100px;">注册</button>
                </div>
            </div>
        </form>
    </div>
<%--    我是公司结束   --%>
<%--    我是新人开始    --%>
    <div class="row" style="display: none;" id="persondiv">
        <form class="form-horizontal" id="personform" method="post" action="married/register.do">
            <div class="form-group">
                <label for="pname" class="col-sm-3 control-label">新人名称</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="pname" name="pname" placeholder="请输入新人名称">
                </div>
            </div>
            <div class="form-group">
                <label for="pmail" class="col-sm-3 control-label">邮箱</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="pmail" name="pmail" placeholder="请输入邮箱">
                </div>
            </div>
            <div class="form-group">
                <label for="ppwd" class="col-sm-3 control-label">密码</label>
                <div class="col-sm-9">
                    <input type="password" class="form-control" id="ppwd" name="ppwd" placeholder="请输入密码">
                </div>
            </div>
            <div class="form-group">
                <label for="ppwd2" class="col-sm-3 control-label">确认密码</label>
                <div class="col-sm-9">
                    <input type="password" class="form-control" id="ppwd2" name="ppwd2" placeholder="请输入确认密码">
                </div>
            </div>
            <div class="form-group">
                <label for="marrydate" class="col-sm-3 control-label">婚礼日期</label>
                <div class="col-sm-9">
                    <input type="date" class="form-control" id="marrydate" name="marrydate" placeholder="年/月/日">
                </div>
            </div>
            <div class="form-group">
                <label for="phone" class="col-sm-3 control-label">手机</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="phone" name="phone" placeholder="请输入手机">
                </div>
                <div class="col-sm-3">
                    <button id="personSendSms" type="button" class="btn btn-success" style="width:100px;">发送验证码</button>
                </div><!--pointer-events: none;disabled:true;-->
            </div>
            <div class="form-group">
                <label for="verifycode" class="col-sm-3 control-label">验证码</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="verifycode" name="verifycode" placeholder="请输入验证码">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-5 col-sm-7">
                    <button type="submit" class="btn btn-primary" style="width:100px;">注册</button>
                </div>
            </div>
        </form>
    </div>
<%--    我是新人结束   --%>
</div>
<%--注册表单  结束--%>


<!--     搜索部分开始 -->
<div class="search_box">
    <!-- 底部开始 -->
    <div class='footer'>
        <div class='footer_warp'>
            <div class='footer_left'>
                <p class='footer_left_top'>联系我们</p>
                <p class='footer_left_content'>公司地址：北京市长安街天安门1号 / 监督电话：18812345678</p>
                <p class='footer_left_bottom'>copyright2016-2019 版权归Ting域主持人所有 </p>
            </div>
            <div class='footer_right'>
                <div class='QR_left'>
                    <img src="static/img/QR_04.png" alt="">
                    <div class='QR_left_img'>
                        <img src="static/img/QR_03.png" alt="">
                    </div>
                    <p>官方服务号</p>
                </div>
                <div class='QR_left'>
                    <img src="static/img/QR_02.png" alt="">
                    <div class='QR_left_img'>
                        <img src="static/img/QR_01.png" alt="">
                    </div>
                    <p>官方服务号</p>
                </div>
            </div>
        </div>
    </div>
    <!-- 底部结束 -->
    <!-- 固定定位导航布局开始 -->
    <div class="QR_right">
        <div class='QR_right_top'>
            <!-- <img src="img/QR_small.png" alt=""> -->
            <img src="static/img/QR_small.png" alt="">
            <div class='QR_box'>
                <div class='QR_box_content'>
                    <img src="static/img/QR_right.png" alt="">
                    <p class='QR_box_content_font'>关注官方二维码接受订单通知</p>
                </div>
                <div class='QR_box_triangle'>
                    <img src="static/img/sanjiao.png" alt="">
                </div>
            </div>
        </div>
        <a href="#">
            <div class='QR_right_bottom'>
                <img src="static/img/jiantou.png" alt="">
            </div>
        </a>
    </div>

    <!-- 固定定位导航布局结束 -->
</div>


<script>

    // 发送短信按钮
    $("#personSendSms").click(function () {
        // 判断手机号码是否有写    判断手机的格式是否正确     都可以就发送请求
        var phone = $("#phone").val().trim();
        console.log(phone);
        if(phone == ""){
            layer.msg('手机不能为空', {icon: 5});
            return false;
        }
        var reg = /^1([38][0-9]|4[5-9]|5[0-3,5-9]|66|7[0-8]|9[89])[0-9]{8}$/;
        if(!reg.test(phone)){
            layer.msg('手机格式不正确', {icon: 5});
            return false;
        }

        $.post(
            "sendSms.do",
            {phone:phone},
            function (data) {
                console.log(data);
                var json = JSON.parse(data);
                if(json.Code == "OK"){
                    layer.msg('验证码发送成功!', {icon: 6});
                    // 点击以后  修改样式  屏蔽点击  60s秒后才可以再点
                    $('#personSendSms').attr('disabled',"true");
                    var second = 10;
                    var timer = setInterval(function () {
                        $("#personSendSms").text(second + "秒后重发");
                        console.log(second);
                        if(second==0){
                            $('#personSendSms').removeAttr("disabled");
                            $("#personSendSms").text("发送验证码");
                            clearInterval(timer);
                        }
                        second--;
                    },1000);
                    return false;
                }

                layer.msg('验证码发送失败!', {icon: 5});
                $('#personSendSms').attr('disabled',"true");
                var second = 10;
                var timer = setInterval(function () {
                    $("#personSendSms").text(second + "秒后重发");
                    console.log(second);
                    if(second==0){
                        $('#personSendSms').removeAttr("disabled");
                        $("#personSendSms").text("发送验证码");
                        clearInterval(timer);
                    }
                    second--;
                },1000);
            }
        );

    });
    function companyorpersonBtn(tabname) {
        if(tabname == 'company'){
            $("#companydiv").css("display","block");
            $("#companytab").css("color","red");
            $("#persontab").css("color","#000");
            $("#persondiv").css("display","none");
            $("#companytab").attr("disabled",true).css("pointer-events","none");
            $("#persontab").attr("disabled",false).css("pointer-events","auto");

        }else{
            $("#companydiv").css("display","none");
            $("#companytab").css("color","#000");
            $("#persontab").css("color","red");
            $("#persondiv").css("display","block");
            $("#persontab").attr("disabled",true).css("pointer-events","none");
            $("#companytab").attr("disabled",false).css("pointer-events","auto");
        }
    }
</script>

<script>
    // 验证提交
    $(function () {
        $("#personform").validate({
            rules:{
                pname:{
                    required:true,
                    minlength:2,
                    isChinese:true
                },
                pmail:{
                    required:true,
                    isMyEmail:true
                },
                ppwd:{
                    required:true,
                    minlength: 5
                },
                ppwd2:{
                    required:true,
                    minlength: 5,
                    equalTo: "#ppwd"
                },
                marrydate:"required",
                phone:{
                    required:true,
                    isMobile: true
                },
                verifycode:{
                    required:true,
                    remote: {
                        url: "verifycode.do",     //后台处理程序
                        type: "post",               //数据发送方式
                        dataType: "json",           //接受数据格式
                        data: {                     //要传递的数据
                            verifycode: function() {
                                return $("#verifycode").val();
                            }
                        }
                    }
                }
            },
            messages:{
                pname: {
                    required:"新人名称不能为空",
                    minlength: "名称不得少于两个字",
                    isChinese: "请填写真实名称"
                },
                pmail: {
                    required:"邮箱不能为空",
                    isMyEmail:"请填写正确的邮箱"
                },
                ppwd:{
                    required:"密码不能为空",
                    minlength: "密码不能少于5位"
                },
                marrydate:"请选择婚礼时间",
                phone:{
                    required:"手机号码不能为空",
                    isMobile: "手机号码不正确"
                },
                verifycode:{
                    required:"验证码不能为空",
                    remote:"验证码不正确"
                }
            },
            onkeyup:false,
            submitHandler:function (form) {
                console.log(form);
                // 下面会有问题:  没有引入
                // var marriedPerson = $("#personform").serializeJSON();
                // console.log(marriedPerson);

                var marriedPerson = $(form).serialize();
                console.log(marriedPerson);

                //  下面也会有问题:  应该需要插件
                // $(form).ajaxSubmit(
                //     "married/register.do",
                //     marriedPerson,
                //     function (data) {
                //         if(data.code==200){
                //             console.log("注册成功");
                //             return false;
                //         }
                //         layer.msg(data.msg, {icon: 5});
                //     }
                // );

                // $(form).ajaxSubmit({
                //     dataType:"json",
                //     type:'post',
                //     url: "married/register.do",
                //     success:function(data){
                //         if(data.code==200){
                //             layer.msg(data.msg, {icon: 6,time:2000},function () {
                //                 window.location.href = "front/login.jsp";
                //             });
                //             return false;
                //         }
                //         layer.msg(data.msg, {icon: 5});
                //     }
                // });


                $.post(
                    "married/register.do",
                    marriedPerson,
                    function (data) {
                        if(data.code==200){
                            layer.msg(data.msg, {icon: 6,time:2000},function () {
                                window.location.href = "front/login.jsp";
                            });
                            return false;
                        }
                        layer.msg(data.msg, {icon: 5});
                    }
                );
                //15521079617
            }
        });
    })
</script>
</body>


</html>
