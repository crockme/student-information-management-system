<%@page import="UserDao.StudentDo"%>
<%@page import="UserDao.UserDao"%>
<%@page import="Bean.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="UserDao.StudentMothod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
function addStu()
{
	
		window.location.href="add.jsp";  
}
function search()
{
	var userName= document.myForm.userName.value;
	window.location.href="select.jsp?userName="+userName;  
	}
	
function go()
{
	var a = document.getElementById("page").value;
	window.location.href="allStudent.jsp?currentpage="+a; 
}
</script>
<body>
	<%
  StudentMothod sm = new StudentMothod(); 
  StudentDo sd = new StudentDo();
  int sum = sd.getCount();//获取数据的总数
  int pagenum = 5;//每页所显示的数据
  int currentpage=1;//当前页面
  int pagecount = 0;//总页数
  if(sum%pagenum==0)
  {
	  pagecount=sum/pagenum;
  }
  else{
	  pagecount=sum/pagenum+1;
  }
  if(request.getParameter("currentpage")!=null&&!request.getParameter("currentpage").equals(""))
  {
 	 currentpage=Integer.valueOf(request.getParameter("currentpage"));
  }
%>
	<center>
		<form name="myForm">
			学生信息管理<br>
			<table border="1" bordercolor="green" cellspacing="0" width="80%">
				<tr>
					<td>学生姓名：<input type="text" size="12" value="1" maxlength="12"
						name="userName"> <input type="button" value="查询"
						onclick="search();"><br>
					</td>
					<td><input type="button" value="新增" onclick="addStu();"></td>
				</tr>
			</table>
			<table border="1" bordercolor="green" cellspacing="0" width="80%">
				<tr>
					<th>学号</th>
					<th>姓名</th>
					<th>年龄</th>
					<th>性别</th>
					<th>专业</th>
					<th>地址</th>
					<th>操作</th>
				</tr>

				<%
				ArrayList<Student> li = sd.getPage(currentpage, pagenum);
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
					<td><a href="/StudentServlet/add?id=<%=s.getId()%>&action=delete">删除</a>&nbsp;&nbsp;<a
						href="update.jsp?id=<%=s.getId()%>">修改</a></td>
				</tr>
				<% }
				%>


			</table>
		</form>

	</center>
	<center>
		共<%=sum %>条记录 当前第<%=currentpage %>页 <a
			href="allStudent.jsp?currentpage=1">首页</a>

		<%if(currentpage > 1){ %>
		<a href="allStudent.jsp?currentpage=<%=currentpage-1 %>">上一页</a>
		<%} %>
		<%
if(pagecount>currentpage){
%>
		<a href="allStudent.jsp?currentpage=<%=currentpage+1 %>	">下一页</a>
		<%} %>
		<a href="allStudent.jsp?currentpage=<%=pagecount %>">尾页</a> <input
			type="text" name="currentPage" id="page" size="1" maxlength="3"
			value="<%=currentpage %>"> <input type="button" value="GO"
			onclick="go()">
	</center>
</body>
</html>