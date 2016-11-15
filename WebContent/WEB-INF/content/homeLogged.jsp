<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="utf-8">
<title>AirPull | Free Extract Tool by AirDrop</title>
<meta name="description"
	content="Worthy a Bootstrap-based, Responsive HTML5 Template">
<meta name="author" content="htmlcoder.me">

<!-- Mobile Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Favicon -->
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="stylesheet" href="css/base/jquery.ui.all.css">
<!-- Web Fonts -->

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
<script>
//下面这三个函数是生成与刷新进度条、进度详细信息的
//初始化进度条
$(function() {
	$("#progressbar").progressbar({
		value : 0
	});
});

//调用查询进度信息接口
function refreshProcessBar() {
	$.get("getState.action?timestamp=" + new Date().getTime(), function(data) {
		refreshProcessBarCallBack(data);
	}, 'xml');
}

//查询进度信息接口回调函数

function refreshProcessBarCallBack(returnXMLParam) {
	var returnXML = returnXMLParam;
	var percent = $(returnXML).find('percent').text()
	var showText = "进度是：" + percent + "%";
	showText = showText + "\n当前上传文件大小为："
			+ $(returnXML).find('uploadByte').text();
	showText = showText + "\n上传文件总大小为："
			+ $(returnXML).find('fileSizeByte').text();
	showText = showText + "\n当前上传文件为第：" + $(returnXML).find('fileIndex').text()
			+ "个";
	showText = showText + "\n开始上传时间：" + $(returnXML).find('startTime').text();

	// 刷新进度详细信息
	$('#progressDetail').empty();
	$('#progressDetail').text(showText);

	// 刷新进度条
	$("#progressbar").progressbar("option", "value", parseInt(percent));

	setTimeout("refreshProcessBar()", 1000);
}

