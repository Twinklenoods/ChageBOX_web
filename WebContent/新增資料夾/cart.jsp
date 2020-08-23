<%@page import="uuu.vgb.service.ProductService"%>
<%@page import="uuu.vgb.entity.Customer"%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>購物車</title>
<meta name="viewport" content="width=device-width, initial-scale=1" >

	<style>
		td{border: lightgray solid 1px; padding:5px 10px;}
		table{box-shadow: gray 1px 1px 3px; padding:2px 5px; background-color: white}		
		table{border-collapse: collapse;width:85%;margin:auto}
		table img{width:48px;vertical-align: middle;}
		.stockShortage{box-shadow:red 0 0 3px;border: darkred 1px solid;padding-left: 2px}
	</style>
	<script>
		function goShopping(){
			location.href="<%= request.getContextPath() %>/products_list.jsp";
		}
		
		function checkQuantity(inputQuantity){
            var min = parseInt($(inputQuantity).attr("min"));
            var max = parseInt($(inputQuantity).attr("max"));
            var quantity = parseInt($(inputQuantity).val());
            if(quantity<min || quantity>max){
                $(inputQuantity).addClass("stockShortage");
            }else{
                $(inputQuantity).removeClass("stockShortage");
            }                
        }		
	</script>
</head>
<body>

<article>	
	
		
	<%--= cart --%>
	
	<form action="/member/update_cart.do" method="POST"> <!-- /vgb/member/update_cart.do -->
		<table>
			<caption>購物明細</caption>
			<tr>
				<th>No.</th><th>名稱</th><th>顏色</th>
				<th>定價</th><th>折扣</th><th>售價</th><th>數量</th><th>小計</th><th>刪除</th>
			</tr>
			
			<tr>
				<td>ID</td>
				<td>
					照片
					鳴子
				</td>
				<td> 顏色 </td>			
				<td>價前</td>
				<td>明細</td>
				<td>前</td>
				<td><input onchange="checkQuantity(this)"
						type="number" name="quantity" value="數量" 
						min='1' max='8'></td>
				<td>car</td>
				<td><input type="checkbox" name="delete>" value="刪除"></td>
			</tr>
		
			<tr>
				<td colspan="9" style="text-align: right">
				共_項, _件, 總金額為_元
				</td>			
			</tr>		
			
			<tr>				
				<td colspan="9" style="text-align: right">
				VIP折扣後總金額為_元
				</td>		
			</tr>
			
			<tr>
				<td colspan="9">
					<input type="button" value="回到賣場" onclick="goShopping()">
					<input type="submit" name="submit" value="修改購物車">
					<input type="submit" name="submit" value="我要結帳">
				</td>
			</tr>
		</table>
	</form>
	
	<%--=cart.getMember() --%>
</article>

</body>
</html>