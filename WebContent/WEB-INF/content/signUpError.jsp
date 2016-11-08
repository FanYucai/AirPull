<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<!--<![endif]-->
	<head>
		<meta charset="utf-8">
		<title>AirPull | Error</title>
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
	
		<%
			//request.setCharacterEncoding("UTF-8");
			String type = request.getParameter("type");
			//String book=request.getParameter("Title");
			//System.out.print(type);
		%>
	
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
								<a href="#banner"><img id="logo" src="images/adlogo.png" alt="Worthy"></a>
							</div>

							<!-- name-and-slogan -->
							<div class="site-name-and-slogan smooth-scroll">
								<div class="site-name"><a href="#banner">AirPull</a></div>
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
												<li><a href=home>Home</a></li>
												<li><a href="javascript:void(0);" data-toggle="modal" data-target="#project-5">Login</a></li>
												<li><a href="javascript:void(0);" data-toggle="modal" data-target="#project-7">Sign Up</a></li>
												<!-- <li><a href="#contact">Contact</a></li> -->
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

		<!-- banner start -->
		<!-- ================ -->
		<div id="banner" class="banner">
			<div class="banner-image"></div>
			<div class="banner-caption">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 object-non-visible" data-animation-effect="fadeIn">
							<h1 class="text-center"><span><%=type%></span></h1>
								
								<div class="overlay-container">
									<a class="overlay" data-toggle="modal" data-target="#project-1">
										<i class="fa fa-search-plus"></i>
									</a>
								</div>
								<!--
								<a class="btn btn-default btn-block" data-toggle="modal" data-target="#project-1">ç»å½</a>
						
								<div class="overlay-container">
									<a class="overlay" data-toggle="modal" data-target="#project-1">
										<i class="fa fa-search-plus"></i>
									</a>
								</div>
								<a class="btn btn-default btn-block" data-toggle="modal" data-target="#project-1">æ³¨å</a>
								-->
							
							<p class="lead text-center">
								Simple & Concise & Convenient
							</p>

						</div>
					</div>
				</div>
				
				<!-- login -->
				<div class="col-sm-6 col-md-1 col-md-offset-4 isotope-item app-development">
					
					<!-- Modal -->
					<div class="modal fade" id="project-5" tabindex="-1" role="dialog" aria-labelledby="project-5-label" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
									<h4 class="modal-title" id="project-5-label">Project Title</h4>
								</div>
								<div class="modal-body">
									<h3>用户登录</h3>
									<div class="row">
										<div class="col-md-6">
											<p><input data-placeholder="用户名" name="userName" type="text" placeholder="用户名" tabindex="1" spellcheck="false"></input></p>
											<p><input data-placeholder="密码" name=""type="text" placeholder="密码" tabindex="1" spellcheck="false"></input></p>
										</div>
										<div class="col-md-6">
											<img src="images/portfolio-5.jpg" alt="">
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<a href="login"><button type="button" class="btn btn-sm btn-default">Login</button></a>
								</div>
							</div>
						</div>
					</div>
					<!-- Modal end -->
				</div>
				<!-- login end --> 
				
				<!-- sign up -->
				<div class="col-sm-6 col-md-1 col-md-offset-1 isotope-item app-development">
					
					<!-- Modal -->
					<div class="modal fade" id="project-7" tabindex="-1" role="dialog" aria-labelledby="project-7-label" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
									<h4 class="modal-title" id="project-5-label">Sign up</h4>
								</div>
								<form action="signUp" method="post">
								<div class="modal-body">
									<h3 class="text-center">欢迎加入 <span>AirPull</span></h3>
									<div class="row">
										<div class="col-md-6">
											<p><input data-placeholder="用户名" name="user.name" type="text" placeholder="用户名" tabindex="1" spellcheck="false"></input>（用户名由英文字母和数字构成长度不超过20）</p>
											<p><input data-placeholder="密码" name="user.password" type="password" id="password" placeholder="密码" tabindex="1" spellcheck="false"></input>（密码非纯数字，长度大于等于8位小于等于20位）</p>
										</div>
										
										<div class="col-md-6">
											<img src="images/portfolio-7.jpg" alt="">
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<input type="submit" class="btn btn-sm btn-default" value="Submit">
								</div>
								</form>
								
								
							</div>
						</div>
					</div>
					<!-- Modal end -->
				</div>
				<!-- sign up end -->
	
			</div>
		</div>

 
 
		<!-- footer start -->
		<!-- ================ -->
		
		<footer id="footer">

			<!-- .footer start -->
			<!-- ================ -->
			<!-- <div class="footer section">
				<div class="container">
					<h1 class="title text-center" id="contact">Contact Us</h1>
					<div class="space"></div>
					<div class="row">
						<div class="col-sm-6">
							<div class="footer-content">
								<p class="large">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vel nam magnam natus tempora cumque, aliquam deleniti voluptatibus voluptas. Repellat vel, et itaque commodi iste ab, laudantium voluptas deserunt nobis.</p>
								<ul class="list-icons">
									<li><i class="fa fa-map-marker pr-10"></i> One infinity loop, 54100</li>
									<li><i class="fa fa-phone pr-10"></i> +00 1234567890</li>
									<li><i class="fa fa-fax pr-10"></i> +00 1234567891 </li>
									<li><i class="fa fa-envelope-o pr-10"></i> your@email.com</li>
								</ul>
								<ul class="social-links">
									<li class="facebook"><a target="_blank" href="https://www.facebook.com/pages/HtmlCoder/714570988650168"><i class="fa fa-facebook"></i></a></li>
									<li class="twitter"><a target="_blank" href="https://twitter.com/HtmlcoderMe"><i class="fa fa-twitter"></i></a></li>
									<li class="googleplus"><a target="_blank" href="http://plus.google.com"><i class="fa fa-google-plus"></i></a></li>
									<li class="skype"><a target="_blank" href="http://www.skype.com"><i class="fa fa-skype"></i></a></li>
									<li class="linkedin"><a target="_blank" href="http://www.linkedin.com"><i class="fa fa-linkedin"></i></a></li>
									<li class="youtube"><a target="_blank" href="http://www.youtube.com"><i class="fa fa-youtube"></i></a></li>
									<li class="flickr"><a target="_blank" href="http://www.flickr.com"><i class="fa fa-flickr"></i></a></li>
									<li class="pinterest"><a target="_blank" href="http://www.pinterest.com"><i class="fa fa-pinterest"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="footer-content">
								<form role="form" id="footer-form">
									<div class="form-group has-feedback">
										<label class="sr-only" for="name2">Name</label>
										<input type="text" class="form-control" id="name2" placeholder="Name" name="name2" required>
										<i class="fa fa-user form-control-feedback"></i>
									</div>
									<div class="form-group has-feedback">
										<label class="sr-only" for="email2">Email address</label>
										<input type="email" class="form-control" id="email2" placeholder="Enter email" name="email2" required>
										<i class="fa fa-envelope form-control-feedback"></i>
									</div>
									<div class="form-group has-feedback">
										<label class="sr-only" for="message2">Message</label>
										<textarea class="form-control" rows="8" id="message2" placeholder="Message" name="message2" required></textarea>
										<i class="fa fa-pencil form-control-feedback"></i>
									</div>
									<input type="submit" value="Send" class="btn btn-default">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			.footer end --> 

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
