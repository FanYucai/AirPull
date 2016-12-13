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
										data-target="#project-logout">Logout</a></li>
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
	<div class="modal fade" id="project-logout" tabindex="-1" role="dialog"
		aria-labelledby="project-logout-label" aria-hidden="true">
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
							<p>欢迎来到AirPull！在这里您可以选择操作上传相应的文件，并且提取出您需要的表格。您还可以对您提取出的表格进行修改，增添、删除等操作，并可以将您的修改导出或者保存，以便之后再次查看。</p>
						</div>
					</div>
					<div class="media">
						<div class="media-left">
							<i class="fa fa-area-chart"></i>
						</div>
						<div class="media-body">
							<h4 class="media-heading">Step2</h4>
							<p>在下方的操作列表，我们为您提供了共8个操作选项，分为购物、娱乐、以及教务管理等三个类别以及一个自定义操作。您可以自由点击并查看每种操作的相应描，述以及上传文件的操作步骤。</p>
						</div>
					</div>
					<div class="media">
						<div class="media-left">
							<i class="fa fa-child"></i>
						</div>
						<div class="media-body">
							<h4 class="media-heading">Step 3</h4>
							<p>当您获得了您需要的.html或者.htm文件并成功上传文件时，点击AirPull It按钮，您将会跳转到表格展示的页面，在这个页面我们会为您展示出我们的抽取结果。</p><br />
						</div>
					</div>
					<div class="media">
						<div class="media-left">
							<i class="fa fa-codepen"></i>
						</div>
						<div class="media-body">
							<h4 class="media-heading">Step 4</h4>
							<p>如果您需要对提取出的表格进行修改，您可以根据表格上方的操作按钮进行增添删除以及修改操作。您所做的修改都将被保存在您的个人记录中，您可以随时查看您的抽取历史。</p>
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
							<h4 class="media-heading">Step 5</h4>
							<p>当您完成对表格的修改之后，您可以点击表格上方的导出按钮，将您看到的表格保存在excel能够打开的.xls文件中，并下载到本地。</p><br />
						</div>
					</div>
					<div class="media">
						<div class="media-left">
							<i class="fa fa-area-chart"></i>
						</div>
						<div class="media-body">
							<h4 class="media-heading">Step 6</h4>
							<p>我们还提供自定义表格抽取功能，如果您对html文件的格式比较了解，您可以指定您需要抽取的表格的信息，包括表格的标签属性、属性值等，从而精确定位您需要导出的表格。</p><br />
						</div>
					</div>
					<div class="media">
						<div class="media-left">
							<i class="fa fa-child"></i>
						</div>
						<div class="media-body">
							<h4 class="media-heading">Step 7</h4>
							<p>我们目前只提供这八种操作模式，请确保您按照每一项操作的步骤执行，否则很有可能无法得到您想要的表格。如果您上传了错误格式的表格，您将会看到错误提示信息。</p><br />
						</div>
					</div>
					<div class="media">
						<div class="media-left">
							<i class="fa fa-codepen"></i>
						</div>
						<div class="media-body">
							<h4 class="media-heading">Step 8</h4>
							<p>如果您发现了该系统存在的错误，或者您需要我们增添您常用的操作模式，请根据下方的邮件地址联系我们，我们会第一时间尝试修改错误并给您反馈。</p><br />
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
<!-- 			<p class="lead text-center">
				Lorem ipsum dolor sit amet laudantium molestias similique.<br>
				Quisquam incidunt ut laboriosam.
			</p> -->
			<br>
			<div class="row object-non-visible" data-animation-effect="fadeIn">
				<div class="col-md-12">

					<!-- isotope filters start -->
					<div class="filters text-center">
						<ul class="nav nav-pills">

							<li class="active"><a href="#" data-filter="*">所有</a></li>
							<li><a href="#" data-filter=".games">娱乐&社交</a></li>
							<li><a href="#" data-filter=".shop">账单</a></li>
							<li><a href="#" data-filter=".grade">教务</a></li>
							<li><a href="#" data-filter=".custom">自定义</a></li>
						</ul>
					</div>
					<!-- isotope filters end -->

					<!-- portfolio items start -->

					<div class="isotope-container row grid-space-20">
 						<div class="col-sm-6 col-md-3 isotope-item shop">
							<div class="image-box">
								<div class="overlay-container">
									<img src="images/taobao2.jpeg" alt=""> <a class="overlay"
										data-toggle="modal" data-target="#project-1"> <i
										class="fa fa-search-plus"></i> <span>Shopping</span>
									</a>
								</div>
								<a class="btn btn-default btn-block" data-toggle="modal"
									data-target="#project-1">查看淘宝订单</a>
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
														<s:form action="uploadTaobao" method="post" enctype="multipart/form-data" onsubmit="return submitForm()">
															<br />
															<table width="818" border="1">
																<tr>
																	<td width="176">
																		<div align="center">
																			用户附件
																		</div>
																	</td>
																	<td width="626" id="fileForm"><br>
																		<input type="file" id="uploadFileTaobao" name="fileUploadToolsTaobao.uploadFile" onchange="file_change(this)"  size="55">
																	</td>
																</tr>
															</table>
															
															<br/>
															<input type="hidden" name="name" value=${ user.nickname }> 
															
															
														<!-- 上传文件，最近一次加的 qqqqqqqqqqqqqqqqqqqqqqqqqqqqwqqqqqqqqqqqqqqqqqqqqqqqqqqqqq -->
													</div>
	
													<div class="col-md-6">
														<img src="images/taobao2.jpeg" alt="">
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
					
						<div class="col-sm-6 col-md-3 isotope-item grade">
							<div class="image-box">
								<div class="overlay-container">
									<img src="images/jiaowuchu.jpeg" alt=""> <a
										class="overlay" data-toggle="modal" data-target="#project-2">
										<i class="fa fa-search-plus"></i> <span>Daily</span>
									</a>
								</div>
								<a class="btn btn-default btn-block" data-toggle="modal"
									data-target="#project-2">查看哈尔滨工业大学成绩单～</a>
							</div>
							<!-- Modal -->
							<div class="modal fade" id="project-2" tabindex="-1"
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
													<!-- 上传文件，最近添加的 qqqqqqqqqqqqqqqqqqqqqqqqqqqqwqqqqqqqqqqqqqqqqqqqqqqqqqqqqq -->
													<s:form action="uploadJiaowuchu" method="post" enctype="multipart/form-data" onsubmit="return submitForm()">
														<br />
														<table width="818" border="1">
															<tr>
																<td width="176">
																	<div align="center">
																		用户附件
																	</div>
																</td>
																<td width="626" id="fileForm"><br>
																	<input type="file" id="uploadFileJiaowuchu" name="fileUploadToolsJiaowuchu.uploadFile" onchange="file_change(this)"  size="55">
																</td>
															</tr>
														</table>
														
														<br/>
														<input type="hidden" name="name" value=${ user.nickname }>
														
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

						<div class="col-sm-6 col-md-3 isotope-item custom">
							<div class="image-box">
								<div class="overlay-container">
									<img src="images/portfolio-3.jpg" alt=""> <a
										class="overlay" data-toggle="modal" data-target="#project-3">
										<i class="fa fa-search-plus"></i> <span>Daily</span>
									</a>
								</div>
								<a class="btn btn-default btn-block" data-toggle="modal"
									data-target="#project-3">自定义表格提取[初步]</a>
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
													<!-- 上传文件，最近添加的 qqqqqqqqqqqqqqqqqqqqqqqqqqqqwqqqqqqqqqqqqqqqqqqqqqqqqqqqqq -->
													<s:form action="uploadCustom" method="post" enctype="multipart/form-data" onsubmit="return submitForm()">
														<br />
														<table width="818" border="1">
															<tr>
																<td width="176">
																	<div align="center">
																		用户附件
																	</div>
																</td>
																<td width="626" id="fileForm"><br>
																	<input type="file" id="uploadFileCustom" name="fileUploadToolsCustom.uploadFile" onchange="file_change(this)"  size="55">
																</td>
															</tr>
														</table>
														
														<br/>
														<p><h4>参数设置</h4></p>
														<table>
															<tr>
																<td>表格class</td>
																<td><input type="text" name="tableCustom" value="table_class"></td>
															</tr>
															<tr>
																<td>行class</td>
																<td><input type="text" name="trCustom" value="tr_class"></td>
															</tr>
															<tr>	
																<td>单元格class</td>
																<td><input type="text" name="tdCustom" value="td_class"></td>
															</tr>															<tr>
																<td>表格标签</td>
																<td><input type="text" name="tableCustom" value="table"></td>
															</tr>
															<tr>
																<td>行标签</td>
																<td><input type="text" name="trCustom" value="tr"></td>
															</tr>
															<tr>	
																<td>单元格标签</td>
																<td><input type="text" name="tdCustom" value="td"></td>
															</tr>
															<!-- <tr>
																<td>高级</td><input type="text" name="tableCustom" placeholder="table"></td>
															</tr> -->
														</table>
														
														<br/>
														<p><h4>高级</h4></p>
														<table>
															<p><h4>CSS样式</h4></p>
															<tr>
																<td>表格ID:</td>
																<td><input type="text" name="tableCustom" value="tableID"></td>
															</tr>
															<tr>
																<td>行ID:</td>
																<td><input type="text" name="trCustom" value="trID"></td>
															</tr>
															<tr>	
																<td>单元格ID:</td>
																<td><input type="text" name="tdCustom" value="tdID"></td>
															</tr>
															<tr>
																<td>表格Attribute-Value键值对</td>
																<td><input type="text" name="tableCustom" value="undefined"></td>
															</tr>
															<tr>
																<td>行Attribute-Value键值对</td>
																<td><input type="text" name="trCustom" value="undefined"></td>
															</tr>
															<tr>	
																<td>单元格Attribute-Value键值对</td>
																<td><input type="text" name="tdCustom" value="undefined"></td>
															</tr>
																																													<tr>
																<td>表格Attribute-Value(正则表达式)</td>
																<td><input type="text" name="tableCustom" value="undefined"></td>
															</tr>
															<tr>
																<td>行Attribute-Value(正则表达式)</td>
																<td><input type="text" name="trCustom" value="undefined"></td>
															</tr>
															<tr>	
																<td>单元格Attribute-Value(正则表达式)</td>
																<td><input type="text" name="tdCustom" value="undefined"></td>
															</tr>
														</table>	
														<input type="hidden" name="name" value=${ user.nickname }>													
														
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

						<div class="col-sm-6 col-md-3 isotope-item games">
							<div class="image-box">
								<div class="overlay-container">
									<img src="images/overwatch.jpg" alt=""> <a
										class="overlay" data-toggle="modal" data-target="#project-4">
										<i class="fa fa-search-plus"></i> <span>Daily</span>
									</a>
								</div>
								<a class="btn btn-default btn-block" data-toggle="modal"
									data-target="#project-4">查看微博热点话题</a>
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
													<!-- 上传文件，最近添加的 qqqqqqqqqqqqqqqqqqqqqqqqqqqqwqqqqqqqqqqqqqqqqqqqqqqqqqqqqq -->
													<s:form action="uploadOw" method="post" enctype="multipart/form-data" onsubmit="return submitForm()">
														<br />
														<table width="818" border="1">
															<tr>
																<td width="176">
																	<div align="center">
																		用户附件
																	</div>
																</td>
																<td width="626" id="fileForm"><br>
																	<input type="file" id="uploadFileOw" name="fileUploadToolsOw.uploadFile" onchange="file_change(this)"  size="55">
																</td>
															</tr>
														</table>
														
														<br/>
														<input type="hidden" name="name" value=${ user.nickname }>
													<!-- 上传文件，最近一次加的 qqqqqqqqqqqqqqqqqqqqqqqqqqqqwqqqqqqqqqqqqqqqqqqqqqqqqqqqqq -->
												</div>

												<div class="col-md-6">
													<img src="images/overwatch.jpg" alt="">
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
						
						<div class="col-sm-6 col-md-3 isotope-item shop">
							<div class="image-box">
								<div class="overlay-container">
									<img src="images/alipay.jpg" alt=""> <a
										class="overlay" data-toggle="modal" data-target="#project-5">
										<i class="fa fa-search-plus"></i> <span>Shopping</span>
									</a>
								</div>
								<a class="btn btn-default btn-block" data-toggle="modal"
									data-target="#project-5">查看支付宝转账记录</a>
							</div>
							<!-- Modal -->
							<div class="modal fade" id="project-5" tabindex="-1"
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
													<!-- 上传文件，最近添加的 qqqqqqqqqqqqqqqqqqqqqqqqqqqqwqqqqqqqqqqqqqqqqqqqqqqqqqqqqq -->
													<s:form action="uploadAlipay" method="post" enctype="multipart/form-data" onsubmit="return submitForm()">
														<br />
														<table width="818" border="1">
															<tr>
																<td width="176">
																	<div align="center">
																		用户附件
																	</div>
																</td>
																<td width="626" id="fileForm"><br>
																	<input type="file" id="uploadFileAlipay" name="fileUploadToolsAlipay.uploadFile" onchange="file_change(this)"  size="55">
																</td>
															</tr>
														</table>
														
														<br/>
														<input type="hidden" name="name" value=${ user.nickname }>
														
													<!-- 上传文件，最近一次加的 qqqqqqqqqqqqqqqqqqqqqqqqqqqqwqqqqqqqqqqqqqqqqqqqqqqqqqqqqq -->
												</div>

												<div class="col-md-6">
													<img src="images/alipay.jpg" alt="">
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

						<div class="col-sm-6 col-md-3 isotope-item games">
							<div class="image-box">
								<div class="overlay-container">
									<img src="images/hearthstone.png" alt=""> <a
										class="overlay" data-toggle="modal" data-target="#project-6">
										<i class="fa fa-search-plus"></i> <span>Game</span>
									</a>
								</div>
								<a class="btn btn-default btn-block" data-toggle="modal"
									data-target="#project-6">炉石传说排行查询</a>
							</div>
							<!-- Modal -->
							<div class="modal fade" id="project-6" tabindex="-1"
								role="dialog" aria-labelledby="project-3-label"
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
													<!-- 上传文件，最近添加的 qqqqqqqqqqqqqqqqqqqqqqqqqqqqwqqqqqqqqqqqqqqqqqqqqqqqqqqqqq -->
													<s:form action="uploadHs" method="post" enctype="multipart/form-data" onsubmit="return submitForm()">
														<br />
														<table width="818" border="1">
															<tr>
																<td width="176">
																	<div align="center">
																		用户附件
																	</div>
																</td>
																<td width="626" id="fileForm"><br>
																	<input type="file" id="uploadFileHs" name="fileUploadToolsHs.uploadFile" onchange="file_change(this)"  size="55">
																</td>
															</tr>
														</table>
														
														<br/>
														<input type="hidden" name="name" value=${ user.nickname }>
													<!-- 上传文件，最近一次加的 qqqqqqqqqqqqqqqqqqqqqqqqqqqqwqqqqqqqqqqqqqqqqqqqqqqqqqqqqq -->
												</div>

												<div class="col-md-6">
													<img src="images/hearthstone.png" alt="">
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

						<div class="col-sm-6 col-md-3 isotope-item grade">
							<div class="image-box">
								<div class="overlay-container">
									<img src="images/port.jpg" alt=""> <a
										class="overlay" data-toggle="modal" data-target="#project-7">
										<i class="fa fa-search-plus"></i> <span>Daily</span>
									</a>
								</div>
								<a class="btn btn-default btn-block" data-toggle="modal"
									data-target="#project-7">查看教务处选课信息</a>
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
													<!-- 上传文件，最近添加的 qqqqqqqqqqqqqqqqqqqqqqqqqqqqwqqqqqqqqqqqqqqqqqqqqqqqqqqqqq -->
													<s:form action="uploadCustom" method="post" enctype="multipart/form-data" onsubmit="return submitForm()">
														<br />
														<table width="818" border="1">
															<tr>
																<td width="176">
																	<div align="center">
																		用户附件
																	</div>
																</td>
																<td width="626" id="fileForm"><br>
																	<input type="file" id="uploadFileCustom" name="fileUploadToolsCustom.uploadFile" onchange="file_change(this)"  size="55">
																</td>
															</tr>
														</table>
														
														<br/>
														<input type="hidden" name="name" value=${ user.nickname }>
														
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

						<div class="col-sm-6 col-md-3 isotope-item shop">
							<div class="image-box">
								<div class="overlay-container">
									<img src="images/jd.jpeg" alt=""> <a
										class="overlay" data-toggle="modal" data-target="#project-8">
										<i class="fa fa-search-plus"></i> <span>Shopping</span>
									</a>
								</div>
								<a class="btn btn-default btn-block" data-toggle="modal"
									data-target="#project-8">查看京东商城订单记录</a>
							</div>
							<!-- Modal -->
							<div class="modal fade" id="project-8" tabindex="-1"
								role="dialog" aria-labelledby="project-8-label"
								aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">
												<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
											</button>
											<h4 class="modal-title" id="project-8-label">Project
												Title</h4>
										</div>
										<div class="modal-body">
											<h3>Project Description</h3>
											<div class="row">
												<div class="col-md-6">
													<!-- 上传文件，最近添加的 qqqqqqqqqqqqqqqqqqqqqqqqqqqqwqqqqqqqqqqqqqqqqqqqqqqqqqqqqq -->
													<s:form action="uploadJd" method="post" enctype="multipart/form-data" onsubmit="return submitForm()">
														<br />
														<table width="818" border="1">
															<tr>
																<td width="176">
																	<div align="center">
																		用户附件
																	</div>
																</td>
																<td width="626" id="fileForm"><br>
																	<input type="file" id="uploadFileJd" name="fileUploadToolsJd.uploadFile" onchange="file_change(this)"  size="55">
																</td>
															</tr>
														</table>
														
														<br/>
														<input type="hidden" name="name" value=${ user.nickname }>
														
													<!-- 上传文件，最近一次加的 qqqqqqqqqqqqqqqqqqqqqqqqqqqqwqqqqqqqqqqqqqqqqqqqqqqqqqqqqq -->
												</div>

												<div class="col-md-6">
													<img src="images/jd.jpeg" alt="">
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
					<!-- portfolio items end -->

				</div>
			</div>
		</div>
	</div>
	<!-- section end -->

	<!-- section start -->
	<!-- ================ -->
	<div class="default-bg space black">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h2 class="text-center">Contact Us</h2>
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
			<!-- <p id="clients" class="title text-center">Contact Us</p> -->
			<div class="row">
				<div class="col-md-4">
					<div class="media testimonial">
						<div class="media-left">
							<img src="images/owlogo1.png" alt="">
						</div>
						<div class="media-body">
							<h3 class="media-heading">FanYucai</h3>
							<blockquote>
								<p>fanyucai@126.com</p>
								<!-- <footer>Someone famous in <cite title="Source Title">Source
									Title</cite></footer> -->
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
							<h3 class="media-heading">lanxuan365</h3>
							<blockquote>
								<p>719464096@qq.com</p>
								<!-- <footer>Someone famous in <cite title="Source Title">Source
									Title</cite></footer> -->
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
							<h3 class="media-heading">LouYJ</h3>
							<blockquote>
								<p>865227010@qq.com</p>
								<!-- <footer>Someone famous in <cite title="Source Title">Source
									Title</cite></footer> -->
							</blockquote>
						</div>
					</div>
				</div>
			</div>
			<!-- <div class="row">
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
				</div> -->
			</div>
		</div>
	</div>



	<!-- footer start -->
	<footer id="footer"> <!-- .subfooter start --> <!-- ================ -->
	<div class="subfooter">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<p class="text-center">
						Copyright © 2016 AirPull by <a target="_blank"
							href="https://github.com/A1rDr0p">A1rDr0p Group</a>.
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
