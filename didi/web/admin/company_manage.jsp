<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="">

    <title>公司管理</title>

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
                    <h3 class="page-header"><i class="fa fa-table"></i> 车辆管理</h3>
                    <ol class="breadcrumb">
                        <li><i class="fa fa-home"></i><a href="<%=path%>/admin_list">Home</a></li>
                        <li><i class="fa fa-table"></i>车辆管理</li>
                        <li><i class="fa fa-th-list"></i>公司加盟</li>
                    </ol>
                </div>
            </div>
            <!-- page start-->
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            公司信息
                        </header>

                        <table class="table table-striped table-advance table-hover">
                            <tbody>
                            <tr>
                                <th><i class="icon_profile"></i> 公司名</th>

                                <th><i class="icon_cogs"></i> Action</th>
                            </tr>
                            <tr>
                                <td>出租车公司</td>

                                <td>
                                    <div class="btn-group">
                                        <a class="btn btn-primary" href="#"><i class="icon_pencil-edit"></i></a>
                                        <a class="btn btn-danger" data-toggle="modal" href="#myModal3"><i class="icon_close_alt2"></i></a>

                                        <!-- Modal -->
                                        <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        <h4 class="modal-title"><b>重要提示</b></h4>
                                                    </div>
                                                    <div class="modal-body">

                                                        <h4 >确认删除？</h4>

                                                    </div>
                                                    <div class="modal-footer">
                                                        <button data-dismiss="modal" class="btn btn-default" type="button">否</button>
                                                        <button class="btn btn-danger" type="button"> 是</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- modal -->

                                    </div>
                                </td>
                            </tr>

                            </tbody>
                        </table>
                    </section>
                </div>
            </div>
            <!-- page end-->

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
