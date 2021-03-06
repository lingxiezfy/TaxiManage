<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="">

    <title>车辆管理</title>

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
                        <li><i class="fa fa-th-list"></i>车辆运行动态</li>
                    </ol>
                </div>
            </div>
            <!-- page start-->
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="navbar-left">
                                车辆信息
                            </div>
                            <div class="navbar-left">

                                <input style=" height: 30px; margin-left: 20px ; margin-top: 2px" id="u_name_s" name="u_name_s" class="form-control" placeholder="输入车牌号搜索" type="text" onchange="get_car_list(u_stateS,u_nameS,currPage)">

                            </div>


                        </header>

                        <table class="table table-striped table-advance table-hover">
                            <thead>
                            <tr>

                                <th><i class="icon_profile"></i> 车主</th>
                                <th><i class="icon_calendar"></i> 车牌号</th>
                                <th><i class="icon_mail_alt"></i> 类型</th>
                                <th><i class="icon_mobile"></i> 品牌</th>
                                <th><i class="icon_creditcard"></i> 颜色</th>
                                <th><i class="icon_creditcard"></i> 最大载客量</th>
                                <th class="dropdown"><i class="icon_mail_alt"></i>
                                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">状态 <b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#" onclick="get_car_list(0,u_nameS,currPage)">全部</a></li>
                                        <li><a href="#" onclick="get_car_list(1,u_nameS,currPage)">正常</a></li>
                                        <li><a href="#" onclick="get_car_list(2,u_nameS,currPage)" >冻结</a></li>
                                        <li><a href="#" onclick="get_car_list(3,u_nameS,currPage)" >待审核</a></li>
                                    </ul>
                                </th>
                                <th><i class="icon_cogs"></i> Action</th>

                            </tr>
                            </thead>
                            <tbody id="car_list">

                            </tbody>
                        </table>
                        <div class="text-center">
                            <ul class="pagination">
                                <div class="btn-group" id="page-btn">

                                </div>
                            </ul>
                        </div>
                    </section>
                </div>
            </div>
            <!-- page end-->
            <!-- Modal -->
            <div class="modal fade" id="modModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title"><b>重要提示</b></h4>
                        </div>
                        <div class="modal-body">

                            <h4 id="m-title">确认冻结？</h4>

                        </div>
                        <div class="mod-tips tips"></div>
                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button">否</button>
                            <button class="btn btn-danger" id="mod-sub-btn" > 是</button>
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

