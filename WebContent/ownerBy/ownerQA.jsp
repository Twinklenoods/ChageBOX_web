<%@page import="uuu.vgb.entity.Question"%>
<%@page import="uuu.vgb.service.QuestionService"%>
<%@page import="uuu.vgb.service.OwnerQaService"%>
<%@page import="uuu.vgb.entity.OwnerQa"%>
<%@page import="javafx.scene.control.ListCellBuilder"%>
<%@page import="uuu.vgb.entity.Product"%>
<%@page import="uuu.vgb.entity.Customer"%>
<%@page import="java.util.List"%>
<%@page import="uuu.vgb.service.ProductSelectService"%>
<%@ page   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" >

<title>QAtop</title>

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
  box-shadow: 0 2px 5px 0 rgba(0,0,0,.26);
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
a.tag_c:link { color:#ffffff;}
a.tag_c:visited { color:#ffffff;}


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
a.tag_r:link { color:#ffffff;}
a.tag_r:visited { color:#ffffff;}
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
a.tag_t:link { color:#ffffff;}
a.tag_t:visited { color:#ffffff;}
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

.product_divlist{
	width: 770px;
	height: 160px;
	padding: 5px;
	margin: 5px;
	margin-bottom: 10px;
	vertical-align: top;
	background:#ffffff;
	border: 1px #ffffff solid;
	overflow: hidden;
    box-shadow: 0 1px 2px #c9cccd;
}
.product_divlistright{
	display:inline-block;
	width: 580px;
	height: 160px;
	margin-left:10px; 
}
.product_img{
	width: 175px;
	height: 130px;
	background: #eeeeee;
	vertical-align: top;
	overflow: hidden;
}
.product_img img{
	width:175px;
	border: 0px;
}
.product_imglist{
	display:inline-block;
	width: 175px;
	height: 130px;
	background: #eeeeee;
	vertical-align: top;
	overflow: hidden;
}
.product_imglist img{
	width:175px;
	border: 0px;
}
.product_imglist2{
	display:inline-block;
	width: 160px;
	height: 130px;
	background: #eeeeee;
	vertical-align: top;
	overflow: hidden;
}
.product_imglist2 img{
	width:160px;
	border: 0px;
}
.product_div_title{
	width: 175px;
	height: 20px;
	line-height: 20px;
	color: #999999;
	text-align: left;
	margin-bottom: 5px;
	overflow: hidden;
}
.product_divlist_title{
	width: 570px;
	line-height: 20px;
	color: #999999;
	text-align: left;
	margin: 5px 0px;
	overflow: hidden;
}
.product_divlist_title .left{
	width:400px;
	display:inline-block;
	text-align: left;
}
.product_divlist_title .right{
	width:170px;
	display:inline-block;
	text-align: right;
}
.product_div_item{
	width: 160px;
	height: 20px;
	line-height: 20px;
	color: #999999;
	text-align: left;
	overflow: hidden;
}
.product_divlist_item{
	width: 570px;
	height: 20px;
	line-height: 20px;
	color: #999999;
	text-align: left;
	overflow: hidden;
}
.product_divlist_item .left{
	width:50%;
	display:inline-block;
	text-align: left;
}
.product_divlist_item .right{
	width:50%;
	display:inline-block;
	text-align: right;
}
.product_div_tag{
	float: right;
	background: #f49300;
	color:#ffffff;
	padding:3px;
	-webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
}
.wc_product_divlist{
	width: 770px;
	height: 160px;
	padding: 5px;
	margin: 5px;
	margin-bottom: 10px;
	vertical-align: top;
	background:#ffffff;
	border-bottom: 1px #cccccc solid;
	overflow: hidden;
}
.wc_product_divlist_title{
	width: 580px;
	height: 20px;
	line-height: 20px;
	color: #999999;
	text-align: left;
	margin: 5px 0px;
	overflow: hidden;
}
.wc_product_divlistright{
	display:inline-block;
	width: 580px;
	height: 160px;
	margin-left:10px; 
}
.wc_product_divlist_item{
	width: 580px;
	height: 20px;
	line-height: 20px;
	color: #999999;
	text-align: left;
	overflow: hidden;
}
.wc_product_divlist_head{
	display:inline-block;
	width: 580px;
	height: 70px;
	padding-top:10px;
	text-align: left;
	overflow: hidden;
}
.wc_product_divlist_account{
	display:inline-block;
	height: 70px;
	padding-left:10px;
	vertical-align: top;
	line-height: 28px;
	
}
.wc_product_divlist_agree{
	display:inline-block;
	margin-left:40px;
	height: 40px;
	padding-left:10px;
	vertical-align: top;
	line-height: 28px;
	
}
.madmin_content{
color: white;
}
		th{border: red solid 2px; padding:5px 10px; border-bottom-color:lightgray;color:white;}
		td{border: lightgray solid 2px; padding:5px 10px; border:none;}
		
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
			<%Customer member=(Customer)session.getAttribute("member"); %>
			<%
				if(member!=null){
				String productOwner = request.getParameter("buyIDOwner");
				
				ProductSelectService service =new ProductSelectService();
	    		List<Product> list =service.getUpOwner(productOwner);
				OwnerQaService service2=new OwnerQaService();
				
				List<OwnerQa> list2 =service2.getOwnerID(productOwner,member.getId());
				
	    	%>
	    	
	    	<% if(list!=null && list.size()>0) {%>
	    	
	    	
	    	<nav >
	    	<div class="ownerS">
	    	<% Product c = list.get(0);%>
	    	
	    	</div>
	    	<% if(list!=null && list.size()>0) {%>
	    	<% if(list2!=null && list2.size()>0) {%>
	    	
	    	
	    	
	    	
	    	
	    
		
		
			
		
		<table>
	
			<tr>
				<th>悄悄話</th>
				

			</tr>
			<% for(int i=0;i<list2.size();i++) {
	    		OwnerQa q = list2.get(i);
	    	%>
			<tr>
				<td><p style="text-align:right;margin-bottom:0px; "><%=q.getCustomerId().getName()%>:
				
				<%=q.getOwnerQA()%></p><br>
				<%if(q.getAnswer()!=null){ %>
					<span>
						賣家:<%=q.getAnswer() %>
					</span>
					<% }else{%>
					<span></span>
					<% }%>
				</td>			
				<%} %>
			<tr>
				<td colspan="1">
				<form action="QaInert.do" method="POST"> 
				<textarea style="width: 100%;height:100px;" required="required" name="question" id="question" rows="5" cols="50" class="ap_area_w500_h80" placeholder="想交換的遊戲 最多250個字" maxlength="500"></textarea>
				<input type="text" name="owner" style="display: none;" value="<%=c.getOwner().getId() %>">
				<input type="text" name="user" style="display: none;" value="<%=member.getId()%>">
				<input style="display: none;" type="text" name="remind" value="<%=member.getId()%>">
				
				<input type="submit" name="submit" value="送出">
				</form>
				</td>


			</tr>
		</table>
			
			<% }else{%>
	    	<p>無對話</p>
	    	<%} %>
	    	<%} %>
			<%}else{ %>
	    	<p>查無產品</p>
	    	<% }%>
	    	<%}else{ %>
	    	<p>尚未登入</p>
	    	<% }%>
	    	</nav>
	    	 </div>
</body>
</html>