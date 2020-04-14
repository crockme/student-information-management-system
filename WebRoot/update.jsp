<%@page import="UserDao.StudentMothod"%>
<%@page import="Bean.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
 String id = request.getParameter("id");
StudentMothod sm = new StudentMothod();
Student s= sm.select(id);
%>
	<font size="5" face="楷体"><b><center>修改信息</center></b></font>
	<br>
	<hr align="center" width="30%" color="green" size="4" />
	<br>
	<form action="/StudentServlet/update?action=update" method="post">
		<table align="center" width='20%' cellpadding='3'>
			<tr>
				<td>学号：</td>
				<td><input type="text" name="id" value="<%=s.getId() %>"
					readonly="readonly">
			</tr>
			<tr>
				<td>姓名：</td>
				<td><input type="text" name="name" value="<%=s.getName() %>">
			</tr>
			<tr>
				<td>年龄：</td>
				<td><input type="text" name="age" value="<%=s.getAge() %>">
			</tr>
			<tr>
				<td>性别：</td>
				<td><input type="radio" name="sex" value="1" <%if(s.getSex().equals("man")) {out.print("checked");}%>>男
				<td><input type="radio" name="sex" value="0" <%if(s.getSex().equals("women")) {out.print("checked");}%>>女
			</tr>
			<tr>
				<td>专业：</td>
				<td><input type="text" name="grad" value="<%=s.getGrad() %>">
			</tr>
			<tr>
				<td>地址：</td>
				<td><input type="text" name="address"
					value="<%=s.getAddress() %>">
			</tr>
			<tr>
				<td></td>
				<td><input type="reset" name="chongzhi" value="重置"></td>
				<td><input type="submit" name="tijiao" value="提交"></td>
			</tr>
		</table>
	</form>
	<center>
</body>
</html>