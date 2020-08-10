
<%@page import="java.util.Enumeration"%>
<%@ page   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" >
<style>
td, tr, table{
border: black 2px solid double;
background: yellow;
padding: 2px;
margin: 10px;
}

</style>
<title>Insert title here</title>
</head>
<body>
	<h1>jsp註解</h1>
	<hr>
	<p>Html 註解</p>
	<!-- Hello -->
	<p>jsp註解</p>
	<%--<p>hello</p> --%>
	<p>Java註解</p>
	<% //hello %>
	
	
	<table>
		<caption>99乘法表</caption>
		<% for(int i=1;i<=9;i++){ %>
		<tr>
		<% for(int j =1;j<=9;j++){ %>
			<td><%= i %>*<%= j %>=<%= i*j %></td>
			<%} %>
		</tr>
	<%} %>
	<% request.setCharacterEncoding("utf-8"); %>
	<p>requset query string:<%=request.getQueryString() %></p>
	<p>requset Parameter:<%=request.getParameter("id") %></p>
	<p>requset Parameter:<%=request.getParameter("name") %></p>
	<p>requset method:<%=request.getMethod() %></p>
	
	
	
	<form method='post'>
	<input name="id"><br>
	<input name="name"><br>
	<input name="password"><br>
	<input type='submit'><br>
	</form>
	</table>
	<div>
	<table id='reqHeaders' style='width:75%'>
			<caption>request中的Headers</caption>
			<%
				Enumeration<String> headerNames = request.getHeaderNames();
				while(headerNames.hasMoreElements()){
					String name = headerNames.nextElement();
					String value = request.getHeader(name);
			%>			
			<tr>
				<td><%= name %></td>
				<td><%= request.getHeader(name) %></td>
			</tr>
			<% } %>
		</table>		
	</div>
	
	
	
	
	
	
</body>
</html>