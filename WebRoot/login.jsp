<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link type="text/css" href="css/login.css" rel="stylesheet" />
<link type="text/css" href="css/smoothness/jquery-ui-1.7.2.custom.html"
	rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/easyTooltip.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
<title>用户登录</title>
</head>

<body>
	<div>
     <h1 align="center" 
      style="color:white;font-size:50px">学生信息管理系统</h1>
		</div>
	<div id="container">
		<div class="logo">
			<a href="#"><img src="assets/logo.png" alt="" /></a>
		</div>
		<div id="box">
			<form name="myForm" action="/StudentServlet/login?action=login" method="post">
				<p class="main">
					<label>用户名: </label> <input name="name" type="text" value="" /> <label>密码:
					</label> <input type="password" name="password" value="">
				</p>
				<p class="space">
					<input type="submit" value="登录" class="login"
						style="cursor: pointer;" />
				</p>
				<input type="reset" name="reset" value="重置"  class="reset" style="cursor: pointer;">
			</form>
		</div>
	</div>
</body>
</html>