<script type="text/javascript">
    var u_stateS = 0;
    var u_nameS = "";

    var currPage = 1;
    var totalPage = 1;
    var pageSize = 1;

    $(function () {
        get_car_list(u_stateS,u_nameS, currPage);
    });

    /**
     * 上一页页码
     * @returns {number}
     */
    function get_before_page() {
        if (parseInt(currPage) <= 1) {
            return currPage;
        } else return (currPage - 1);
    }

    /**
     * 下一页页码
     * @returns {number}
     */
    function get_after_page() {
        if (parseInt(currPage) >= parseInt(totalPage)) {
            return currPage;
        } else return (parseInt(currPage) + 1);
    }



    /**
     * 删除
     * @param id
     */
    function del(id) {
        $(".mod-tips-tips").html("");
        $("#modModal").modal("show");
        $("#m-title").html("确认删除？");
        $("#mod-sub-btn").attr("onclick","delete_model_submit("+id+")");
    }

    function delete_model_submit(id) {
        $.ajax({
            cache: false,
            type: "POST",
            url: "<%=path%>/car_servlet",
            data: "id=delete&de_a_id="+id,
            beforeSend: function () {
                $("#mod-sub-btn").attr("disabled", "disabled");
            },
            success: function (e) {
                if (e.status[0].status == "success") {
                    $(".mod-tips").html("删除成功！").show(200);
                    setTimeout(window.location.reload(), 500);
                } else {
                    $(".mod-tips").html("删除失败，请重试！").show(200);
                }
            },
            complete: function () {
                $("#mod-sub-btn").removeAttr("disabled")
            }

        })
    }

    /**
     * 冻结
     */
    function mod(id) {
        $(".mod-tips").html("");
        $("#modModal").modal("show");
        $("#m-title").html("确认冻结？");
        $("#mod-sub-btn").attr("onclick","mod_model_submit("+id+")");
    }

    function mod_model_submit(id) {
        $.ajax({
            cache: false,
            type: "POST",
            url: "<%=path%>/cae_servlet",
            data: "id=mod&de_a_id="+id,
            beforeSend: function () {
                $("#mod-sub-btn").attr("disabled", "disabled");
            },
            success: function (e) {
                if (e.status[0].status == "success") {
                    $(".mod-tips").html("冻结成功！").show(200);
                    setTimeout(window.location.reload(), 500);
                } else {
                    $(".mod-tips").html("冻结失败，请重试！").show(200);
                }
            },
            complete: function () {
                $("#mod-sub-btn").removeAttr("disabled")
            }

        })
    }


    /**
     * 解冻
     */
    function remod(id) {
        $(".mod-tips").html("");
        $("#modModal").modal("show");
        $("#m-title").html("确认解除冻结？");
        $("#mod-sub-btn").attr("onclick","remod_model_submit("+id+")");
    }

    function remod_model_submit(id) {
        $.ajax({
            cache: false,
            type: "POST",
            url: "<%=path%>/car_servlet",
            data: "id=remod&de_a_id="+id,
            beforeSend: function () {
                $("#mod-sub-btn").attr("disabled", "disabled");
            },
            success: function (e) {
                if (e.status[0].status == "success") {
                    $(".mod-tips").html("解冻成功！").show(200);
                    setTimeout(window.location.reload(), 500);
                } else {
                    $(".mod-tips").html("解冻失败，请重试！").show(200);
                }
            },
            complete: function () {
                $("#mod-sub-btn").removeAttr("disabled")
            }

        })
    }

    /**
     * 审核
     */
    function verify(id) {
        $(".mod-tips").html("");
        $("#modModal").modal("show");
        $("#m-title").html("确认通过审核？");
        $("#mod-sub-btn").attr("onclick","verify_model_submit("+id+")");
    }

    function verify_model_submit(id) {
        $.ajax({
            cache: false,
            type: "POST",
            url: "<%=path%>/car_servlet",
            data: "id=remod&de_a_id="+id,
            beforeSend: function () {
                $("#mod-sub-btn").attr("disabled", "disabled");
            },
            success: function (e) {
                if (e.status[0].status == "success") {
                    $(".mod-tips").html("审核通过！").show(200);
                    setTimeout(window.location.reload(), 500);
                } else {
                    $(".mod-tips").html("失败，请重试！").show(200);
                }
            },
            complete: function () {
                $("#mod-sub-btn").removeAttr("disabled")
            }

        })
    }

    function not_null(str) {
        if(str == 'null' || str == '') return '暂无';
        else return str;
    }

    function get_car_list(u_state_s,u_name_s,curr_page) {
        u_nameS = $("#u_name_s").val();

        u_stateS = u_state_s;

        $.ajax({
            cache: false,
            type: "POST",
            url: "<%=path%>/car_servlet",
            data: "id=list&" + "u_state_s=" + u_stateS+ "&u_name_s="+u_nameS+ "&curr_page=" + curr_page + "&page_size=" + pageSize,
            beforeSend: function () {

            },
            success: function (e) {
                var html = "";
                if (e != null && e.car.length > 0) {
                    for (var i = 0; i < e.car.length; i++) {

                        var state = "正常";

                        if(e.car[i].c_state == 2){
                            state = "<span style='color: red;'>冻结</span>";
                        }else if(e.car[i].c_state == 3){
                            state = "<span style='color: #1d36ff;'>待审核</span>";
                        }
                        html += "<tr>\n" +
                            "<td>" + e.car[i].host_name + "</td>\n" +
                            "<td>" + e.car[i].c_plate_number + "</td>\n" +
                            "<td>" + e.car[i].c_t_name + "</td>\n" +
                            "<td>" + not_null(e.car[i].c_brand) + "</td>\n" +
                            "<td>" + not_null(e.car[i].c_color )+ "</td>\n" +
                            "<td>" + e.car[i].c_max_number + "</td>\n" +
                            "<td>" + state + "</td>\n" +
                            "<td>\n" +
                            "<div class=\"btn-group\">\n" ;
                        if(e.car[i].c_state == 3){
                            html += "<a class=\"btn btn-primary\" data-toggle=\"modal\" onclick='verify(" + e.car[i].u_id + ")'><i class=\"icon_target\"></i></a>\n" ;
                        }
                        if(e.car[i].c_state == 1){
                            html += "<a class=\"btn btn-danger\" data-toggle=\"modal\" onclick='mod(" + e.car[i].u_id + ")'><i class=\"icon_error-oct_alt\"></i></a>\n";
                        }
                        html += "<a class=\"btn btn-danger\" data-toggle=\"modal\" onclick='del(" + e.car[i].u_id + ")'><i class=\"icon_close_alt2\"></i></a>\n" ;
                        if(e.car[i].c_state == 2){
                            html += "<a class=\"btn btn-success\" data-toggle=\"modal\" onclick='remod(" + e.car[i].u_id + ")'><i class=\"icon_check_alt2\"></i></a>";
                        }

                         html+="</div>\n" +
                            "</td>\n" +
                            "</tr>";
                    }

                } else {
                    html = "<tr>" +
                        "<td colspan=\"8\">暂无可管理车辆</td>" +
                        "</tr>";
                }
                $("#car_list").html(html);

                var page_html = "";

                if (e != null && e.page.length > 0) {
                    currPage = e.page[0].curr_page;
                    totalPage = e.page[0].total_page;


                    page_html += get_page_btn_list();

                }
                $("#page-btn").html(page_html);

            },
            complete: function () {
            }
        })
    }

    /**
     * 分页列表项
     * @returns {string}
     */
    function get_page_btn_list() {
        var list_html = "";
        var page = currPage - 1;
        if (currPage != 1) {
            list_html += "<button class=\"btn btn-default\" onclick=\"get_car_list(" +u_stateS+",'"+u_nameS + "',1)\" type=\"button\">" + 1 + "</button>";
        }

        if (page > 2) {
            list_html += "<button class=\"btn btn-default\" type=\"button\">...</button>";
            list_html += "<button class=\"btn btn-default\" onclick=\"get_car_list(" +u_stateS+",'"+u_nameS + "',"+page+")\" type=\"button\">" + page + "</button>";
        } else if (page > 1) {
            list_html += "<button class=\"btn btn-default\" onclick=\"get_car_list(" +u_stateS+",'"+u_nameS + "',"+page+")\" type=\"button\">" + page + "</button>";
        }

        list_html += "<button class=\"btn btn-default active\" onclick=\"get_car_list(" +u_stateS+",'"+u_nameS + "',"+currPage+")\" type=\"button\">" + currPage + "</button>";


        page = parseInt(currPage) + 1;
        if (page < (totalPage - 1)) {
            list_html += "<button class=\"btn btn-default\" onclick=\"get_car_list(" +u_stateS+",'"+u_nameS + "',"+page+")\" type=\"button\">" + page + "</button>";
            list_html += "<button class=\"btn btn-default\" type=\"button\">...</button>";

        } else if (page < totalPage) {
            list_html += "<button class=\"btn btn-default\" onclick=\"get_car_list(" +u_stateS+",'"+u_nameS + "',"+page+")\" type=\"button\">" + page + "</button>";
        }
        if (currPage != totalPage && totalPage >0) {
            list_html += "<button class=\"btn btn-default\" onclick=\"get_car_list(" +u_stateS+",'"+u_nameS + "',"+totalPage+")\" type=\"button\">" + totalPage + "</button>";
        }

        return list_html;
    }

</script>
</body>
</html>
