<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="">

    <title>社区管理</title>

    <!-- common CSS-->
    <jsp:include page="include/common_css.jsp" />


</head>

<body>
<!-- container section start -->
<section id="container" class="">

    <!--header start-->
    <%@include file="include/header.jsp" %>
    <!--header end-->

    <!--sidebar start-->
    <jsp:include page="include/aside.jsp" />
    <!--sidebar end-->

    <section id="main-content">
        <section class="wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><i class="fa fa-table"></i> 社区管理</h3>
                    <ol class="breadcrumb">
                        <li><i class="fa fa-home"></i><a href="<%=path%>/admin_list">Home</a></li>
                        <li><i class="fa fa-table"></i>社区管理</li>
                    </ol>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="act-time">
                        <div class="activity-body act-in">
                            <span class="arrow"></span>
                            <div class="text">
                                <a href="#" class="activity-img"><img class="avatar" src="img/chat-avatar.jpg" alt=""></a>
                                <h5 style="color: #2d2b32">标题</h5>
                                <p class="t-text-area">部分内容</p>
                                <p class="attribution"><a href="#">用户</a> at 4:25pm 2018-01-01</p>

                            </div>
                        </div>
                    </div>
                    <div class="act-time">
                        <div class="activity-body act-in">
                            <span class="arrow"></span>
                            <div class="text">
                                <a href="#" class="activity-img"><img class="avatar" src="img/chat-avatar.jpg" alt=""></a>
                                <h5 style="color: #2d2b32">标题</h5>
                                <p class="t-text-area">部分内容</p>
                                <p class="attribution"><a href="#">用户</a> at 4:25pm 2018-01-01</p>

                            </div>
                        </div>
                    </div>
                    <div class="act-time">
                    <div class="activity-body act-in">
                        <span class="arrow"></span>
                        <div class="text">
                            <a href="#" class="activity-img"><img class="avatar" src="img/chat-avatar.jpg" alt=""></a>
                            <h5 style="color: #2d2b32">标题</h5>
                            <p class="t-text-area">部分内容</p>
                            <p class="attribution"><a href="#">用户</a> at 4:25pm 2018-01-01</p>

                        </div>
                    </div>
                </div>
                </div>

            </div>


        </section>
    </section>
    <!--main content end-->


</section>
<!-- container section end -->
<!-- javascripts -->
<!-- common js-->
<jsp:include page="include/common_js.jsp" />


</body>
</html>
