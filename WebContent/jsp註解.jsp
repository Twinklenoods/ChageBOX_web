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
		<% }%>
	
	
	
	</table>
	
	
	
	
	
	
	
</body>
</html>