<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="">

    <title>用户信息</title>

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
                    <h3 class="page-header"><i class="fa fa-table"></i> 用户管理</h3>
                    <ol class="breadcrumb">
                        <li><i class="fa fa-home"></i><a href="<%=path%>/admin_list">Home</a></li>
                        <li><i class="fa fa-table"></i>用户管理</li>

                    </ol>
                </div>
            </div>
            <!-- page start-->
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="navbar-left">
                            用户信息
                            </div>
                            <div class="navbar-left">

                                <input style=" height: 30px; margin-left: 20px ; margin-top: 2px" id="u_name_s" name="u_name_s" class="form-control" placeholder="输入用户名搜索" type="text" onchange="get_user_list(u_stateS,u_nameS,currPage)">

                            </div>


                        </header>

                        <table class="table table-striped table-advance table-hover">
                            <thead>
                            <tr>

                                <th><i class="icon_profile"></i> 用户名</th>
                                <th><i class="icon_calendar"></i> 年龄</th>
                                <th><i class="icon_mail_alt"></i> 性别</th>
                                <th><i class="icon_mobile"></i> 手机号</th>
                                <th><i class="icon_creditcard"></i> 身份证号</th>
                                <th><i class="icon_creditcard"></i> 信用分</th>
                                <th class="dropdown"><i class="icon_mail_alt"></i>
                                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">状态 <b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#" onclick="get_user_list(0,u_nameS,currPage)">全部</a></li>
                                        <li><a href="#" onclick="get_user_list(1,u_nameS,currPage)">正常</a></li>
                                        <li><a href="#" onclick="get_user_list(2,u_nameS,currPage)" >冻结</a></li>
                                    </ul>
                                </th>
                                <th><i class="icon_cogs"></i> Action</th>

                            </tr>
                            </thead>
                            <tbody id="user_list">

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
            <!-- Dialog Modal -->
            <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">修改密码</h4>
                        </div>
                        <form class="form-horizontal" id="edit-form" method="post">
                            <div class="modal-body">
                                <div class="form-group">
                                    <div class="col-sm-10">
                                        <input type="password" id="re_a_pwd" name="re_a_pwd" class="form-control"
                                               placeholder="请输入新密码"
                                               required="true">
                                        <input type="text" style="display: none" />
                                        <input type="hidden" id="re_a_id" name="re_a_id"/>
                                    </div>
                                </div>
                                <div class="edit-tips tips"></div>
                            </div>
                            <div class="modal-footer">
                                <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                                <button class="btn btn-success" onclick="edit_model_submit()" id="edit-sub-btn">保存
                                </button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title"><b>重要提示</b></h4>
                        </div>
                        <div class="modal-body">

                            <h4>确认删除？</h4>

                        </div>
                        <div class="delete-tips tips"></div>
                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button">否</button>
                            <button class="btn btn-danger" id="delete-sub-btn" > 是</button>
                        </div>
                    </div>
                </div>
            </div>

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

                            <h4>确认冻结？</h4>

                        </div>
                        <div class="mod-tips tips"></div>
                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button">否</button>
                            <button class="btn btn-danger" id="mod-sub-btn" > 是</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="remodModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title"><b>重要提示</b></h4>
                        </div>
                        <div class="modal-body">

                            <h4>确认解除冻结？</h4>

                        </div>
                        <div class="remod-tips tips"></div>
                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button">否</button>
                            <button class="btn btn-danger" id="remod-sub-btn" > 是</button>
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
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript">
    var u_stateS = 0;
    var u_nameS = "";

    var currPage = 1;
    var totalPage = 1;
    var pageSize = 3;

    $(function () {
        get_user_list(u_stateS,u_nameS, currPage);
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
     * 修改密码
     * @param id
     */
    function edit(id) {
        $(".edit-tips").html("");
        $("#editModal").modal("show");
        $("#re_a_id").attr("value", id);
    }

    function edit_model_submit() {
        $.ajax({
            cache: false,
            type: "POST",
            url: "<%=path%>/user_edit",
            data: "id=edit&" + $("#edit-form").serialize(),
            beforeSend: function () {
                if($("#re_a_pwd").val().length ==0) return false;
                $("#edit-sub-btn").html("保存中..."), $("#edit-sub-btn").attr("disabled", "disabled");
            },
            success: function (e) {
                if (e.status[0].status == "success") {
                    $(".edit-tips").html("保存成功！").show(200);
                    setTimeout(window.location.reload(), 500);
                } else {
                    $(".edit-tips").html("保存失败，请重试！").show(200);
                }
            },
            complete: function () {
                $("#edit-sub-btn").html("保存"), $("#edit-sub-btn").removeAttr("disabled")
            }

        })
    }

    /**
     * 删除
     * @param id
     */
    function del(id) {
        $(".delete-tips").html("");
        $("#deleteModal").modal("show");
        $("#delete-sub-btn").attr("onclick","delete_model_submit("+id+")");
    }

    function delete_model_submit(id) {
        $.ajax({
            cache: false,
            type: "POST",
            url: "<%=path%>/user_delete",
            data: "id=delete&de_a_id="+id,
            beforeSend: function () {
                $("#delete-sub-btn").attr("disabled", "disabled");
            },
            success: function (e) {
                if (e.status[0].status == "success") {
                    $(".delete-tips").html("删除成功！").show(200);
                    setTimeout(window.location.reload(), 500);
                } else {
                    $(".delete-tips").html("删除失败，请重试！").show(200);
                }
            },
            complete: function () {
                $("#delete-sub-btn").removeAttr("disabled")
            }

        })
    }

    /**
     * 冻结
     */
    function mod(id) {
        $(".mod-tips").html("");
        $("#modModal").modal("show");
        $("#mod-sub-btn").attr("onclick","mod_model_submit("+id+")");
    }

    function mod_model_submit(id) {
        $.ajax({
            cache: false,
            type: "POST",
            url: "<%=path%>/user_mod",
            data: "id=mod&de_a_id="+id,
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
     * 解冻
     */
    function remod(id) {
        $(".remod-tips").html("");
        $("#remodModal").modal("show");
        $("#remod-sub-btn").attr("onclick","remod_model_submit("+id+")");
    }

    function remod_model_submit(id) {
        $.ajax({
            cache: false,
            type: "POST",
            url: "<%=path%>/user_remod",
            data: "id=remod&de_a_id="+id,
            beforeSend: function () {
                $("#remod-sub-btn").attr("disabled", "disabled");
            },
            success: function (e) {
                if (e.status[0].status == "success") {
                    $(".remod-tips").html("解冻成功！").show(200);
                    setTimeout(window.location.reload(), 500);
                } else {
                    $(".remod-tips").html("解冻失败，请重试！").show(200);
                }
            },
            complete: function () {
                $("#remod-sub-btn").removeAttr("disabled")
            }

        })
    }


    function get_user_list(u_state_s,u_name_s,curr_page) {
        u_nameS = $("#u_name_s").val();

        u_stateS = u_state_s;

        $.ajax({
            cache: false,
            type: "POST",
            url: "<%=path%>/user_list",
            data: "id=json&" + "u_state_s=" + u_stateS+ "&u_name_s="+u_nameS+ "&curr_page=" + curr_page + "&page_size=" + pageSize,
            beforeSend: function () {

            },
            success: function (e) {
                var html = "";
                if (e != null && e.user.length > 0) {
                    for (var i = 0; i < e.user.length; i++) {
                        var sex = "";
                        var birth = 0;
                        var state = "正常";
                        var credit = e.user[i].u_credit;
                        if (e.user[i].u_sex == null) {
                            sex = "暂无";
                        } else if(e.user[i].u_sex == 1){
                            sex = "男";
                        }else {
                            sex = "女";
                        }
                        if(e.user[i].u_state == 2){
                            state = "<span style='color: red;'>冻结</span>";
                        }else if(e.user[i].u_state == 3){
                            state = "未确认";
                        }
                        if(credit < 80 ){
                            credit = "<span style='color: red;'>"+credit+"</span>"
                        }
                        html += "<tr>\n" +
                            "<td>" + e.user[i].u_name + "</td>\n" +
                            "<td>" + ages(e.user[i].u_birth_day) + "</td>\n" +
                            "<td>" + sex + "</td>\n" +
                            "<td>" + e.user[i].u_phone_number + "</td>\n" +
                            "<td>" + e.user[i].u_id_card_number + "</td>\n" +
                            "<td>" + credit + "</td>\n" +
                            "<td>" + state + "</td>\n" +
                            "<td>\n" +
                            "<div class=\"btn-group\">\n" +

                            "<a class=\"btn btn-primary\" data-toggle=\"modal\" onclick='edit(" + e.user[i].u_id + ")'><i class=\"icon_pencil-edit\"></i></a>\n" +
                            "<a class=\"btn btn-danger\" data-toggle=\"modal\" onclick='mod(" + e.user[i].u_id + ")'><i class=\"icon_error-oct_alt\"></i></a>\n" +
                            "<a class=\"btn btn-danger\" data-toggle=\"modal\" onclick='del(" + e.user[i].u_id + ")'><i class=\"icon_close_alt2\"></i></a>\n" +
                            "<a class=\"btn btn-success\" data-toggle=\"modal\" onclick='remod(" + e.user[i].u_id + ")'><i class=\"icon_check_alt2\"></i></a>"+
                            "</div>\n" +
                            "</td>\n" +
                            "</tr>";
                    }

                } else {
                    html = "<tr>" +
                        "<td colspan=\"9\">暂无可管理用户</td>" +
                        "</tr>";
                }
                $("#user_list").html(html);

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
            list_html += "<button class=\"btn btn-default\" onclick=\"get_user_list(" +u_stateS+",'"+u_nameS + "',1)\" type=\"button\">" + 1 + "</button>";
        }

        if (page > 2) {
            list_html += "<button class=\"btn btn-default\" type=\"button\">...</button>";
            list_html += "<button class=\"btn btn-default\" onclick=\"get_user_list(" +u_stateS+",'"+u_nameS + "',"+page+")\" type=\"button\">" + page + "</button>";
        } else if (page > 1) {
            list_html += "<button class=\"btn btn-default\" onclick=\"get_user_list(" +u_stateS+",'"+u_nameS + "',"+page+")\" type=\"button\">" + page + "</button>";
        }

        list_html += "<button class=\"btn btn-default active\" onclick=\"get_user_list(" +u_stateS+",'"+u_nameS + "',"+currPage+")\" type=\"button\">" + currPage + "</button>";


        page = parseInt(currPage) + 1;
        if (page < (totalPage - 1)) {
            list_html += "<button class=\"btn btn-default\" onclick=\"get_user_list(" +u_stateS+",'"+u_nameS + "',"+page+")\" type=\"button\">" + page + "</button>";
            list_html += "<button class=\"btn btn-default\" type=\"button\">...</button>";

        } else if (page < totalPage) {
            list_html += "<button class=\"btn btn-default\" onclick=\"get_user_list(" +u_stateS+",'"+u_nameS + "',"+page+")\" type=\"button\">" + page + "</button>";
        }
        if (currPage != totalPage && totalPage >0) {
            list_html += "<button class=\"btn btn-default\" onclick=\"get_user_list(" +u_stateS+",'"+u_nameS + "',"+totalPage+")\" type=\"button\">" + totalPage + "</button>";
        }

        return list_html;
    }

    /**
     * 计算年龄
     * @param str 2018-1-1
     * @returns {*}
     */
    function  ages(str)
    {
        var   r   =   str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
        if(r==null)return   "暂无";
        var   d=   new   Date(r[1],   r[3]-1,   r[4]);
        if   (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4])
        {
            var   Y   =   new   Date().getFullYear();
            return((Y-r[1]));
        }
        return("有误");
    }
</script>
</body>
</html>