//下面这三个函数是控制添加、删除、修改附件的（允许增加、删除附件，只允许指定后缀的文件被选择等）
var a = 2;
function file_change(input) {
	//当文本域中的值改变时触发此方法
	var postfix = input.value.substring(input.value.lastIndexOf(".") + 1)
			.toUpperCase();
	//判断扩展是否合法
	if (postfix == "HTML" || postfix == "HTM" ) {
	} else {
		//如果不合法就删除相应的File表单及br标签
		alert("您上传的文件类型不被支持，本系统只支持.html, .htm 文件！");
        //清除当前所选文件
        input.outerHTML=input.outerHTML.replace(/(value=\").+\"/i,"$1\"");
		return;
	}
}

function f() {
	//方法名为f的主要作用是不允许在File表单域中手动输入文件名，必须单击“浏览”按钮
	return false;
}

function submitForm() {
	setTimeout("refreshProcessBar()", 1000);

	return true;
}

</script>

<body class="no-trans">

	<!-- scrollToTop -->
	<!-- ================ -->
	<div class="scrollToTop">
		<i class="icon-up-open-big"></i>
	</div>

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
						<a href="#services">
						<img id="logo" src="images/adlogo.png"alt="Worthy"></a>
					</div>

					<!-- name-and-slogan -->
					<div class="site-name-and-slogan smooth-scroll">
						<div class="site-name">
							<a href="#services">AirPull</a>
						</div>
						<div class="site-slogan">
							Free Web Extract Tool by <a target="_blank"
								href="http://www.baidu.com">AirDrop</a>
						</div>
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
								<button type="button" class="navbar-toggle"
									data-toggle="collapse" data-target="#navbar-collapse-1">
									<span class="sr-only">Toggle navigation</span> <span
										class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
							</div>

							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse scrollspy smooth-scroll"
								id="navbar-collapse-1">
								<ul class="nav navbar-nav navbar-right">
									<li class="active"><a href="#services">How to use</a></li>
									<li><a href="#portfolio">AirPull</a></li>
									<li><a href="#clients">Clients</a></li>
									<li><a href="goProfile?name=${user.nickname}" id="profileqwq">Profile</a></li>
									<li><a href="javascript:void(0);" data-toggle="modal"
										data-target="#project-5">Logout</a></li>
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

	<!-- Modal start-->
	<!-- ================ -->
	<div class="modal fade" id="project-5" tabindex="-1" role="dialog"
		aria-labelledby="project-5-label" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="project-5-label">Logout</h4>
				</div>
				<div class="modal-body">
					<!-- <h1 class="text-center title">Are you sure to quit the AirPull?</h1> -->
					<div class="row">
						<div class="text-center title">
							<img src="images/logout.png" alt="">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<a href="home"><button type="button"
							class="btn btn-sm btn-default">Good Bye</button></a>
				</div>

			</div>
		</div>
	</div>
	<!-- Modal end -->

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
	<div class="default-bg space blue">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h1 class="text-center">Hello, <a href="goProfile?name=${user.nickname}"><s:property value="user.nickname"/></a></h1>
				</div>
			</div>
		</div>
	</div>
	<!-- section end -->

	<!-- section start -->
	<!-- ================ -->
	<div class="section translucent-bg bg-image-1 black">
		<div class="container object-non-visible"
			data-animation-effect="fadeIn">
			<h1 id="services" class="text-center title">How to use AirPull</h1>
			<div class="space"></div>
			<div class="row">
				<div class="space visible-xs"></div>
				<div class="col-sm-6">
					<div class="media">
						<div class="media-left">
							<i class="fa fa-leaf"></i>
						</div>
						<div class="media-body">
							<h4 class="media-heading">Step 1</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Iure aperiam consequatur quo quis exercitationem reprehenderit
								dolor vel ducimus, voluptate eaque suscipit iste placeat.</p>
						</div>
					</div>
					<div class="media">
						<div class="media-left">
							<i class="fa fa-area-chart"></i>
						</div>
						<div class="media-body">
							<h4 class="media-heading">Step2</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Iure aperiam consequatur quo quis exercitationem reprehenderit
								dolor vel ducimus, voluptate eaque suscipit iste placeat.</p>
						</div>
					</div>
					<div class="media">
						<div class="media-left">
							<i class="fa fa-child"></i>
						</div>
						<div class="media-body">
							<h4 class="media-heading">Step 3</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Iure aperiam consequatur quo quis exercitationem reprehenderit
								dolor vel ducimus, voluptate eaque suscipit iste placeat.</p>
						</div>
					</div>
					<div class="media">
						<div class="media-left">
							<i class="fa fa-codepen"></i>
						</div>
						<div class="media-body">
							<h4 class="media-heading">Step 4</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Iure aperiam consequatur quo quis exercitationem reprehenderit
								dolor vel ducimus, voluptate eaque suscipit iste placeat.</p>
						</div>
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
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Iure aperiam consequatur quo quis exercitationem reprehenderit
								dolor vel ducimus, voluptate eaque suscipit iste placeat.</p>
						</div>
					</div>
					<div class="media">
						<div class="media-left">
							<i class="fa fa-area-chart"></i>
						</div>
						<div class="media-body">
							<h4 class="media-heading">Service 6</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Iure aperiam consequatur quo quis exercitationem reprehenderit
								dolor vel ducimus, voluptate eaque suscipit iste placeat.</p>
						</div>
					</div>
					<div class="media">
						<div class="media-left">
							<i class="fa fa-child"></i>
						</div>
						<div class="media-body">
							<h4 class="media-heading">Service 7</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Iure aperiam consequatur quo quis exercitationem reprehenderit
								dolor vel ducimus, voluptate eaque suscipit iste placeat.</p>
						</div>
					</div>
					<div class="media">
						<div class="media-left">
							<i class="fa fa-codepen"></i>
						</div>
						<div class="media-body">
							<h4 class="media-heading">Service 8</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Iure aperiam consequatur quo quis exercitationem reprehenderit
								dolor vel ducimus, voluptate eaque suscipit iste placeat.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- section end -->


	

	<!-- section start -->
	<!-- ================ -->
	<div class="section">
		<div class="container">
			<h1 class="text-center title" id="portfolio">操作列表</h1>
			<div class="separator"></div>
			<p class="lead text-center">
				Lorem ipsum dolor sit amet laudantium molestias similique.<br>
				Quisquam incidunt ut laboriosam.
			</p>
			<br>
			<div class="row object-non-visible" data-animation-effect="fadeIn">
				<div class="col-md-12">

					<!-- isotope filters start -->
					<div class="filters text-center">
						<ul class="nav nav-pills">
							<li class="active"><a href="#" data-filter="*">All</a></li>
							<li><a href="#" data-filter=".web-design">Web design</a></li>
							<li><a href="#" data-filter=".app-development">App
									development</a></li>
							<li><a href="#" data-filter=".site-building">Site
									building</a></li>
						</ul>
					</div>
					<!-- isotope filters end -->

					<!-- portfolio items start -->

					<div class="isotope-container row grid-space-20">
 						<div class="col-sm-6 col-md-3 isotope-item web-design">
							<div class="image-box">
								<div class="overlay-container">
									<img src="images/taobao1.jpg" alt=""> <a class="overlay"
										data-toggle="modal" data-target="#project-1"> <i
										class="fa fa-search-plus"></i> <span>Web Design</span>
									</a>
								</div>
								<a class="btn btn-default btn-block" data-toggle="modal"
									data-target="#project-1">查看淘宝订单[未完成]</a>
							</div>
							<!-- Modal -->
							<div class="modal fade" id="project-1" tabindex="-1"
								role="dialog" aria-labelledby="project-1-label"
								aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">
												<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
											</button>
											<h4 class="modal-title" id="project-1-label">Project
												Title</h4>
										</div>
										
										<div class="modal-body">
											<h3>Project Description</h3>
											<div class="row">
												<div class="col-md-6">
													<!-- 上传文件，最近添加的 qqqqqqqqqqqqqqqqqqqqqqqqqqqqwqqqqqqqqqqqqqqqqqqqqqqqqqqqqq -->
													<s:form action="uploadT2" method="post" enctype="multipart/form-data" onsubmit="return submitForm()">
														<br />
														<table width="450" border="1">
															<tr>
																<td width="150">
																	<div align="center">
																		用户附件
																	</div>
																</td>
																<td width="300" id="fileForm"><br>
																	<input type="file" id="uploadFile2" name="fileUploadTools.uploadFile" onchange="file_change(this)"  size="55">
																</td>
															</tr>
														</table>

														<br />
														<!-- <div id="progressbar">qw</div> -->
														<br />
														<div id="progressDetail" class="demo-description">
															<!-- <p>进度详细信息显示于此......</p> -->
														</div>
													<!-- 上传文件，最近一次加的 qqqqqqqqqqqqqqqqqqqqqqqqqqqqwqqqqqqqqqqqqqqqqqqqqqqqqqqqqq -->
												</div>

												<div class="col-md-6">
													<img src="images/taobao1.jpg" alt="">
												</div>
											</div>											
										</div>

										<div class="modal-footer">
											<button type="submit" class="btn btn-sm btn-default">AirPull it</button>
										</div>
										</s:form>
									</div>
								</div>
							</div>
							
							<!-- Modal end -->
						</div>
					
						<div class="col-sm-6 col-md-3 isotope-item app-development">
							<div class="image-box">
								<div class="overlay-container">
									<img src="images/jiaowuchu.jpeg" alt=""> <a
										class="overlay" data-toggle="modal" data-target="#project-2">
										<i class="fa fa-search-plus"></i> <span>App Development</span>
									</a>
								</div>
								<a class="btn btn-default btn-block" data-toggle="modal"
									data-target="#project-2">查看哈尔滨工业大学成绩单～</a>
							</div>
							<!-- Modal -->
							<div class="modal fade" id="project-2" tabindex="-1"
								role="dialog" aria-labelledby="project-2-label"
								aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">
												<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
											</button>
											<h4 class="modal-title" id="project-2-label">Project
												Title</h4>
										</div>
										
										<div class="modal-body">
											<h3>Project Description</h3>
											<div class="row">
												<div class="col-md-6">
													<!-- 上传文件，最近添加的 qqqqqqqqqqqqqqqqqqqqqqqqqqqqwqqqqqqqqqqqqqqqqqqqqqqqqqqqqq -->
													<s:form action="uploadT2" method="post" enctype="multipart/form-data" onsubmit="return submitForm()">
														<br />
														<table width="818" border="1">
															<tr>
																<td width="176">
																	<div align="center">
																		用户附件
																	</div>
																</td>
																<td width="626" id="fileForm"><br>
																	<input type="file" id="uploadFile2" name="fileUploadTools.uploadFile" onchange="file_change(this)"  size="55">
																</td>
															</tr>
														</table>
		
													<!-- 上传文件，最近一次加的 qqqqqqqqqqqqqqqqqqqqqqqqqqqqwqqqqqqqqqqqqqqqqqqqqqqqqqqqqq -->
												</div>

												<div class="col-md-6">
													<img src="images/jiaowuchu.jpeg" alt="">
												</div>
											</div>											
										</div>

										<div class="modal-footer">
											<button type="submit" class="btn btn-sm btn-default">AirPull it</button>
										</div>
										</s:form>
									</div>
								</div>
							</div>
							
							<!-- Modal end -->
						</div>

						<div class="col-sm-6 col-md-3 isotope-item web-design">
							<div class="image-box">
								<div class="overlay-container">
									<img src="images/portfolio-3.jpg" alt=""> <a
										class="overlay" data-toggle="modal" data-target="#project-3">
										<i class="fa fa-search-plus"></i> <span>Web Design</span>
									</a>
								</div>
								<a class="btn btn-default btn-block" data-toggle="modal"
									data-target="#project-3">功能紧急开发中～～～</a>
							</div>
							<!-- Modal -->
							<div class="modal fade" id="project-3" tabindex="-1"
								role="dialog" aria-labelledby="project-3-label"
								aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">
												<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
											</button>
											<h4 class="modal-title" id="project-3-label">Project
												Title</h4>
										</div>
										<div class="modal-body">
											<h3>Project Description</h3>
											<div class="row">
												<div class="col-md-6">
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing
														elit. Atque sed, quidem quis praesentium, ut unde. Quae
														sed, incidunt laudantium nesciunt, optio corporis quod
														earum pariatur omnis illo saepe numquam suscipit, nemo
														placeat dignissimos eius mollitia et quas officia
														doloremque ipsum labore rem deserunt vero! Magnam totam
														delectus accusantium voluptas et, tempora quos atque,
														fugiat, obcaecati voluptatibus commodi illo voluptates
														dolore nemo quo soluta quis.</p>
													<p>Molestiae sed enim laboriosam atque delectus
														voluptates rerum nostrum sapiente obcaecati molestias
														quasi optio exercitationem, voluptate quis consequatur
														libero incidunt, in, quod. Lorem ipsum dolor sit amet,
														consectetur adipisicing elit. Eos nobis officiis, autem
														earum tenetur quidem. Quae non dicta earum. Ipsum autem
														eaque cum dolor placeat corporis quisquam dolorum at
														nesciunt.</p>
												</div>
												<div class="col-md-6">
													<img src="images/portfolio-3.jpg" alt="">
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-sm btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>
							<!-- Modal end -->
						</div>

						<div class="col-sm-6 col-md-3 isotope-item site-building">
							<div class="image-box">
								<div class="overlay-container">
									<img src="images/portfolio-4.jpg" alt=""> <a
										class="overlay" data-toggle="modal" data-target="#project-4">
										<i class="fa fa-search-plus"></i> <span>Site Building</span>
									</a>
								</div>
								<a class="btn btn-default btn-block" data-toggle="modal"
									data-target="#project-4">功能紧急开发中～～～</a>
							</div>
							<!-- Modal -->
							<div class="modal fade" id="project-4" tabindex="-1"
								role="dialog" aria-labelledby="project-4-label"
								aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">
												<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
											</button>
											<h4 class="modal-title" id="project-4-label">Project
												Title</h4>
										</div>
										<div class="modal-body">
											<h3>Project Description</h3>
											<div class="row">
												<div class="col-md-6">
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing
														elit. Atque sed, quidem quis praesentium, ut unde. Quae
														sed, incidunt laudantium nesciunt, optio corporis quod
														earum pariatur omnis illo saepe numquam suscipit, nemo
														placeat dignissimos eius mollitia et quas officia
														doloremque ipsum labore rem deserunt vero! Magnam totam
														delectus accusantium voluptas et, tempora quos atque,
														fugiat, obcaecati voluptatibus commodi illo voluptates
														dolore nemo quo soluta quis.</p>
													<p>Molestiae sed enim laboriosam atque delectus
														voluptates rerum nostrum sapiente obcaecati molestias
														quasi optio exercitationem, voluptate quis consequatur
														libero incidunt, in, quod. Lorem ipsum dolor sit amet,
														consectetur adipisicing elit. Eos nobis officiis, autem
														earum tenetur quidem. Quae non dicta earum. Ipsum autem
														eaque cum dolor placeat corporis quisquam dolorum at
														nesciunt.</p>
												</div>
												<div class="col-md-6">
													<img src="images/portfolio-4.jpg" alt="">
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-sm btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>
							<!-- Modal end -->
						</div>

						<div class="col-sm-6 col-md-3 isotope-item app-development">
							<div class="image-box">
								<div class="overlay-container">
									<img src="images/portfolio-5.jpg" alt=""> <a
										class="overlay" data-toggle="modal" data-target="#project-5">
										<i class="fa fa-search-plus"></i> <span>App Development</span>
									</a>
								</div>
								<a class="btn btn-default btn-block" data-toggle="modal"
									data-target="#project-5">功能紧急开发中～～～</a>
							</div>
							<!-- Modal -->
							<div class="modal fade" id="project-5" tabindex="-1"
								role="dialog" aria-labelledby="project-5-label"
								aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">
												<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
											</button>
											<h4 class="modal-title" id="project-5-label">Project
												Title</h4>
										</div>
										<div class="modal-body">
											<h3>Project Description</h3>
											<div class="row">
												<div class="col-md-6">
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing
														elit. Atque sed, quidem quis praesentium, ut unde. Quae
														sed, incidunt laudantium nesciunt, optio corporis quod
														earum pariatur omnis illo saepe numquam suscipit, nemo
														placeat dignissimos eius mollitia et quas officia
														doloremque ipsum labore rem deserunt vero! Magnam totam
														delectus accusantium voluptas et, tempora quos atque,
														fugiat, obcaecati voluptatibus commodi illo voluptates
														dolore nemo quo soluta quis.</p>
													<p>Molestiae sed enim laboriosam atque delectus
														voluptates rerum nostrum sapiente obcaecati molestias
														quasi optio exercitationem, voluptate quis consequatur
														libero incidunt, in, quod. Lorem ipsum dolor sit amet,
														consectetur adipisicing elit. Eos nobis officiis, autem
														earum tenetur quidem. Quae non dicta earum. Ipsum autem
														eaque cum dolor placeat corporis quisquam dolorum at
														nesciunt.</p>
												</div>
												<div class="col-md-6">
													<img src="images/portfolio-5.jpg" alt="">
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-sm btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>
							<!-- Modal end -->
						</div>

						<div class="col-sm-6 col-md-3 isotope-item web-design">
							<div class="image-box">
								<div class="overlay-container">
									<img src="images/portfolio-6.jpg" alt=""> <a
										class="overlay" data-toggle="modal" data-target="#project-6">
										<i class="fa fa-search-plus"></i> <span>Web Design</span>
									</a>
								</div>
								<a class="btn btn-default btn-block" data-toggle="modal"
									data-target="#project-6">功能紧急开发中～～～</a>
							</div>
							<!-- Modal -->
							<div class="modal fade" id="project-6" tabindex="-1"
								role="dialog" aria-labelledby="project-6-label"
								aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">
												<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
											</button>
											<h4 class="modal-title" id="project-6-label">Project
												Title</h4>
										</div>
										<div class="modal-body">
											<h3>Project Description</h3>
											<div class="row">
												<div class="col-md-6">
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing
														elit. Atque sed, quidem quis praesentium, ut unde. Quae
														sed, incidunt laudantium nesciunt, optio corporis quod
														earum pariatur omnis illo saepe numquam suscipit, nemo
														placeat dignissimos eius mollitia et quas officia
														doloremque ipsum labore rem deserunt vero! Magnam totam
														delectus accusantium voluptas et, tempora quos atque,
														fugiat, obcaecati voluptatibus commodi illo voluptates
														dolore nemo quo soluta quis.</p>
													<p>Molestiae sed enim laboriosam atque delectus
														voluptates rerum nostrum sapiente obcaecati molestias
														quasi optio exercitationem, voluptate quis consequatur
														libero incidunt, in, quod. Lorem ipsum dolor sit amet,
														consectetur adipisicing elit. Eos nobis officiis, autem
														earum tenetur quidem. Quae non dicta earum. Ipsum autem
														eaque cum dolor placeat corporis quisquam dolorum at
														nesciunt.</p>
												</div>
												<div class="col-md-6">
													<img src="images/portfolio-6.jpg" alt="">
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-sm btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>
							<!-- Modal end -->
						</div>

						<div class="col-sm-6 col-md-3 isotope-item site-building">
							<div class="image-box">
								<div class="overlay-container">
									<img src="images/portfolio-7.jpg" alt=""> <a
										class="overlay" data-toggle="modal" data-target="#project-7">
										<i class="fa fa-search-plus"></i> <span>Site Building</span>
									</a>
								</div>
								<a class="btn btn-default btn-block" data-toggle="modal"
									data-target="#project-7">功能紧急开发中～～～</a>
							</div>
							<!-- Modal -->
							<div class="modal fade" id="project-7" tabindex="-1"
								role="dialog" aria-labelledby="project-7-label"
								aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">
												<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
											</button>
											<h4 class="modal-title" id="project-7-label">Project
												Title</h4>
										</div>
										<div class="modal-body">
											<h3>Project Description</h3>
											<div class="row">
												<div class="col-md-6">
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing
														elit. Atque sed, quidem quis praesentium, ut unde. Quae
														sed, incidunt laudantium nesciunt, optio corporis quod
														earum pariatur omnis illo saepe numquam suscipit, nemo
														placeat dignissimos eius mollitia et quas officia
														doloremque ipsum labore rem deserunt vero! Magnam totam
														delectus accusantium voluptas et, tempora quos atque,
														fugiat, obcaecati voluptatibus commodi illo voluptates
														dolore nemo quo soluta quis.</p>
													<p>Molestiae sed enim laboriosam atque delectus
														voluptates rerum nostrum sapiente obcaecati molestias
														quasi optio exercitationem, voluptate quis consequatur
														libero incidunt, in, quod. Lorem ipsum dolor sit amet,
														consectetur adipisicing elit. Eos nobis officiis, autem
														earum tenetur quidem. Quae non dicta earum. Ipsum autem
														eaque cum dolor placeat corporis quisquam dolorum at
														nesciunt.</p>
												</div>
												<div class="col-md-6">
													<img src="images/portfolio-7.jpg" alt="">
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-sm btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>
							<!-- Modal end -->
						</div>


						<div class="col-sm-6 col-md-3 isotope-item app-development">
							<div class="image-box">
								<div class="overlay-container">
									<img src="images/portfolio-12.jpg" alt=""> <a
										class="overlay" data-toggle="modal" data-target="#project-12">
										<i class="fa fa-search-plus"></i> <span>App Development</span>
									</a>
								</div>
								<a class="btn btn-default btn-block" data-toggle="modal"
									data-target="#project-12">功能紧急开发中～～～</a>
							</div>
							<!-- Modal -->
							<div class="modal fade" id="project-12" tabindex="-1"
								role="dialog" aria-labelledby="project-12-label"
								aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">
												<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
											</button>
											<h4 class="modal-title" id="project-12-label">Project
												Title</h4>
										</div>
										<div class="modal-body">
											<h3>Project Description</h3>
											<div class="row">
												<div class="col-md-6">
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing
														elit. Atque sed, quidem quis praesentium, ut unde. Quae
														sed, incidunt laudantium nesciunt, optio corporis quod
														earum pariatur omnis illo saepe numquam suscipit, nemo
														placeat dignissimos eius mollitia et quas officia
														doloremque ipsum labore rem deserunt vero! Magnam totam
														delectus accusantium voluptas et, tempora quos atque,
														fugiat, obcaecati voluptatibus commodi illo voluptates
														dolore nemo quo soluta quis.</p>
													<p>Molestiae sed enim laboriosam atque delectus
														voluptates rerum nostrum sapiente obcaecati molestias
														quasi optio exercitationem, voluptate quis consequatur
														libero incidunt, in, quod. Lorem ipsum dolor sit amet,
														consectetur adipisicing elit. Eos nobis officiis, autem
														earum tenetur quidem. Quae non dicta earum. Ipsum autem
														eaque cum dolor placeat corporis quisquam dolorum at
														nesciunt.</p>
												</div>
												<div class="col-md-6">
													<img src="images/portfolio-12.jpg" alt="">
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-sm btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>
							<!-- Modal end -->
						</div>

					</div>
					<!-- portfolio items end -->

				</div>
			</div>
		</div>
	</div>
	<!-- section end -->

	<!-- section start -->
	<!-- ================ -->
	<div class="section translucent-bg bg-image-2 pb-clear">
		<div class="container object-non-visible"
			data-animation-effect="fadeIn">
			<h1 id="clients" class="title text-center">Clients</h1>
			<div class="space"></div>
			<div class="row">
				<div class="col-md-4">
					<div class="media testimonial">
						<div class="media-left">
							<img src="images/owlogo1.png" alt="">
						</div>
						<div class="media-body">
							<h3 class="media-heading">You are Amazing!</h3>
							<blockquote>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Iure aperiam consequatur quo.</p>
								<footer>Someone famous in <cite title="Source Title">Source
									Title</cite></footer>
							</blockquote>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="media testimonial">
						<div class="media-left">
							<img src="images/owlogo2.png" alt="">
						</div>
						<div class="media-body">
							<h3 class="media-heading">Yeah!</h3>
							<blockquote>
								<p>Iure aperiam consequatur quo quis exercitationem
									reprehenderit dolor vel ducimus.</p>
								<footer>Someone famous in <cite title="Source Title">Source
									Title</cite></footer>
							</blockquote>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="media testimonial">
						<div class="media-left">
							<img src="images/owlogo4.png" alt="">
						</div>
						<div class="media-body">
							<h3 class="media-heading">Thank You!</h3>
							<blockquote>
								<p>Aperiam consequatur quo quis exercitationem reprehenderit
									suscipit iste placeat.</p>
								<footer>Someone famous in <cite title="Source Title">Source
									Title</cite></footer>
							</blockquote>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="media testimonial">
						<div class="media-left">
							<img src="images/owlogo6.png" alt="">
						</div>
						<div class="media-body">
							<h3 class="media-heading">Thank You!</h3>
							<blockquote>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Iure aperiam consequatur quo.</p>
								<footer>Someone famous in <cite title="Source Title">Source
									Title</cite></footer>
							</blockquote>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="media testimonial">
						<div class="media-left">
							<img src="images/owlogo7.png" alt="">
						</div>
						<div class="media-body">
							<h3 class="media-heading">Amazing!</h3>
							<blockquote>
								<p>Iure aperiam consequatur quo quis exercitationem
									reprehenderit dolor vel ducimus.</p>
								<footer>Someone famous in <cite title="Source Title">Source
									Title</cite></footer>
							</blockquote>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="media testimonial">
						<div class="media-left">
							<img src="images/owlogo8.png" alt="">
						</div>
						<div class="media-body">
							<h3 class="media-heading">Best!</h3>
							<blockquote>
								<p>Aperiam consequatur quo quis exercitationem reprehenderit
									suscipit iste placeat.</p>
								<footer>Someone famous in <cite title="Source Title">Source
									Title</cite></footer>
							</blockquote>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- section start -->
	<!-- ================ -->
	<div class="default-bg space blue">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h1 class="text-center">Let's Begin!</h1>
				</div>
			</div>
		</div>
	</div>
	<!-- section end -->

	<!-- footer start -->
	<footer id="footer"> <!-- .subfooter start --> <!-- ================ -->
	<div class="subfooter">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<p class="text-center">
						Copyright © 2016 AirPull by <a target="_blank"
							href="http://htmlcoder.me">AirDrop Group</a>.
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- .subfooter end --> </footer>
	<!-- footer end -->

	<!-- JavaScript files placed at the end of the document so the pages load faster
		================================================== -->
	<!-- Jquery and Bootstap core js files -->
	<script type="text/javascript" src="plugins/jquery.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

	<!-- Modernizr javascript -->
	<script type="text/javascript" src="plugins/modernizr.js"></script>

	<!-- Isotope javascript -->
	<script type="text/javascript"
		src="plugins/isotope/isotope.pkgd.min.js"></script>

	<!-- Backstretch javascript -->
	<script type="text/javascript" src="plugins/jquery.backstretch.min.js"></script>

	<!-- Appear javascript -->
	<script type="text/javascript" src="plugins/jquery.appear.js"></script>

	<!-- Initialization of Plugins -->
	<script type="text/javascript" src="js/template.js"></script>

<%-- 	<!-- Custom Scripts -->
	<script type="text/javascript" src="js/custom.js"></script> --%>

	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>

	<script src="js/jquery.ui.core.js"></script>
	<script src="js/jquery.ui.widget.js"></script>
	<script src="js/jquery.ui.progressbar.js"></script>
</body>
</html>
