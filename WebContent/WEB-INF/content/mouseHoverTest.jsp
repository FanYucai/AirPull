<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<!--<![endif]-->
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
												<li class="active"><a href=login>Log In</a></li>
												<li><a href=signup>Sign Up</a></li>
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
							<h1 class="text-center">Log In, <span>SB!</span></h1>
										
								<div class="col-md-8 col-md-offset-5">
									<ul class="nav nav-pills">
										<li class="active"><a href=homeLogged>Submit</a></li>
									</ul>
								</div>
														
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
	
			</div>
		</div>

 
 
<script type="text/javascript">
$(document).ready(function()
		{
		    var isShow=false;
		    $("#hidden_menu").hide();
		    $("#categort").mouseover(function(){
		        $("#hidden_menu").show();
		    });
		    $("#hidden_menu").mouseover(function(){
		        isShow=true;   
		        $(this).show(); 
		    });
		    $("#hidden_menu").mouseout(function(){
		        if(isShow)
		        {
		            $(this).hide(); 
		            isShow=false;
		        }   
		    });
		})
</script>


<div id="category"><a href="#">category</a></div>
<div id="hidden_menu">
	<div class="round_corner_left"></div>
	<div class="round_corner_reeat"><a>这里历遍数据库得到的各种分类名称</a></div>
	<div class="round_corner_right"></div>
</div>


			<!-- .subfooter start -->
			<!-- ================ -->
			<div class="subfooter">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<p class="text-center">Copyright® 2016 AirPull by <a target="_blank" href="http://htmlcoder.me">AirDrop Group</a>.</p>
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
