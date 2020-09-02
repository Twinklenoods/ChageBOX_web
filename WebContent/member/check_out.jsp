<%@page import="uuu.vgb.entity.ShippingType"%>
<%@page import="uuu.vgb.entity.PaymentType"%>
<%@page import="uuu.vgb.entity.CartItem"%>
<%@page import="uuu.vgb.entity.ShoppingCart"%>
<%@page import="sun.security.util.Length"%>
<%@page import="uuu.vgb.entity.Product"%>
<%@page import="uuu.vgb.service.ProductSelectService"%>
<%@page import="uuu.vgb.entity.Customer" %>
<%@page errorPage="error.jsp"  %>
<%@page import="java.util.List"%>
<%@ page   pageEncoding="UTF-8"%>
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
	.none{
	display: none;
	background: white;
	color:black;
	font-size: 15px;
	border-bottom: black;
	
	}
	</style>
	<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="js/IndexJs.js"></script>
<script type="text/javascript" src="js/top.js"></script>
<script type="text/javascript">
	function goShopping(){
		location.href='buy.jsp'
	}
	function checkOut(){
		location.href='check_out.jsp'
	}
	function calculateFee(){
		var payfee=$("#pay option:selected").attr("data-fee");
		var usefee=$("#use option:selected").attr("data-fee");
		console.log(Number(payfee),Number(usefee),Number($("#TotalAmount").text()));
		
		var totalFee = Number($("#total").text());
		
		if(payfee) totalFee+=Number(payfee);
		if(usefee) totalFee+=Number(usefee);
		
		$("#TotalAmount").text(totalFee);
	}
	</script>
<title>購物車</title>
</head>
<body>
<div class="divBG">
			<jsp:include page="/member/subviews/header.jsp" />

<div class="cart01">
<%ShoppingCart cart = (ShoppingCart)session.getAttribute("cart") ;%>
<%Customer member=(Customer)session.getAttribute("member");%>
<%if (cart!=null&&cart.size()>0){ %>
	
		<form action="buyYes.do" method="post"> <!-- /vgb/member/update_cart.do -->
		<table class="table01">
			<caption>結帳明細</caption>
			<tr>
				<th style="border-right:none;">No.</th>
				<th>遊戲名稱</th>
				<th>發貨地區</th>
				<th>主機</th>
				<th>數量</th>
				<th>售價</th>
				
			</tr>
			<%for (CartItem item:cart.getCartItemSet()) {
				Product p =item.getProduct();
			%>
			<tr class="tr01">
				<td class="tr02" style="border-left: red solid 2px; padding:5px 10px; border-bottom-color:lightgray;">
				No.<%=item.getProduct().getId()%></td>
				<td><img src="<%=item.getProduct().getPhotoUrl() %>"><%=item.getProduct().getName() %></td>
				<td><%=item.getProduct().getOrigin() %></td>			
				<td><%=item.getProduct().getHost() %></td>
				<td>2</td>
				<input type="text" name="proID<%=item.hashCode() %>" value="<%=item.getProduct().getId()%>" style="display:none;">
				<input type="text" name="USER<%=item.hashCode() %>" value="<%=member.getId() %>" style="display:none;">
				<td><%=(int)item.getProduct().getUnitPrice() %></td>
				
				
			</tr>
		<%} %>
			<tr>
				<td colspan="7" style="text-align: right; border-right-color: red ;border-left-color: red; ">
				<%= cart.getTotalQuantity() %>項商品,共<%=cart.size() %>件,總金額<span id="total"><%= (int)cart.getTotalAmount()%></span>元
				</td>			
			</tr>	
			
			<tr>
				<td colspan="2" >付款方式:
					<select id="pay" name="pay" required onchange="calculateFee()">  
    				<option value="">請選擇</option>
    				<% for(PaymentType pType:PaymentType.values()) { %>
    				<option value="<%=pType.name()%>" data-fee='<%=pType.getFee()%>'><%=pType.getDescription()%></option>
    				<%} %>
    				</select>
				</td>
				
				
				<td colspan="2" >貨運方式:
				<select id="use" name="use" required onchange="calculateFee()">  
    				<option value="">請選擇</option>
    				<% for(ShippingType pType2:ShippingType.values()) {%>
    				<option value="<%=pType2.name()%>" data-fee='<%=pType2.getFee()%>'><%=pType2.getDescription()%></option>
    				<% }%>
    				
    				</select>
				</td>				
				<td colspan="2" style="text-align: right; border-right-color: red ;border-left-color: red; ">
				總金額含運費為<span id="TotalAmount"><%= (int)cart.getTotalAmount()%></span>元
				</td>		
			</tr>
			<tr>
			<td colspan="2" style="text-align:center;font-size:18px;">收件人<br>
			<p><textarea style="width: 50%;"placeholder="name/姓名"></textarea></p>
			<p><textarea style="width: 50%;"placeholder="phone/電話"></textarea></p>
			<p><textarea style="width: 50%;"placeholder="email"></textarea></p>
			<p><textarea style="width: 50%;"placeholder="address/地址"></textarea></p>
			</td>
			<td colspan="4" style="text-align:center;font-size:18px;">帳單明細預覽<br>
			<p><textarea name="" style="width: 50%;"placeholder="name/姓名"></textarea></p>
			<p><textarea name="" style="width: 50%;"placeholder="phone/電話"></textarea></p>
			<p><textarea name="" style="width: 50%;"placeholder="email"></textarea></p>
			<p><textarea name="" style="width: 50%;"placeholder="address/地址" name="address"></textarea></p>
			</td>
			<tr>
				<td colspan="6" style="text-align: right; border-right-color: red ;border-left-color: red; border-bottom-color: red;">
					
					<input type="button" value="回到賣場" onclick="goShopping()">
					<input type="submit" name="submit" value="確認送出" >
				</td>
			</tr>
		
		
		
		</table>
		<%}else{ %>
		<h1>你覺得你有加入商品到購物車嗎?還不快買!!</h1>
		<%} %>
	</form>
</div>

</div>


我要結帳



</body>
</html>