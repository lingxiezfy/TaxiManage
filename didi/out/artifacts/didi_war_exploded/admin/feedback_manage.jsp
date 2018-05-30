<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="">

    <title>反馈管理</title>

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
                    <h3 class="page-header"><i class="fa fa-table"></i> 客服管理</h3>
                    <ol class="breadcrumb">
                        <li><i class="fa fa-home"></i><a href="<%=path%>/admin_list">Home</a></li>
                        <li><i class="fa fa-table"></i>客服管理</li>
                        <li><i class="fa fa-th-list"></i>用户反馈</li>
                    </ol>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <section class="panel">
                        <header class="panel-heading">
                            反馈列表
                        </header>
                        <div class="list-group">
                            <a class="list-group-item " href="#">
                                反馈1
                            </a>
                            <a class="list-group-item" href="javascript:;">反馈2</a>
                            <a class="list-group-item" href="javascript:;">反馈3</a>
                            <a class="list-group-item" href="javascript:;">反馈4</a>
                            <a class="list-group-item" href="javascript:;">反馈5</a>
                            <a class="list-group-item" href="javascript:;">反馈6</a>
                        </div>
                    </section>
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
