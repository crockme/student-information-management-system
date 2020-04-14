<%@page import="UserDao.StudentMothod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript"></script>
<body>
	<%
String id = request.getParameter("id");
out.print(id);
StudentMothod sm = new StudentMothod();
int flag = sm.delete(id);
if(flag!=0)
{
	out.print("<script>alert('删除成功！'); location.href='allStudent.jsp';</script>");
	}
else
{
	out.print("<script> alert('删除失败！'+id); location.href='allStudent.jsp';</script>");
	
}

%>
</body>
</html>