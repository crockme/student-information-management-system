<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Bean.*"%>
<%@ page import="UserDao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<%
request.setCharacterEncoding("utf-8");
StudentMothod sm = new StudentMothod();
String name = request.getParameter("userName");
out.print(name);
ArrayList<Student> li = sm.selectAll(name);
%>
		<font size="5" face="楷体"><b><center>查询结果</center></b></font><br>
		<hr align="center" width="50%" color="green" size="4" />
		<br>
		<table border="1" bordercolor="green" cellspacing="0" width="50%">
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>年龄</th>
				<th>性别</th>
				<th>专业</th>
				<th>地址</th>

			</tr>
			<%
	
	for(int i = 0;i<li.size();i++)
	{
		Student s = li.get(i);
	%>

			<tr>
				<td><%=s.getId() %></td>
				<td><%=s.getName() %></td>
				<td><%=s.getAge() %></td>
				<td><%=s.getSex() %></td>
				<td><%=s.getGrad() %></td>
				<td><%=s.getAddress() %></td>
			</tr>
			<% }%>

		</table>
		<center>
			<a href="allStudent.jsp">返回首页</a>
		</center>
</body>
</html>