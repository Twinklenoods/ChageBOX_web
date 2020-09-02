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
	
	<form action="" method="Get"> <!-- /vgb/member/update_cart.do -->
		<table>
			<caption>QA</caption>
			<tr>
				<th>No.</th>
				<th>暱稱</th>
				<th>QA</th>
				<th>TIME</th>
			</tr>
			
			<tr>
				<td>商品ID</td>
				<td>暱稱</td>
				<td style="width: 50%;">QA</td>			
				<td>TIME</td>
			<tr>
				<td colspan="4">
				<textarea style="width: 100%;height:200px;" required="required" name="question" id="question" rows="5" cols="50" class="ap_area_w500_h80" placeholder="想交換的遊戲 最多250個字" maxlength="500"></textarea>
				<input type="submit" name="submit" value="送出">
				</td>
					
				
			</tr>
		</table>
	</form>
	
	<%--=cart.getMember() --%>
</article>

</body>
</html>