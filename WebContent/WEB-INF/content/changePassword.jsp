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
								<a href=#services><img id="logo" src="images/adlogo.png" alt="Worthy"></a>
							</div>

							<!-- name-and-slogan -->
							<div class="site-name-and-slogan smooth-scroll">
								<div class="site-name"><a href="goHomeLogged?name=${user.nickname}">AirPull</a></div>
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
												<li><a href="#services"><s:property value="user.nickname"/></a></li>
												<li><a href="backHomeLogged?name=${user.nickname }">Back</a></li>
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

		<form action="changePassword?name=${user.name }" method="post">
		<!-- section start -->
		<!-- ================ -->
		<div class="section translucent-bg bg-image-1 black">
			<div class="container object-non-visible" data-animation-effect="fadeIn">
				<h1 id="services"  class="text-center title">修改密码</h1>
				<div class="space"></div>
				<div class="row">
					<!-- <div class="space visible-xs"></div> -->
						
					<!-- <div class="col-sm-6"> -->
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
							<h4 class="media-heading">旧密码</h4>
							<p><input data-placeholder="旧密码" name="oldpassword" type="password" id="password" placeholder="旧密码" tabindex="1" spellcheck="false" style="color:#000000;"></input></p>
						</div>
						<br/>
						<div class="media-left">
							<i class="fa fa-leaf"></i>
						</div>
						<div class="media-body">	
							<h4 class="media-heading">新密码</h4>
							<p><input data-placeholder="新密码" name="newpassword" type="password" id="password" placeholder="新密码" tabindex="1" spellcheck="false" style="color:#000000;"></input>（密码非纯数字，长度大于等于8位小于等于20位）</p>
						</div>
						<br/>
						<div class="media-left">
							<i class="fa fa-leaf"></i>
						</div>
						<div class="media-body">	
							<h4 class="media-heading">确认密码</h4>
							<p><input data-placeholder="确认密码" name="verifypassword" type="password" id="password" placeholder="确认密码" tabindex="1" spellcheck="false" style="color:#000000;"></input></p>
						</div>
						
					<!-- </div> -->		
					<div class="space visible-xs"></div>
					
				</div>
			</div>
		</div>
		<!-- section end -->
		
		<!-- section start -->
		<!-- ================ -->
		<div class="default-bg space blue">
			<div class="container">
				<div class="text-center">
					<div class="col-md-8 col-md-offset-2">
						<input type="submit" class="btn btn-sm btn-default" value="确认修改">
					</div>
				</div>
			</div>
		</div>
		<!-- section end -->
		</form>	

 
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
