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

<title>產品介紹</title>
<style type="text/css">
	#productDetail{
	max-width:500px; 
	min-width: 300px;
	background:url("image/yellow/stamp1.png") left top no-repeat,
				url("image/yellow/stamp3.png") right bottom  no-repeat,
				url("image/registered/png/bg02.png") center top no-repeat ;
	color: white;
		
	}
		th{border: red solid 2px; padding:5px 10px; border-bottom-color:lightgray;color:white;}
		td{border: lightgray solid 2px; padding:5px 10px;}
		
		table{box-shadow: gray 1px 1px 3px; padding:2px 5px; background-color: black;color:white;}		
		table{border-collapse: collapse;width:85%;margin:auto}
		table img{width:48px;vertical-align: middle;}
	.stockShortage{box-shadow:red 0 0 3px;border: darkred 1px solid;padding-left: 2px}
	.table01 .tr01:hover {
			background-color: white;
			color: black;					
		}		
</style>


</head>
<body>
	<%
			String productId = request.getParameter("buyInId");
			Product product = null;
			if(productId!=null){
				ProductSelectService service = new ProductSelectService();
				product = service.getProduct(productId);
			}
		%>	
	    	
			
			<div style="padding-top:0px; margin:about;top:50px;text-align: center;" >
			<% if(product!=null) {%>
			<div>
				<div class='imgDiv'>
				<img src='<%= product.getPhotoUrl() %>' style="width: 80%;">
				</div>
				<div class='dataDiv'>
					<h2>No.<%= product.getId() %><%= product.getName() %></h2>
					<p>價格<%=(int)product.getUnitPrice() %> </p>
					<hr>
					<%= product.getDescription() %>
					<form action="add_cart.do" method="get">
					<input type='text' style='width:3em ;display:none;' readonly name='productId' value='<%=  product.getId() %>' >
					<input type="submit" value="加入購物車">
					</form>
				</div>
			</div>
				<%--= QA --%>
	<form action="" method="Get">
		<table class="table01">
			<caption>QA</caption>
			<tr>
			
				<th>暱稱</th>
				<th>QA</th>
				<th>TIME</th>
			</tr>
			
			<tr class="tr01">
				
				<td>暱稱</td>
				<td style="width: 50%;">QA</td>			
				<td>TIME</td>
			<tr>
				<td colspan="3">
				<textarea style="width: 100%;height:200px;" required="required" name="question" id="question" rows="5" cols="50" class="ap_area_w500_h80" placeholder="想提出的問題 最多250個字" maxlength="500"></textarea>
				<input type="submit" name="submit" value="送出">
				</td>
					
				
			</tr>
		</table>
	</form>
			
			<%}else{ %>
			<p>查無此編號(#<%= productId %>)的產品</p>
			<% } %>
		</div>
	
</body>
</html>