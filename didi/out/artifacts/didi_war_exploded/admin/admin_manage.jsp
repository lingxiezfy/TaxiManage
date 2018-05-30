<%@ page import="java.util.List" %>
<%@ page import="model.T_admin" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="">

    <title>管理员管理</title>

    <!-- common CSS-->
    <jsp:include page="include/common_css.jsp"/>

</head>

<body>
<!-- container section start -->
<section id="container" class="">

    <!--header start-->
    <%@include file="include/header.jsp" %>
    <!--header end-->

    <!--sidebar start-->
    <jsp:include page="include/aside.jsp"/>
    <!--sidebar end-->

    <section id="main-content">
        <section class="wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><i class="fa fa-table"></i> 管理员</h3>
                    <ol class="breadcrumb">
                        <li><i class="fa fa-home"></i><a href="<%=path%>/admin_list">Home</a></li>
                        <li><i class="fa fa-table"></i>管理员管理</li>
                    </ol>
                </div>
            </div>

            <!-- page start-->
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="navbar-left">
                                管理员信息
                            </div>
                            <div class="navbar-left">
                                <a class="btn btn-primary" style=" height: 30px; margin-left: 20px ; margin-top: 2px"
                                   data-toggle="modal" href="#addModal" title="Add">
                                    <span class="icon_plus_alt2" style="border-right: none;"></span>
                                </a>
                            </div>
                        </header>

                        <table class="table table-striped table-advance table-hover">
                            <thead>
                            <tr>
                                <th><i class="icon_profile"></i> 账户</th>
                                <th class="dropdown"><i class="icon_calendar"></i>
                                    <a href="javascript:;" class="dropdown-toggle" id="drop_a_type_list"
                                       onclick="get_admin_type_list()" data-toggle="dropdown">类型 <b
                                            class="caret"></b></a>
                                    <ul class="dropdown-menu" id="a_type_list">
                                        <li><a href="#">正常</a></li>
                                        <li><a href="#">冻结</a></li>
                                    </ul>
                                </th>
                                <th><i class="icon_cogs"></i> Action</th>
                            </tr>
                            </thead>
                            <tbody id="admin_list">

                            </tbody>
                        </table>
                        <div class="text-center">
                            <ul class="pagination">
                                <div class="btn-group" id="page-btn">
                                    <button class="btn btn-default" type="button">&lt;</button>
                                    <button class="btn btn-default" type="button">1</button>
                                    <button class="btn btn-default" type="button">3</button>
                                    <button class="btn btn-default" type="button">4</button>
                                    <button class="btn btn-default" type="button">5</button>
                                    <button class="btn btn-default" type="button">&gt;</button>
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
            <!-- modal -->
            <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">增加管理员</h4>
                        </div>
                        <form class="form-horizontal " id="add-form" method="post">
                            <div class="modal-body">
                                <div class="form-group">
                                    <div class="col-sm-10">
                                        <input id="a_count" name="a_count" class="form-control input-lg m-bot15"
                                               type="text" placeholder="管理员账户" required="required">
                                        <input id="a_pwd" name="a_pwd" type="password" class="form-control m-bot15"
                                               placeholder="请输入新密码"
                                               required="required">
                                        <%if (a_t_id <= 2) {%>
                                        <select id="a_t_id" name="a_t_id" onchange="a_type_change()"
                                                class="form-control m-bot15" required>
                                            <option value="">管理员类型</option>
                                            <%if (a_t_id == 1) {%>
                                            <option value="1">系统管理员</option>
                                            <%}%>
                                            <option value="2">普通管理员</option>
                                            <option value="3">公司管理员</option>
                                        </select>
                                        <select id="cpn_id" name="cpn_id" class="form-control m-bot15" disabled
                                                required>
                                            <option value="">所属公司</option>
                                            <option value="1">南昌</option>
                                        </select>

                                        <script type="text/javascript">
                                            function a_type_change() {
                                                if ($("#a_t_id").val() != "3") {
                                                    $("#cpn_id").attr("disabled", "disabled");
                                                    var html = "<option value=\"\">所属公司</option>";
                                                    $("#cpn_id").html(html);
                                                } else {
                                                    get_cpn_name_list();
                                                }
                                            }
                                        </script>
                                        <%} else {%>
                                        <input type="hidden" id="a_t_id" name="a_t_id" value="<%=a_t_id%>">
                                        <input type="hidden" id="cpn_id" name="cpn_id" value="<%=cpn_id%>">
                                        <%}%>

                                    </div>
                                </div>
                                <div class="add-tips tips"></div>
                            </div>
                            <div class="modal-footer">
                                <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                                <button class="btn btn-success" id="add-sub-btn" onclick="add_model_submit()">保存
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
            <!-- modal -->
        </section>
    </section>
    <!--main content end-->

