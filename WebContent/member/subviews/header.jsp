<%@page import="uuu.vgb.entity.ShoppingCart"%>
<%@page import="sun.security.util.Length"%>
<%@page import="uuu.vgb.entity.Product"%>
<%@page import="uuu.vgb.service.ProductSelectService"%>
<%@page import="uuu.vgb.entity.Customer" %>
<%@page errorPage="error.jsp"  %>
<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8"%>
<header>
	    		<%ShoppingCart cart = (ShoppingCart)session.getAttribute("cart") ;%>
	    		<ul>
					<li><a href="/CB"><img style="width: 100%;" src="image/yellow/home.png" title="home"></a></li>
					
					<li class="li-01"><%Customer member=(Customer)session.getAttribute("member");%>
 					<%= member!=null?member.getName():""%>
 					<% if(member == null){ %><a href="<%=request.getContextPath() %>">Login</a>
 					 <%}else{ %>
 					 <a href="<%=request.getContextPath() %>/logout.do">Logout</a>
 					 <% } %> </li>
 					 
					
				</ul>
					
					
 					
 					
	    	</header>