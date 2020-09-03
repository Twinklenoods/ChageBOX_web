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
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
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
	
    var geo = undefined;
    
    $(document).ready(init78963);
    function init78963(){
        //判斷是否支援Geo Location
        if(geo = getGeoLocation()){
            $("#title").text("Geolocation is supported.");
            /*write code here*/
            //geo.getCurrentPosition(showCoords);
            //geo.watchPosition(showCoords,errorHandler);
       }else{
            $("#title").text("Geolocation is not supported.");
        }
        $("#myInput").change(mapHandler);
    }
    function mapHandler(){
        var mapAddress =  $("#myInput").val();
		$("#myMap").attr("src","http://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q="+mapAddress+"超商"+"&z=16&output=embed");
		//$("#myMap").attr("src","http://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q="+lat+","+lon+"&z=16&output=embed");
		//window.location.href="http://maps.google.com/maps?q="+lat+","+lon;
    }
    
    function getGeoLocation()
    {
        if(navigator.geolocation){
            return navigator.geolocation;
        }else{
            return undefined;
        }
    }
    
    function showCoords(e){
        var lat = e.coords.latitude;
        var lon = e.coords.longitude;
        $("#latitude").text(lat.toString());
        $("#longitude").text(lon.toString());
    }
    
    function errorHandler(error){
    	alert("Error!");
    }
    
    var app = angular.module('myApp', []);
    app.controller('myCtrl', function($scope) {
        $scope.name = "address/地址輸入";
    });
    //老師的
    var chooseStoreBtn =

           "<input type='button' id='chooseStoreBtn' value='選擇超商' onclick='goEzShip()'>";

       function shippingChange(){

           $("#pay").removeAttr("list");

           $("#pay").attr("autocomplete","on");

           $("#pay").prop("readonly",false);

           $("#pay").css("width", parseInt($("#recipientEmail").css("width")));

            $("#chooseStoreBtn").remove();

           

           switch($("#pay2").val()){

           case 'Shop':

               $("#pay2").attr("list", "shopList");

               $("#pay2").attr("autocomplete","off");

               break;

           case 'Store':

               $("#pay2").attr("autocomplete","off");

               $("#pay2").prop("readonly",true);

               $("#pay2").css("width", parseInt($("#recipientEmail").css("width"))-75);

               $(chooseStoreBtn).insertAfter($("#shippingAddress"));

               break;

           }

           calculateFee();

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
	
		<form action="buyYes.do" method="post" id="cartForm"> <!-- /vgb/member/update_cart.do -->
		<table class="table01" ng-app="myApp" ng-controller="myCtrl">
			
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
				<td>1</td>
				<input type="text" name="proID<%=item.hashCode() %>" value="<%=item.getProduct().getId()%>" style="display:none;">
				<input type="text" name="ownerID<%=item.hashCode() %>" value="<%=item.getProduct().getOwner().getId()%>" style="display:none;">
				<input type="text" name="USER<%=item.hashCode() %>" value="<%=member.getId() %>" style="display:none;">
				<input type="text" name="chash<%=item.hashCode() %>"  value="<%=(int)item.getProduct().getUnitPrice() %>" style="display:none;">
				<input type="text" name="proName<%=item.hashCode() %>"  value="<%=item.getProduct().getName() %>" style="display:none;">
				<td><%=(int)item.getProduct().getUnitPrice() %></td>
				
				
			</tr>
		<%} %>
			<tr>
				<td colspan="7" style="text-align: right; border-right-color: red ;border-left-color: red; ">
				<%= cart.getTotalQuantity() %>項商品,共<%=cart.size() %>件,總金額<span id="total"><%= (int)cart.getTotalAmount()%></span>元
				</td>			
			</tr>	
			
			<tr>
				<td colspan="2" >付款方式(案件計算):
					<select id="pay" name="pay" required onchange="calculateFee(),changeShippingOption()" >  
    				<option value="" data-fee="0">請選擇</option>
    				<option value="0" data-fee="0">面交</option>
    				<option value="60" data-fee="60">貨到付款-60</option>
    				<option value="0" data-fee="0">超商付款</option>
    				<option value="0"data-fee="0">信用卡</option>
    				
    				<%-- for(PaymentType pType:PaymentType.values()) { --%>
    				<%--=pType.name()--%><%--=pType.getFee()*cart.size()--%>'><%--=pType.getDescription()--%>
    				<%--} --%>
    				
    				
    				</select>
				</td>
			
				
				<td colspan="2" >貨運方式(案件計算):
				
				<select id="use" name="use" required onchange="calculateFee()" onchange='shippingChange()'>  
    				<option value="">請選擇</option>
    				<option value="0" data-fee="0">面交</option>
    				<option value="100"data-fee="100">宅配-100</option>
    				<option value="0"data-fee="0">超商取貨</option>
    				<%-- for(ShippingType pType2:ShippingType.values()) {--%>
    				<%--=pType2.name()--%><%--=pType2.getFee()*cart.size()--%><%--=pType2.getDescription()--%>
    				<%-- }--%>
    				
    			</select>
				</td>				
				<td colspan="2" style="text-align: right; border-right-color: red ;border-left-color: red; ">
				總金額含運費為<span id="TotalAmount"><%= (int)cart.getTotalAmount()%></span>元
				</td>		
			</tr>
			
			<tr>
			
			<td colspan="2" style="text-align:center;font-size:18px;"><br>
			<input ng-model="name" id="myInput"  onchange >(左側同步更新)<br><br>
			
			<iframe id="myMap" width='400' height='400' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='http://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=台北車站&z=16&output=embed'></iframe><br><br>
			
			
			
			
			
			</td>
			<td colspan="4" style="text-align:center;font-size:18px;">收件人<br>
			<p><textarea required name="name" style="width: 50%;"placeholder="name/姓名" ><%=member.getName() %></textarea></p>
			<p><textarea required name="phone" style="width: 50%;"placeholder="phone/電話" ><%=member.getPhone() %></textarea></p>
			<p><textarea required name="email" id="recipientEmail" style="width: 50%;"placeholder="email" ><%=member.getEmail()%></textarea></p>
			<p><textarea name="address" id="pay2" readonly style="width: 50%;"placeholder="address/地址" >{{name}}</textarea></p>
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