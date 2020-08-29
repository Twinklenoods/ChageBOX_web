<%@page import="uuu.vgb.entity.CartItem"%>
<%@page import="uuu.vgb.entity.ShoppingCart"%>
<%@page import="sun.security.util.Length"%>
<%@page import="uuu.vgb.entity.Product"%>
<%@page import="uuu.vgb.service.ProductSelectService"%>
<%@page import="uuu.vgb.entity.Customer" %>
<%@page errorPage="error.jsp"  %>
<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" >
<LINK href="css/IndexDivBG.css" rel="stylesheet" type="text/css">
<LINK href="css/ad01.css" rel="stylesheet" type="text/css">
<style>
		th{border: red solid 2px; padding:5px 10px; border-bottom-color:lightgray;}
		td{border: lightgray solid 2px; padding:5px 10px;}
		.table01{box-shadow: gray 1px 1px 3px; padding:2px 5px; background-color:black; }		
		.table01{border-collapse: collapse;width:85%;margin:auto}
		.table01 img{width:80px;vertical-align: middle;}
		.stockShortage{box-shadow:red 0 0 3px;border: darkred 1px solid;padding-left: 2px}
	.cart01{position: relative;
			top:116px;
	}
	.table01 .tr01:hover {
	background-color: white;
	color: black;		
				
	}		
	.tr02{
		border-left: red solid 2px;
	}
	</style>
	<script type="text/javascript">
	function goShopping(){
		location.href='../buy.jsp'
	}
	function checkOut(){
		location.href='check_out.jsp'
	}
	</script>
<title>購物車</title>
</head>
<body>
			<div class="divBG">
			<header style="color:white;">
	    		<ul>
					<li><a href="/CB">Home</a></li>
					<li>
					<form action="<%= request.getContextPath() %>/buy.jsp">
					<input type="search" name="search" placeholder="請輸入關鍵字..." style="width: 120px;height: 30px;">
					<input type="submit" value="查詢">
					</form>
					</li>
					<li class="li-01"><%Customer member=(Customer)session.getAttribute("member");%>
 					<%= member!=null?member.getName():""%>
 					<% if(member == null){ %><a href="<%=request.getContextPath() %>">Login</a>
 					 <%}else{ %>
 					 <a href="<%=request.getContextPath() %>/logout.do">Logout</a>
 					 <% } %> </li>
 					 <li><a href="<%= request.getContextPath() %>/cart.jsp">加入購物車</a></li>
					
				</ul>
					
					
 					
 					
	    	</header>

<div class="cart01">
<%ShoppingCart cart = (ShoppingCart)session.getAttribute("cart") ;%>

<%if (cart!=null&&cart.size()>0){ %>
	
		<form action="update_cart.do" method="GET"> <!-- /vgb/member/update_cart.do -->
		<table class="table01">
			<caption>購物明細</caption>
			<tr>
				<th style="border-right:none;">No.</th>
				<th>遊戲名稱</th>
				<th>發貨地區</th>
				<th>主機</th>
				<th>數量</th>
				<th>售價</th>
				<th>刪除</th>
			</tr>
			<%for (CartItem item:cart.getCartItemSet()) {
				Product p =item.getProduct();
			%>
			<tr class="tr01">
				<td class="tr02" style="border-left: red solid 2px; padding:5px 10px; border-bottom-color:lightgray;">No.<%=item.getProduct().getId()%></td>
				<td><img src="<%=item.getProduct().getPhotoUrl() %>"><%=item.getProduct().getName() %></td>
				<td><%=item.getProduct().getOrigin() %></td>			
				<td><%=item.getProduct().getHost() %></td>
				<td>1</td>
				<td><%=(int)item.getProduct().getUnitPrice() %></td>
				
				<td class="tr03" style="border-right-color: red; "><input type="checkbox" name="delete<%=item.hashCode() %>"></td>
			</tr>
		<%} %>
			<tr>
				<td colspan="9" style="text-align: right; border-right-color: red ;border-left-color: red; ">
				<%= cart.getTotalQuantity() %>項商品,共<%=cart.size() %>件,總金額<%= (int)cart.getTotalAmount()%>元
				</td>			
			</tr>	
			
			<tr>				
				<td colspan="9" style="text-align: right; border-right-color: red ;border-left-color: red; ">
				總金額含運費為<%= (int)cart.getTotalAmount() %>元
				</td>		
			</tr>
			
			<tr>
				<td colspan="9" style="text-align: right; border-right-color: red ;border-left-color: red; border-bottom-color: red;">
					<input type="button" value="回到賣場" onclick="goShopping()">
					<input type="submit" name="submit" value="修改購物車">
					<input type="button" name="submit1" value="我要結帳" onclick="checkOut()">
				</td>
			</tr>
		</table>
		<%}else{ %>
		<h1>你覺得你有加入商品到購物車嗎?還不快買!!</h1>
		<%} %>
	</form>
</div>

</div>
</body>
</html>