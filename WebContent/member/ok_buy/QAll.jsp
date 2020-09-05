<%@page import="uuu.vgb.entity.Order"%>
<%@page import="uuu.vgb.service.OrderService"%>
<%@page import="uuu.vgb.entity.WantChange"%>
<%@page import="uuu.CB.controller.WantChangeServlet"%>
<%@page import="uuu.vgb.service.WantChangeService"%>
<%@page import="javafx.scene.control.ListCellBuilder"%>
<%@page import="uuu.vgb.entity.Product"%>
<%@page import="uuu.vgb.entity.Customer"%>
<%@page import="java.util.List"%>
<%@page import="uuu.vgb.service.ProductSelectService"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>

<head>
<LINK rel="stylesheet" type="text/css"  href="fancybox/jquery.fancybox.css">
<style>
.eventbtn {
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	font-family: Arial;
	color: #ffffff;
	font-size: 14px;
	background: #f49300;
	padding: 5px 10px 5px 10px;
	text-decoration: none;
	border: solid #fff 0px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .26);
	outline: none;
	cursor: pointer;
}

.eventbtn:hover {
	background: #e9402f;
	text-decoration: none;
}

.tags {
	list-style: none;
	margin: 0;
	overflow: hidden;
	padding: 0;
}

.tags li {
	float: left;
}

.tag_c {
	background: #0095f5;
	border-radius: 3px 0 0 3px;
	color: #ffffff;
	display: inline-block;
	height: 20px;
	line-height: 20px;
	padding: 0 20px 0 23px;
	position: relative;
	margin: 0 10px 10px 0;
	text-decoration: none;
}

.tag_c::before {
	background: #fff;
	border-radius: 10px;
	box-shadow: inset 0 1px rgba(0, 0, 0, 0.25);
	content: '';
	height: 6px;
	left: 10px;
	position: absolute;
	width: 6px;
	top: 7px;
}

.tag_c::after {
	background: #fff;
	border-bottom: 10px solid transparent;
	border-left: 7px solid #0095f5;
	border-top: 10px solid transparent;
	content: '';
	position: absolute;
	right: 0;
	top: 0;
}

.tag_c:hover {
	background-color: #cccccc;
	color: #333333;
}

.tag_c:hover::after {
	border-left-color: #cccccc;
}

a.tag_c:link {
	color: #ffffff;
}

a.tag_c:visited {
	color: #ffffff;
}

.tag_r {
	background: #f49300;
	border-radius: 3px 0 0 3px;
	color: #fff;
	display: inline-block;
	height: 20px;
	line-height: 20px;
	padding: 0 20px 0 23px;
	position: relative;
	margin: 0 10px 10px 0;
	text-decoration: none;
	-webkit-transition: color 0.2s;
}

.tag_r::before {
	background: #fff;
	border-radius: 10px;
	box-shadow: inset 0 1px rgba(0, 0, 0, 0.25);
	content: '';
	height: 6px;
	left: 10px;
	position: absolute;
	width: 6px;
	top: 7px;
}

.tag_r::after {
	background: #fff;
	border-bottom: 10px solid transparent;
	border-left: 7px solid #f49300;
	border-top: 10px solid transparent;
	content: '';
	position: absolute;
	right: 0;
	top: 0;
}

.tag_r:hover {
	background-color: #cccccc;
	color: #333333;
}

.tag_r:hover::after {
	border-left-color: #cccccc;
}

a.tag_r:link {
	color: #ffffff;
}

a.tag_r:visited {
	color: #ffffff;
}

.tag_t {
	background: #a41837;
	border-radius: 3px 0 0 3px;
	color: #fff;
	display: inline-block;
	height: 20px;
	line-height: 20px;
	padding: 0 20px 0 23px;
	position: relative;
	margin: 0 10px 10px 0;
	text-decoration: none;
	-webkit-transition: color 0.2s;
}

.tag_t::before {
	background: #fff;
	border-radius: 10px;
	box-shadow: inset 0 1px rgba(0, 0, 0, 0.25);
	content: '';
	height: 6px;
	left: 10px;
	position: absolute;
	width: 6px;
	top: 7px;
}

.tag_t::after {
	background: #fff;
	border-bottom: 10px solid transparent;
	border-left: 7px solid #a41837;
	border-top: 10px solid transparent;
	content: '';
	position: absolute;
	right: 0;
	top: 0;
}