</section>
<!-- container section end -->
<!-- javascripts -->
<!-- common js-->
<jsp:include page="include/common_js.jsp"/>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript">


    var a_t_idS = 0;
    var currPage = 1;
    var totalPage = 1;
    var pageSize = 3;

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

    $(function () {
        get_admin_list(a_t_idS, currPage);
    });

    /**
     * 获取公司列表
     */
    function get_cpn_name_list() {
        $.ajax({
            cache: false,
            type: "POST",
            url: "<%=path%>/company_name_list",
            beforeSend: function () {
                $("#cpn_id").attr("disabled", false);
            },
            success: function (e) {
                if (e != null && e.company.length > 0) {
                    var html = "<option value=\"\">所属公司</option>";

                    for (var i = 0; i < e.company.length; i++) {
                        html += "<option value='" + e.company[i].cpn_id + "'>" + e.company[i].cpn_name + "</option>";
                    }
                    $("#cpn_id").html(html);
                }

            },
            complete: function () {
            }
        })
    }

    /**
     * 增加管理员
     */
    function add_model_submit() {
        $.ajax({
            cache: false,
            type: "POST",
            url: "<%=path%>/admin_register",
            data: "id=right&" + $("#add-form").serialize(),
            beforeSend: function () {
                $("#add-sub-btn").html("保存中..."), $("#add-sub-btn").attr("disabled", "disabled");
            },
            success: function (e) {
                if (e.status[0].status == "success") {
                    $(".add-tips").html("保存成功！").show(200);
                    setTimeout(window.location.reload(), 500);
                } else if (e.status[0].status == "re_count") {
                    $(".add-tips").html("已存在！").show(200);
                } else {
                    $(".add-tips").html("保存失败，请重试！").show(200);
                }
            },
            complete: function () {
                $("#add-sub-btn").html("保存"), $("#add-sub-btn").removeAttr("disabled")
            }
        })
    }

    /**
     * 获取管理员类型列表
     */
    function get_admin_type_list() {
        $.ajax({
            cache: false,
            type: "POST",
            url: "<%=path%>/admin_type_list",
            beforeSend: function () {
                $("#drop_a_type_list").attr("disabled", true);
            },
            success: function (e) {
                if (e != null && e.a_type.length > 0) {
                    var html = "<li><a onclick='get_admin_list(0," + currPage + ")' >全部</a></li>";
                    for (var i = 0; i < e.a_type.length; i++) {
                        html += "<li><a onclick='get_admin_list(" + e.a_type[i].a_t_id + "," + currPage + ")'>" + e.a_type[i].a_t_name + "</a></li>";
                    }
                    $("#a_type_list").html(html);
                }

            },
            complete: function () {
                $("#drop_a_type_list").attr("disabled", false);
            }
        })
    }

    /**
     * 获取管理员列表
     * @param a_t_id_in
     */
    function get_admin_list(a_t_id_s, curr_page) {
        a_t_idS = a_t_id_s;

        $.ajax({
            cache: false,
            type: "POST",
            url: "<%=path%>/admin_list",
            data: "id=json&" + "a_t_id_s=" + a_t_id_s + "&curr_page=" + curr_page + "&page_size=" + pageSize,
            beforeSend: function () {

            },
            success: function (e) {
                var html = "";
                if (e != null && e.admin.length > 0) {
                    for (var i = 0; i < e.admin.length; i++) {
                        var name = "";
                        if (e.admin[i].a_t_id == 3) {
                            name = e.admin[i].a_t_name + "(" + e.admin[i].cpn_name + ")";
                        } else {
                            name = e.admin[i].a_t_name;
                        }
                        html += "<tr>\n" +
                            "<td>" + e.admin[i].a_count + "</td>\n" +
                            "<td>" + name + "</td>\n" +
                            "<td>\n" +
                            "<div class=\"btn-group\">\n" +
                            "<a class=\"btn btn-primary\" data-toggle=\"modal\" onclick='edit(" + e.admin[i].a_id + ")'><i class=\"icon_pencil-edit\"></i></a>\n" +
                            "<a class=\"btn btn-danger\" data-toggle=\"modal\" onclick='del(" + e.admin[i].a_id + ")'><i class=\"icon_close_alt2\"></i></a>\n" +
                            "</div>\n" +
                            "</td>\n" +
                            "</tr>";
                    }

                } else {
                    html = "<tr>" +
                        "<td colspan=\"3\">暂无可管理账户</td>" +
                        "</tr>";
                }
                $("#admin_list").html(html);

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
     * 修改管理员密码
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
            url: "<%=path%>/admin_edit",
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
     * 删除管理员
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
            url: "<%=path%>/admin_delete",
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
     * 分页列表项
     * @returns {string}
     */
    function get_page_btn_list() {
        var list_html = "";
        var page = currPage - 1;
        if (currPage != 1) {
            list_html += "<button class=\"btn btn-default\" onclick='get_admin_list(" + a_t_idS + ",1)' type=\"button\">" + 1 + "</button>";
        }

        if (page > 2) {
            list_html += "<button class=\"btn btn-default\" type=\"button\">...</button>";
            list_html += "<button class=\"btn btn-default\" onclick='get_admin_list(" + a_t_idS + "," + get_before_page() + ")' type=\"button\">" + page + "</button>";
        } else if (page > 1) {
            list_html += "<button class=\"btn btn-default\" onclick='get_admin_list(" + a_t_idS + "," + get_before_page() + ")' type=\"button\">" + page + "</button>";
        }

        list_html += "<button class=\"btn btn-default active\" onclick='get_admin_list(" + a_t_idS + "," + currPage + ")' type=\"button\">" + currPage + "</button>";


        page = parseInt(currPage) + 1;
        if (page < (totalPage - 1)) {
            list_html += "<button class=\"btn btn-default\" onclick='get_admin_list(" + a_t_idS + "," + get_after_page() + ")' type=\"button\">" + page + "</button>";
            list_html += "<button class=\"btn btn-default\" type=\"button\">...</button>";

        } else if (page < totalPage) {
            list_html += "<button class=\"btn btn-default\" onclick='get_admin_list(" + a_t_idS + "," + get_after_page() + ")' type=\"button\">" + page + "</button>";
        }
        if (currPage != totalPage && totalPage >0) {
            list_html += "<button class=\"btn btn-default\" onclick='get_admin_list(" + a_t_idS + "," + totalPage + ")' type=\"button\">" + totalPage + "</button>";
        }


        return list_html;
    }

</script>
</body>
</html>
