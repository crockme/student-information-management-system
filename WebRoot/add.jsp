<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<font size="5" face="楷体"><b><center>新增信息</center></b></font>
	<br>
	<hr align="center" width="30%" color="green" size="4" />
	<br>
	<form action="/StudentServlet/add?action=add" method="post">
		<table align="center" width='23%' cellpadding='3'>
			<tr>
				<td>学号：</td>
				<td><input type="text" name="id">
			</tr>
			<tr>
				<td>姓名：</td>
				<td><input type="text" name="name">
			</tr>
			<tr>
				<td>年龄：</td>
				<td><input type="text" name="age">
			</tr>
			<tr>
				<td>性别：</td>
				<td><input type="radio" name="sex" value="1">男
				<td><input type="radio" name="sex" value="0">女
			</tr>
			<tr>
				<td>专业：</td>
				<td><input type="text" name="grad">
			</tr>
			<tr>
				<td>地址：</td>
				<td><input type="text" name="address">
			</tr>
			<tr>
				<td></td>
				<td><input type="reset" name="" value="重置"></td>
				<td><input type="submit" name=" " value="提交"></td>
			</tr>
		</table>
	</form>
</body>
</html>