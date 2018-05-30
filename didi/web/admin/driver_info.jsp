<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
      <meta charset="utf-8">
      <link rel="shortcut icon" href="">

      <title>司机详细信息</title>

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
      
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
		  <div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa-user-md"></i> Profile</h3>
					<ol class="breadcrumb">
                        <li><i class="fa fa-home"></i><a href="<%=path%>/admin_list">Home</a></li>
						<li><i class="icon_documents_alt"></i>Pages</li>
						<li><i class="fa fa-user-md"></i>Profile</li>

					</ol>
				</div>
			</div>
              <div class="row">
                <!-- profile-widget -->
                <div class="col-lg-12">
                    <div class="profile-widget profile-widget-info">
                          <div class="panel-body">
                            <div class="col-lg-2">
                              <h4>Jenifer Smith</h4>               
                              <div class="follow-ava">
                                  <img src="img/profile-widget-avatar.jpg" alt="">
                              </div>
                            </div>
                            <div class="col-lg-4 col-sm-4 follow-info">
                                <p>Hello I’m Jenifer Smith, a leading expert in interactive and creative design.</p>
                                <p>@jenifersmith</p>
								<p><i class="fa fa-twitter">jenifertweet</i></p>
                                <h6>
                                    <span><i class="icon_clock_alt"></i>11:05 AM</span>
                                    <span><i class="icon_calendar"></i>25.10.13</span>
                                    <span><i class="icon_pin_alt"></i>NY</span>
                                </h6>
                            </div>

                          </div>
                    </div>
                </div>
              </div>
              <!-- page start-->
              <div class="row">
                 <div class="col-lg-12">
                    <section class="panel">
                          <header class="panel-heading tab-bg-info">
                              <ul class="nav nav-tabs">
                                  <li class="active">
                                      <a data-toggle="tab" href="#profile">
                                          <i class="icon-user"></i>
                                          司机信息
                                      </a>
                                  </li>
                                  <li >
                                      <a data-toggle="tab" href="#edit-profile">
                                          <i class="icon-envelope"></i>
                                          车辆信息
                                      </a>
                                  </li>
                                  <li>
                                      <a class="btn btn-warning" data-toggle="modal" href="#myModal2">
                                          <i class="icon_error-oct" style="border-right: none;"></i>冻结该司机
                                      </a>
                                      <!-- Modal -->
                                      <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                          <div class="modal-dialog">
                                              <div class="modal-content">
                                                  <div class="modal-header">
                                                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                      <h4 class="modal-title"><b>重要提示</b></h4>
                                                  </div>
                                                  <div class="modal-body">

                                                      <h4 >确认冻结？</h4>

                                                  </div>
                                                  <div class="modal-footer">
                                                      <button data-dismiss="modal" class="btn btn-default" type="button">否</button>
                                                      <button class="btn btn-danger" type="button"> 是</button>
                                                  </div>
                                              </div>
                                          </div>
                                      </div>
                                      <!-- modal -->

                                  </li>
                              </ul>
                          </header>
                          <div class="panel-body">
                              <div class="tab-content">
                                  <!-- profile -->
                                  <div id="profile" class="tab-pane active">
                                    <section class="panel">
                                      <div class="bio-graph-heading">
                                                Hello I’m Jenifer Smith, a leading expert in interactive and creative design specializing in the mobile medium. My graduation from Massey University with a Bachelor of Design majoring in visual communication.
                                      </div>
                                      <div class="panel-body bio-graph-info">
                                          <h1>Bio Graph</h1>
                                          <div class="row">
                                              <div class="bio-row">
                                                  <p><span>First Name </span>: Jenifer </p>
                                              </div>
                                              <div class="bio-row">
                                                  <p><span>Last Name </span>: Smith</p>
                                              </div>                                              
                                              <div class="bio-row">
                                                  <p><span>Birthday</span>: 27 August 1987</p>
                                              </div>
                                              <div class="bio-row">
                                                  <p><span>Country </span>: United</p>
                                              </div>
                                              <div class="bio-row">
                                                  <p><span>Occupation </span>: UI Designer</p>
                                              </div>
                                              <div class="bio-row">
                                                  <p><span>Email </span>:jenifer@mailname.com</p>
                                              </div>
                                              <div class="bio-row">
                                                  <p><span>Mobile </span>: (+6283) 456 789</p>
                                              </div>
                                              <div class="bio-row">
                                                  <p><span>Phone </span>:  (+021) 956 789123</p>
                                              </div>
                                          </div>
                                      </div>
                                    </section>
                                      <section>
                                          <div class="row">                                              
                                          </div>
                                      </section>
                                  </div>
                                  <!-- 车辆信息 -->
                                  <div id="edit-profile" class="tab-pane">
                                    <section class="panel">
                                        <div class="profile-widget profile-widget-info">
                                            <div class="panel-body">
                                                <div class="col-lg-2">
                                                    <h4>Jenifer Smith</h4>
                                                    <div class="follow-ava">
                                                        <img src="img/profile-widget-avatar.jpg" alt="">
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-sm-4 follow-info">
                                                    <p>Hello I’m Jenifer Smith, a leading expert in interactive and creative design.</p>
                                                    <p>@jenifersmith</p>
                                                    <p><i class="fa fa-twitter">jenifertweet</i></p>
                                                    <h6>
                                                        <span><i class="icon_clock_alt"></i>11:05 AM</span>
                                                        <span><i class="icon_calendar"></i>25.10.13</span>
                                                        <span><i class="icon_pin_alt"></i>NY</span>
                                                    </h6>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="profile-widget profile-widget-info">
                                            <div class="panel-body">
                                                <div class="col-lg-2">
                                                    <h4>Jenifer Smith</h4>
                                                    <div class="follow-ava">
                                                        <img src="img/profile-widget-avatar.jpg" alt="">
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-sm-4 follow-info">
                                                    <p>Hello I’m Jenifer Smith, a leading expert in interactive and creative design.</p>
                                                    <p>@jenifersmith</p>
                                                    <p><i class="fa fa-twitter">jenifertweet</i></p>
                                                    <h6>
                                                        <span><i class="icon_clock_alt"></i>11:05 AM</span>
                                                        <span><i class="icon_calendar"></i>25.10.13</span>
                                                        <span><i class="icon_pin_alt"></i>NY</span>
                                                    </h6>
                                                </div>

                                            </div>
                                        </div>
                                      </section>
                                  </div>
                              </div>
                          </div>
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
