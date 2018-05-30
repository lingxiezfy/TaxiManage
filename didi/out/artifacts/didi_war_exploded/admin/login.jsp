<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path=request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="">

    <title>后台登录</title>

    <!-- Bootstrap CSS -->    
    <link href="<%=path%>/admin/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="<%=path%>/admin/css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="<%=path%>/admin/css/elegant-icons-style.css" rel="stylesheet" />
    <link href="<%=path%>/admin/css/font-awesome.min.css" rel="stylesheet" />
    <!-- Custom styles -->
    <link href="<%=path%>/admin/css/style.css" rel="stylesheet">
    <link href="<%=path%>/admin/css/style-responsive.css" rel="stylesheet" />

</head>

  <body class="login-img3-body">

    <div class="container">

      <form class="login-form" action="/didi/admin_login" method="post">
        <div class="login-wrap">
            <p class="login-img"><i class="icon_lock_alt"></i></p>
            <div class="input-group">
              <span class="input-group-addon"><i class="icon_profile"></i></span>
              <input type="text" id="a_count" name="a_count" class="form-control" placeholder="管理员帐号" >
            </div>
            <div class="input-group">
                <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                <input type="password" id="a_password" name="a_password" class="form-control" placeholder="密码">
            </div>
            <label class="checkbox">
                <input type="checkbox" value="remember-me"> 记住我
                <span class="pull-right"> <a href="#"> 忘记密码?</a></span>
            </label>
            <button class="btn btn-primary btn-lg btn-block" type="button" onclick="login_submit()">登录</button>
        </div>
      </form>

    </div>
  </body>
<script type="text/javascript" src="<%=path%>/admin/js/jquery.js"></script>
<script type="text/javascript">
    function login_submit() {
        if($("#a_count").val().length <= 0){
            $("#a_count").focus();
        }else if($("#a_password").val().length <= 0){
            $("#a_password").focus();
        }else {
            $(".login-form").submit();
        }
}
</script>

<%
    String error = request.getParameter("error");
    String msg = "";
    if (error != null) {

        if (error.equals("1") || error.equals("2")) {
            msg = "账户名或密码错误！";
        } else if (error.equals("4")) {
            msg = "未登录，禁止访问！";
        } else {
            msg = "未知原因";
        }
%>
<script type="text/javascript">
    window.alert('<%=msg%>');
</script>
<%
    }
%>

</html>