.tag_t:hover {
	background-color: #cccccc;
	color: #333333;
}

.tag_t:hover::after {
	border-left-color: #cccccc;
}

a.tag_t:link {
	color: #ffffff;
}

a.tag_t:visited {
	color: #ffffff;
}

.tag_b {
	background: #999999;
	border-radius: 3px 0 0 3px;
	color: #fff;
	display: inline-block;
	height: 20px;
	line-height: 20px;
	padding: 0 20px 0 23px;
	position: relative;
	margin: 0 0 10px 0;
	text-decoration: none;
	-webkit-transition: color 0.2s;
}

.tag_b::before {
	background: #fff;
	border-radius: 10px;
	box-shadow: inset 0 1px rgba(0, 0, 0, 0.25);
	content: '';
	height: 6px;
	left: 10px;
	position: absolute;
	width: 6px;
	top: 7px;
}

.tag_b::after {
	background: #fff;
	border-bottom: 10px solid transparent;
	border-left: 7px solid #999999;
	border-top: 10px solid transparent;
	content: '';
	position: absolute;
	right: 0;
	top: 0;
}

.tag_b:hover {
	background-color: #eeeeee;
	color: #333333;
}

.tag_b:hover::after {
	border-left-color: #eeeeee;
}

.product_divlist {
	width: 770px;
	height: 200px;
	padding: 5px;
	margin: 5px;
	margin-bottom: 10px;
	vertical-align: top;
	background: #ffffff;
	border: 1px #ffffff solid;
	overflow: hidden;
	box-shadow: 0 1px 2px #c9cccd;
}

.product_divlistright {
	display: inline-block;
	width: 580px;
	height: 160px;
	margin-left: 10px;
}

.product_img {
	width: 175px;
	height: 130px;
	background: #eeeeee;
	vertical-align: top;
	overflow: hidden;
}

.product_img img {
	width: 175px;
	border: 0px;
}

.product_imglist {
	display: inline-block;
	width: 175px;
	height: 230px;
	
	vertical-align: top;
	overflow: hidden;
}

.product_imglist img {
	width: 100%;
	border: 0px;
}

.product_imglist2 {
	display: inline-block;
	width: 160px;
	height: 130px;
	background: #eeeeee;
	vertical-align: top;
	overflow: hidden;
}

.product_imglist2 img {
	width: 160px;
	border: 0px;
}

.product_div_title {
	width: 175px;
	height: 20px;
	line-height: 20px;
	color: #999999;
	text-align: left;
	margin-bottom: 5px;
	overflow: hidden;
}

.product_divlist_title {
	width: 570px;
	line-height: 20px;
	color: #999999;
	text-align: left;
	margin: 5px 0px;
	overflow: hidden;
}

.product_divlist_title .left {
	width: 400px;
	display: inline-block;
	text-align: left;
}

.product_divlist_title .right {
	width: 170px;
	display: inline-block;
	text-align: right;
}

.product_div_item {
	width: 160px;
	height: 20px;
	line-height: 20px;
	color: #999999;
	text-align: left;
	overflow: hidden;
}

.product_divlist_item {
	width: 670px;
	height: 20px;
	line-height: 20px;
	color: #999999;
	text-align: left;
	overflow: hidden;
}

.product_divlist_item .left {
	width: 60%;
	display: inline-block;
	text-align: left;
}

.product_divlist_item .right {
	width: 50%;
	display: inline-block;
	text-align: right;
}

.product_div_tag {
	float: right;
	background: #f49300;
	color: #ffffff;
	padding: 3px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}

.wc_product_divlist {
	width: 770px;
	height: 160px;
	padding: 5px;
	margin: 5px;
	margin-bottom: 10px;
	vertical-align: top;
	background: #ffffff;
	border-bottom: 1px #cccccc solid;
	overflow: hidden;
}

.wc_product_divlist_title {
	width: 580px;
	height: 20px;
	line-height: 20px;
	color: #999999;
	text-align: left;
	margin: 5px 0px;
	overflow: hidden;
}

.wc_product_divlistright {
	display: inline-block;
	width: 580px;
	height: 160px;
	margin-left: 10px;
}

.wc_product_divlist_item {
	width: 580px;
	height: 20px;
	line-height: 20px;
	color: #999999;
	text-align: left;
	overflow: hidden;
}

.wc_product_divlist_head {
	display: inline-block;
	width: 580px;
	height: 70px;
	padding-top: 10px;
	text-align: left;
	overflow: hidden;
}

