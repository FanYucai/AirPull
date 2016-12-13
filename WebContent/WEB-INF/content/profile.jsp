<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>AirPull | Free Extract Tool by AirDrop</title>
		
		
		<meta name="description" content="Worthy a Bootstrap-based, Responsive HTML5 Template">
		<meta name="author" content="htmlcoder.me">
	
		<!-- Mobile Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!-- Favicon -->
		<link rel="shortcut icon" href="images/favicon.ico">

		<!-- Web Fonts -->
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,400,700,300&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Raleway:700,400,300' rel='stylesheet' type='text/css'>

		<!-- Bootstrap core CSS -->
		<link href="bootstrap/css/bootstrap.css" rel="stylesheet">

		<!-- Font Awesome CSS -->
		<link href="fonts/font-awesome/css/font-awesome.css" rel="stylesheet">

		<!-- Plugins -->
		<link href="css/animations.css" rel="stylesheet">

		<!-- Worthy core CSS file -->
		<link href="css/style.css" rel="stylesheet">

		<!-- Custom css --> 
		<link href="css/custom.css" rel="stylesheet">
	</head>

	<body class="no-trans">
		<% String nickname = request.getParameter("name");%>
		<!-- scrollToTop -->
		<!-- ================ -->
		<div class="scrollToTop"><i class="icon-up-open-big"></i></div>

		<!-- header start -->
		<!-- ================ --> 
		<header class="header fixed clearfix navbar navbar-fixed-top">
			<div class="container">
				<div class="row">
					<div class="col-md-4">

						<!-- header-left start -->
						<!-- ================ -->
						<div class="header-left clearfix">

							<!-- logo -->
							<div class="logo smooth-scroll">
								<a href=homeLogged><img id="logo" src="images/adlogo.png" alt="Worthy"></a>
							</div>

							<!-- name-and-slogan -->
							<div class="site-name-and-slogan smooth-scroll">
								<div class="site-name"><a href="homeLogged">AirPull</a></div>
								<div class="site-slogan">Free Web Extract Tool by <a target="_blank" href="http://htmlcoder.me">AirDrop</a></div>
							</div>

						</div>
						<!-- header-left end -->

					</div>
					<div class="col-md-8">

						<!-- header-right start -->
						<!-- ================ -->
						<div class="header-right clearfix">

							<!-- main-navigation start -->
							<!-- ================ -->
							<div class="main-navigation animated">

								<!-- navbar start -->
								<!-- ================ -->
								<nav class="navbar navbar-default" role="navigation">
									<div class="container-fluid">

										<!-- Toggle get grouped for better mobile display -->
										<div class="navbar-header">
											<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
												<span class="sr-only">Toggle navigation</span>
												<span class="icon-bar"></span>
												<span class="icon-bar"></span>
												<span class="icon-bar"></span>
											</button>
										</div>

										<!-- Collect the nav links, forms, and other content for toggling -->
										<div class="collapse navbar-collapse scrollspy smooth-scroll" id="navbar-collapse-1">
											<ul class="nav navbar-nav navbar-right">
												<li><a href="#services"><%=nickname %></a></li>
												<li><a href="#repository">Repository</a></li>
												<li><a href="backHomeLogged?name=<%=nickname %>">Back</a></li>
												<!-- <li><a href="#export">Export</a></li> -->
											</ul>
										</div>

									</div>
								</nav>
								<!-- navbar end -->

							</div>
							<!-- main-navigation end -->

						</div>
						<!-- header-right end -->

					</div>
				</div>
			</div>
		</header>
		<!-- header end -->
		
		<!-- section start -->
		<!-- ================ -->
		<div class="default-bg space black">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h1 class="text-center">&nbsp;</h1>
					</div>
				</div>
			</div>
		</div>
		<!-- section end -->

		<!-- section start -->
		<!-- ================ -->
		<div class="section translucent-bg bg-image-1 black">
			<div class="container object-non-visible" data-animation-effect="fadeIn">
				<h1 id="services"  class="text-center title">个人信息</h1>
				<div class="space"></div>
				<div class="row">
					<div class="space visible-xs"></div>
						
					<div class="col-sm-6">
						<div class="media-left">
							<i class="fa fa-leaf"></i>
						</div>
						<div class="media-body">
							<h4 class="media-heading">用户名</h4>
							<p><s:property value="user.name"/></p>
						</div>
						<br/>
						<div class="media-left">
							<i class="fa fa-leaf"></i>
						</div>
						<div class="media-body">
							<h4 class="media-heading">昵称</h4>
							<p><s:property value="user.nickname"/></p>
						</div>
						<br/>
						<div class="media-left">
							<i class="fa fa-leaf"></i>
						</div>
						<div class="media-body">
							<a href="goChangePassword?name=${user.name}"><h4 class="media-heading">修改密码</h4></a>
						</div>
						<br/>
						<div class="media-left">
							<i class="fa fa-leaf"></i>
						</div>
						<div class="media-body">
							<a href="goChangeEmail?name=${user.name}"><h4 class="media-heading">修改邮箱</h4></a>
						</div>
						
					</div>
									
								
					<div class="space visible-xs"></div>
					
					<div class="col-sm-6">
						<div class="media">
							<div class="media-left">
								<i class="fa fa-leaf"></i>
							</div>
							<div class="media-body">
								<h4 class="media-heading">Service 5</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure aperiam consequatur quo quis exercitationem reprehenderit dolor vel ducimus, voluptate eaque suscipit iste placeat.</p>
							</div>
						</div>
						<div class="media">
							<div class="media-left">
								<i class="fa fa-area-chart"></i>
							</div>
							<div class="media-body">
								<h4 class="media-heading">Service 6</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure aperiam consequatur quo quis exercitationem reprehenderit dolor vel ducimus, voluptate eaque suscipit iste placeat.</p>
							</div>
						</div>
						<div class="media">
							<div class="media-left">
								<i class="fa fa-child"></i>
							</div>
							<div class="media-body">
								<h4 class="media-heading">Service 7</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure aperiam consequatur quo quis exercitationem reprehenderit dolor vel ducimus, voluptate eaque suscipit iste placeat.</p>
							</div>
						</div>
						<div class="media">
							<div class="media-left">
								<i class="fa fa-codepen"></i>
							</div>
							<div class="media-body">
								<h4 class="media-heading">Service 8</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure aperiam consequatur quo quis exercitationem reprehenderit dolor vel ducimus, voluptate eaque suscipit iste placeat.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- section end -->
		
		<!-- section start -->
		<!-- ================ -->
		<div class="section clearfix object-non-visible" data-animation-effect="fadeIn">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1 id="repository" class="title text-center">你的AirPull仓库</h1>
					
						<div class="space"></div>
						<div class="row">
							
							<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
							
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingOne">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
												淘宝网数据抽取 #1
											</a>
										</h4>
									</div>
									<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
										<div class="panel-body">
										<jsp:include page="showExcel1.jsp" flush="true" > 
										<jsp:param value="view" name="piId"/> 
										<jsp:param value="view" name="action"/> 
										</jsp:include>
										</div>
									</div>
								</div>
								
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingTwo">
										<h4 class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
												教务处网站数据抽取 #2
											</a>
										</h4>
									</div>
									<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
										<div class="panel-body">
										<jsp:include page="showExcel2.jsp" flush="true" > 
										<jsp:param value="view" name="piId"/> 
										<jsp:param value="view" name="action"/> 
										</jsp:include>
										</div>
									</div>
								</div>
								
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingThree">
										<h4 class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
												游戏数据 #3
											</a>
										</h4>
									</div>
									<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
										<div class="panel-body">
										<jsp:include page="showExcel3.jsp" flush="true" > 
										<jsp:param value="view" name="piId"/> 
										<jsp:param value="view" name="action"/> 
										</jsp:include>
										</div>
									</div>
								</div>
								
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingFour">
										<h4 class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
												游戏数据 #4
											</a>
										</h4>
									</div>
									<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
										<div class="panel-body">
										<jsp:include page="showExcel4.jsp" flush="true" > 
										<jsp:param value="view" name="piId"/> 
										<jsp:param value="view" name="action"/> 
										</jsp:include>
										</div>
									</div>
								</div>
								
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingFive">
										<h4 class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
												游戏数据 #5
											</a>
										</h4>
									</div>
									<div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
										<div class="panel-body">
										<jsp:include page="showExcel5.jsp" flush="true" > 
										<jsp:param value="view" name="piId"/> 
										<jsp:param value="view" name="action"/> 
										</jsp:include>
										</div>
									</div>
								</div>
								
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingSix">
										<h4 class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
												游戏数据 #6
											</a>
										</h4>
									</div>
									<div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
										<div class="panel-body">
										<jsp:include page="showExcel6.jsp" flush="true" > 
										<jsp:param value="view" name="piId"/> 
										<jsp:param value="view" name="action"/> 
										</jsp:include>
										</div>
									</div>
								</div>
								
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingSeven">
										<h4 class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
												游戏数据 #7
											</a>
										</h4>
									</div>
									<div id="collapseSeven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSeven">
										<div class="panel-body">
										<jsp:include page="showExcel7.jsp" flush="true" > 
										<jsp:param value="view" name="piId"/> 
										<jsp:param value="view" name="action"/> 
										</jsp:include>
										</div>
									</div>
								</div>
								
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingEight">
										<h4 class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
												游戏数据 #8
											</a>
										</h4>
									</div>
									<div id="collapseEight" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingEight">
										<div class="panel-body">
										<jsp:include page="showExcel8.jsp" flush="true" > 
										<jsp:param value="view" name="piId"/> 
										<jsp:param value="view" name="action"/> 
										</jsp:include>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<!-- section end -->

 
		<!-- footer start -->
		<!-- ================ -->
		<footer id="footer">
			<!-- .subfooter start -->
			<!-- ================ -->
			<div class="subfooter">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<p class="text-center">Copyright © 2016 AirPull by <a target="_blank" href="http://htmlcoder.me">AirDrop Group</a>.</p>
						</div>
					</div>
				</div>
			</div>
			<!-- .subfooter end -->
		</footer>
		<!-- footer end -->


		<!-- JavaScript files placed at the end of the document so the pages load faster
		================================================== -->
		<!-- Jquery and Bootstap core js files -->
		<script type="text/javascript" src="plugins/jquery.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

		<!-- Modernizr javascript -->
		<script type="text/javascript" src="plugins/modernizr.js"></script>

		<!-- Isotope javascript -->
		<script type="text/javascript" src="plugins/isotope/isotope.pkgd.min.js"></script>
		
		<!-- Backstretch javascript -->
		<script type="text/javascript" src="plugins/jquery.backstretch.min.js"></script>

		<!-- Appear javascript -->
		<script type="text/javascript" src="plugins/jquery.appear.js"></script>

		<!-- Initialization of Plugins -->
		<script type="text/javascript" src="js/template.js"></script>

		<!-- Custom Scripts -->
		<script type="text/javascript" src="js/custom.js"></script>
		
		<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	</body>
</html>
