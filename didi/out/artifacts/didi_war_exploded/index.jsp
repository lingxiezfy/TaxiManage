<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>首页 - 开始你的行程</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/index/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <link rel="stylesheet" type="text/css" href="css/zzsc.css">

</head>

<%
    String u_name = "";
    int u_id = 0;
    String u_photo = "";
    int u_state = 0;
    boolean is_driver = false;
    try{
        u_id = Integer.parseInt(session.getAttribute("u_id").toString());
        u_state =Integer.parseInt(session.getAttribute("u_state").toString());
        u_name = session.getAttribute("u_name").toString();
        u_photo = session.getAttribute("u_photo").toString();
        is_driver = Boolean.parseBoolean(session.getAttribute("is_driver").toString());
        System.out.println(is_driver);
    }catch (Exception e){
        u_name = "";
        u_id = 0;
        u_photo = "";
        u_state = 0;
        is_driver = false;
    }

%>

<%
    String error = request.getParameter("error");
    String msg = "";
    if (error != null) {

         if (error.equals("2")) {
            msg = "未登录，禁止访问！";
        } else {
            msg = "未知原因";
        }
%>
<%--<script type="text/javascript">--%>
    <%--window.alert('<%=msg%>');--%>
<%--</script>--%>
<%
    }
%>

<body>

<div class="demo">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="canva"></div>
            </div>
            <div class="col-md-4">
                <div class="navbar">
                    <span>
                        <span id="fa-car" class="fa fa-car fa-2x"></span>
                        <span id="user_photo" class="hide">
                            <img class="user_photo" src="<%=u_photo%>" />
                        </span>
                    </span>
                    <ul class="menu">
                        <li><a onclick="login_popup()" class="fa fa-hand-o-up"></a></li>
                        <li><a href="#" class="fa fa-taxi"></a></li>
                        <li><a href="#" class="fa fa-user-md"></a></li>
                        <li><a href="#" class="fa fa-bug"></a></li>
                        <li><a href="#" class="fa fa-comments-o"></a></li>
                        <li><a href="admin/login.jsp" class="fa fa-cog"></a></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-4">
                <div class="canva"></div>
            </div>
        </div>
    </div>
</div>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
    <p>滴滴打车网页版</p>
    <p style="color: grey;font-size: 12px">©2014 &nbsp; 京公网安备11000002002025号 京ICP备12043664号-5　京ICP证150329号
        京网文【2018】2410-473</p>
</div>
<!-- 烟花背景 -->
<script type="text/javascript" src="js/fireworks.js"></script>
<!-- login 弹窗 -->

<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
     aria-hidden="true" style="display: none;">
    <div style="display:table; width:100%; height:100%;">
        <div style="vertical-align:middle; display:table-cell;">
            <div class="modal-dialog modal-sm" style="width:540px;">
                <div class="modal-content" style="border: none;">
                    <div class="col-left"></div>
                    <div class="col-right">
                        <div class="modal-header">
                            <button type="button" id="login_close" class="close" data-dismiss="modal"><span
                                    aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title" id="loginModalLabel" style="font-size: 18px;">登录</h4>
                        </div>
                        <div class="modal-body hide" id="isLogin">

                            尊敬的<b><%=u_name%></b>,您已登录<a class='c-red' onclick='logout_all()'>退出登录</a>
                        </div>
                        <div class="modal-body" id="toLogin">
                            <section class="box-login v5-input-txt" id="box-login">
                                <form id="login_form" action="" method="post" autocomplete="off">

                                    <ul>
                                        <li class="form-group"><input class="form-control" id="user_name"
                                                                      maxlength="50" name="user_name"
                                                                      placeholder="请输入账号" type="text"></li>
                                        <li class="form-group"><input class="form-control" id="user_pwd"
                                                                      name="user_pwd" placeholder="请输入密码"
                                                                      type="password"></li>

                                    </ul>
                                </form>
                                <p class="good-tips marginB10"><a id="btnForgetpsw" class="fr">忘记密码？</a>还没有账号？<a
                                        href="register.jsp" target="_blank" id="btnRegister">立即注册</a></p>
                                <div class="login-box marginB10">
                                    <button id="login_btn" type="button" class="btn btn-micv5 btn-block globalLogin" onclick="login_form_submit()">
                                        登录
                                    </button>

                                </div>
                                <div id="login-form-tips" class="size-14 tips-error bg-danger c-red ">错误提示信息
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/login.js"></script>

<%
    if(u_id > 0){
%>
<script type="text/javascript">
    hide_login_form();
</script>
<%

    }else {
%>
<script type="text/javascript">
    show_login_form();
</script>
<%
    }
%>

<script type="text/javascript">


</script>
</body>
</html>