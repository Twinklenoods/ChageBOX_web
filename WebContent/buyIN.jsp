<%@page import="javafx.scene.control.ListCellBuilder"%>
<%@page import="uuu.vgb.entity.Product"%>
<%@page import="uuu.vgb.entity.Customer"%>
<%@page import="java.util.List"%>
<%@page import="uuu.vgb.service.ProductSelectService"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" >
<LINK href="css/IndexDivBG.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/style/vgb.css">
<title>產品介紹</title>
</head>
<body>
	<%
			String productId = request.getParameter("buyINId");
			Product product = null;
			if(productId!=null){
				ProductSelectService service = new ProductSelectService();
				product = service.getProduct(productId);
			}
		%>	
	    	
	<jsp:include page="/member/subviews/header.jsp" />
			<article style="padding: 400px;">
			<% if(product!=null) {%>
			<div>
				<div class='imgDiv'>
				<img src='<%= product.getPhotoUrl() %>'>
				</div>
				<div class='dataDiv'>
					<h2><%= product.getName() %></h2>
					
					
					<div>
						<form >
							<input type='text' readonly name='buyIN' value='<%= product.getId() %>'>
							<label>數量:</label>
							
						</form>
					</div>
				</div>
				<div style='clear:both'>
					<hr>
					<%= product.getDescription() %>
				</div>
			</div>
			<%}else{ %>
			<p>查無此編號(#<%= productId %>)的產品</p>
			<% } %>
		</article>
</body>
</html>