.wc_product_divlist_account {
	display: inline-block;
	height: 70px;
	padding-left: 10px;
	vertical-align: top;
	line-height: 28px;
}

.wc_product_divlist_agree {
	display: inline-block;
	margin-left: 40px;
	height: 40px;
	padding-left: 10px;
	vertical-align: top;
	line-height: 28px;
}
p{color: white;}
.updown{display: none;}
th{border: red solid 2px; padding:5px 10px; border-bottom-color:lightgray;color:white;}
		td{border: lightgray solid 2px; padding:5px 10px;}
		
		table{box-shadow: gray 1px 1px 3px; padding:2px 5px; background-color: black;color:white;text-align: center;}		
		table{border-collapse: collapse;width:85%;margin:auto}
		table img{width:48px;vertical-align: middle;}
	.stockShortage{box-shadow:red 0 0 3px;border: darkred 1px solid;padding-left: 2px}
	.table01 .tr01:hover {
			background-color: white;
			color: black;					
		}		
</style>


 <script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="js/IndexJs.js"></script>
<script type="text/javascript" src="fancybox/jquery.fancybox.js"></script>
<script type="text/javascript">
function getProductJSP(PrductId){
		
	//同步請求
	<%--location.href="<%=request.getContextPath()%>/buyIn.jsp?buyInId="+PrductId;--%>
	//非同步GET請求
	$.ajax({
		
		url:"/CB/member/mychange/QA_ajax.jsp?buyInId="+PrductId,
		meth:'GET'	
	
	
	}).done(getProductJSP_DonHadler);
	
}
function getProductJSP_DonHadler( data, textStatus, jqXHR){
	
	
	$("#productDetail").html(data);
	
	//用fancybox來顯示
	$.fancybox.open({
		src  : '#productDetail',
		type : 'inline',
		opts : {
			afterShow : function( instance, current ) {
				console.info( 'done!' );
			}
		}
	});
}

    function product_updown_dmark(){

    	//var nnpage = $('#nnpage').val();
    	///var nnc = $('#nnc').val();
    	//var nnp = $('#nnp').val();
    	//var nnm = $('#nnm').val();
    	//var durl_param = 'page='+nnpage+'&c='+nnc+'&p='+nnp+'&m='+nnm;
    	
    		if(confirm("是否確定物品上架？")){

    			jQuery.ajax({
    				
    				type: "POST",	
    				
    				cache: false,
    				error: function(xhr) {
    				  alert("連線出現問題！請重試！");
    				}
    				
    			});
    		}
    	
    }
     	
	    <% 	if("POST".equalsIgnoreCase(request.getMethod())) { %>
	$(fieldRepopulate); //$() 等同與$(document).ready(...)
	function fieldRepopulate(){					
	//alert('fieldRepopulate');
	$("#productId").val('<%= request.getParameter("productId")%>');
	$("#owner").val('<%= request.getParameter("owner")%>'); 
	$("#updown").val('<%= request.getParameter("updown")%>'); 
}

<%}%>
</script>
<title>上架</title>
</head>


