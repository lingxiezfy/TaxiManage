<%--
  Created by IntelliJ IDEA.
  User: fyu
  Date: 2018-01-04
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<aside>
    <div id="sidebar"  class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu">
            <li class="active">
                <a class="" href="<%=path%>/admin_list">
                    <i class="icon_house_alt"></i>
                    <span>管理员管理</span>
                </a>
            </li>
            <li >
                <a class="" href="<%=path%>/admin/user_manage.jsp">
                    <i class="icon_house_alt"></i>
                    <span>用户管理</span>
                </a>
            </li>
            <li >
                <a class="" href="<%=path%>/admin/driver_manage.jsp">
                    <i class="icon_house_alt"></i>
                    <span>司机管理</span>
                </a>
            </li>

            <li class="sub-menu">
                <a href="javascript:;" class="">
                    <i class="icon_document_alt"></i>
                    <span>车辆管理</span>
                    <span class="menu-arrow arrow_carrot-right"></span>
                </a>
                <ul class="sub">
                    <li><a class="" href="<%=path%>/admin/car_manage.jsp">车辆运行动态</a></li>
                    <li><a class="" href="<%=path%>/admin/company_manage.jsp">公司加盟</a></li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:;" class="">
                    <i class="icon_desktop"></i>
                    <span>客服管理</span>
                    <span class="menu-arrow arrow_carrot-right"></span>
                </a>
                <ul class="sub">
                    <li><a class="" href="<%=path%>/admin/question_manage.jsp">问题分析</a></li>
                    <li><a class="" href="<%=path%>/admin/feedback_manage.jsp">用户反馈</a></li>
                </ul>
            </li>
            <li>
                <a class="" href="<%=path%>/admin/community_manage.jsp">
                    <i class="icon_genius"></i>
                    <span>社区管理</span>
                </a>
            </li>

        </ul>
        <!-- sidebar menu end-->
    </div>
</aside>