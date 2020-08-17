<%@ page   pageEncoding="UTF-8"%>
<%@page import="uuu.vgb.entity.Customer" %>
<header>
	    		<ul>
					<p><li><a href="/CB">Home</a></li>
					<li><a href=#>Products</a></li>
					<li class="li-01"><%Customer member=(Customer)session.getAttribute("member");%>
 					<%= member!=null?member.getName():""%>
 					<% if(member == null){ %><a href="<%=request.getContextPath() %>">Login</a>
 					 <%}else{ %>
 					 <a href="<%=request.getContextPath() %>/logout.do">Logout</a>
 					 <% } %> </li></p>
					
				</ul>
					
					
 					
 					
	    	</header>