<body  bgproperties=fixed>
<div id="productDetail"> </div>
	<%Customer member=(Customer)session.getAttribute("member");%>
			
			<%//取ProductSelectService
	    		
			OrderService service4 =new OrderService();
	    	List<Order> list4 =service4.getOrderBuyByUserID(member!=null?member.getId():"");
	    	List<Order> list5 =service4.getOrderBuyByOwnerID(member!=null?member.getId():"");
	    	%>
	<h1 style="margin-left: 50px;color: white;">商品動態</h1>
		
	
	    	<% if(list4!=null && list4.size()>0) {%>
			
			
			<% for(int i=0;i<list4.size();i++) {
	    		Order o= list4.get(i);
			%>
	    	<%if(o.getPay_fee()==0){ %>
	    	<table class="table01">
		
			<tr>
				<th>遊戲名稱</th>
				<th>訂單狀態</th>
				<th>運費</th>
				<th>總金額</th>
				<th>建立時間</th>
			</tr>
			
			<tr class="tr01">
				<td><%=o.getProName() %></td>
				<td>對方未發貨</td>
				<td><%=o.getPay()+o.getUse() %></td>
				<td><%=o.getUniprice()+o.getUse()+o.getPay() %></td>			
				<td><%=o.getCreateTime() %></td>
			<tr>
			
			</tr>	
			
		</table><br>
	    	
	    	<%}else{ %>
	    
	    	<%} %>
	    	
	    	<% }%>
	    	<% for(int i=0;i<list4.size();i++) {
	    		Order o= list4.get(i);
			%>
	    	<%if(o.getPay_fee()==4){ %>
	    	<form method="post" action="buyok.do">
	    	<table class="table01">
		
			<tr>
				<th>遊戲名稱</th>
				<th>訂單狀態</th>
				<th>運費</th>
				<th>總金額</th>
				<th>建立時間</th>
				<th>狀態</th>
			</tr>
			
			<tr class="tr01">
				<td><%=o.getProName() %></td>
				<td>對方已發貨<br>
				
							<input id="buyID" name="buyID" type="text" value="<%= o.getId() %>"style="display: none;">
							<input id="yes" name="yes" type="text" value=""style="display: none;">
							<input id="proID" name="proID" type="text" value="<%=o.getProductID()%>"style="display: none;">
							<select id="listrating" name="listrating" required onchange="calculateFee()" style="position: relative;top:0px; left:0px;">  
    						<option value="">請選擇評價</option>
    						<option value=1>很好/very good</option>
    						<option value=2>普通/general</option>
    						<option value=3>很差/very bad</option>
    						</select>	
			
				</td>
				<td><%=o.getPay()+o.getUse() %></td>
				<td><%=o.getUniprice()+o.getUse()+o.getPay() %></td>			
				<td><%=o.getCreateTime() %></td>
				<td><input type="submit"  style="position: relative;top:0px; left:0px;" value="刪除" class="eventbtn" onclick="return(confirm('確認是否刪除?'))">&nbsp;</td>
			<tr>
			
			</tr>	
			
		</table>
		</form><br>
	    	
	    	
	    	<%}else{ %>
	    	
	    	<%} %>
	    	
	    	<% }%>
	    	

	    	<%}else{ %>
		
			<% }%>
	
			
			
			
			
		<% if(list5!=null && list5.size()>0) {%>
			
			
			<% for(int i=0;i<list5.size();i++) {
	    		Order o= list5.get(i);
			%>
	    	<%if(o.getPay_fee()==0){ %>
	    	<table class="table01">
		
			<tr>
				<th>遊戲名稱</th>
				<th>訂單狀態</th>
				<th>運費</th>
				<th>總金額</th>
				<th>建立時間</th>
				<th>狀態</th>
			</tr>
			
			<tr class="tr01">
				<td><%=o.getProName() %></td>
				<td>我未發貨</td>
				<td><%=o.getPay()+o.getUse() %></td>
				<td><%=o.getUniprice()+o.getUse()+o.getPay() %></td>			
				<td><%=o.getCreateTime() %></td>
				<td>
				<form method="post" action="useok.do">
				<input id="buyID" name="buyID" type="text" value="<%= o.getId() %>"style="display: none;">
							<input id="yes" name="yes" type="text" value=""style="display:none ;">
							<input id="proID" name="proID" type="text" value="<%=o.getProductID()%>"style="display: none;">
				<input type="submit"  style="position: relative;top:0px; left:0px;" value="出貨" class="eventbtn" onclick="return(confirm('確認是否出貨?'))">&nbsp;
				</form>
				</td>
			<tr>
			
			</tr>	
			
		</table><br>
	    	
	    	<%}else{ %>
	    
	    	<%} %>
	    	
	    	<% }%>
	    	<% for(int i=0;i<list5.size();i++) {
	    		Order o= list5.get(i);
			%>
	    	<%if(o.getPay_fee()==4){ %>
	    	<table class="table01">
		
			<tr>
				<th>遊戲名稱</th>
				<th>訂單狀態</th>
				<th>運費</th>
				<th>總金額</th>
				<th>建立時間</th>
			</tr>
			
			<tr class="tr01">
				<td><%=o.getProName() %></td>
				<td>已發貨</td>
				<td><%=o.getPay()+o.getUse() %></td>
				<td><%=o.getUniprice()+o.getUse()+o.getPay() %></td>			
				<td><%=o.getCreateTime() %></td>
			<tr>
			
			</tr>	
			
		</table><br>
	    	
	    	
	    	<%}else{ %>
	    	
	    	<%} %>
	    	
	    	<% }%>
	    	

	   
	    	<%}else{ %>
			<p>無商品</p>
			<% }%>
			
			
			
</body>
</html>

