<%--
  Created by IntelliJ IDEA.
  User: fyu
  Date: 2018-01-04
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();%>
<%
    int a_id = 0;
    int a_t_id = 0;
    String a_count = "";
    int cpn_id = 0;
    String logo_dir = "";
    String cpn_name = "";
    try {
        a_id = Integer.parseInt(request.getSession().getAttribute("a_id").toString());
        a_t_id = Integer.parseInt(request.getSession().getAttribute("a_t_id").toString());
        a_count = request.getSession().getAttribute("a_count").toString();
    }catch (Exception e){
        a_id = 0;
        a_t_id = 0;
        a_count = "";
        e.printStackTrace();
    }
    if(a_id <= 0){
        response.sendRedirect(path+"/admin/login.jsp?error=4");
    }else {
        logo_dir = path+"/admin/img/avatar1_small.jpg";
        if(a_t_id == 3){
            try {
                logo_dir = request.getSession().getAttribute("cpn_ico").toString();
                cpn_id = Integer.parseInt(request.getSession().getAttribute("cpn_id").toString());
                cpn_name = request.getSession().getAttribute("cpn_name").toString();
            }catch (Exception e){
                cpn_id = 0;
                logo_dir = path+"/admin/img/avatar1_small.jpg";
                cpn_name = "公司名称";
                e.printStackTrace();
            }
        }
    }


%>

<header class="header dark-bg">
    <div class="toggle-nav">
        <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"></div>
    </div>

    <!--logo start-->
    <a href="<%=path%>/admin/car_manage.jsp" class="logo">滴滴&nbsp; <span class="lite">后台管理</span></a>
    <!--logo end-->

    <div class="top-nav notification-row">
        <!-- notificatoin dropdown start-->
        <ul class="nav pull-right top-menu">

            <!-- user login dropdown start-->
            <li class="dropdown">
                <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="profile-ava">
                                <img alt="<%=cpn_name%>" style="width: 34px ;height: 34px" src="<%=logo_dir%>">
                            </span>
                    <span class="username"><%=a_count%></span>
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu extended logout">
                    <div class="log-arrow-up"></div>

                    <li>
                        <a href="<%=path%>/admin_logout"><i class="icon_key_alt"></i> Log Out</a>
                    </li>
                </ul>
            </li>
            <!-- user login dropdown end -->
        </ul>
        <!-- notificatoin dropdown end-->
    </div>
</header>
