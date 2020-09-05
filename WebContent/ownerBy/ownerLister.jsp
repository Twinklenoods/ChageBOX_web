
<%@page import="uuu.vgb.entity.Customer"%>
<%@page import="uuu.vgb.entity.Product"%>
<%@page import="uuu.vgb.service.ProductSelectService"%>
<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8"%>
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
</style>
</head>
<body>


			<% 
			Customer member=(Customer)session.getAttribute("member");
			ProductSelectService service =new ProductSelectService();
			List<Product> list =service.getlistrating(member!=null?member.getId():"",1);
			List<Product> list2 =service.getlistrating(member!=null?member.getId():"",2);
			List<Product> list3 =service.getlistrating(member!=null?member.getId():"",3);
			%>
			

		<div class="breadcrumb">
		
		</div>
		<div class="madmin_content">
			<div style="height: 30px; width: 100%; border-bottom: 1px #cccccc solid; margin-bottom: 3px; text-align: left;">
				<input type="button" value="評價" class="adminbtn">				
			</div>
			
			
		
			<% if(list!=null && list.size()>0) {%>
			<img src="../image/listrating/S.png" border=0 width=48>良好&nbsp;<%=list.size() %>
			<%}else{ %>
			<img src="../image/listrating/S.png" border=0 width=48>良好&nbsp;0
			<% }%>
			
			<% if(list!=null && list3.size()>0) {%>
			<img src="../image/listrating/N.png" border=0 width=48>普通&nbsp;<%=list2.size() %>
			
			
			<%}else{ %>
			<img src="../image/listrating/N.png" border=0 width=48>普通&nbsp;0
			<% }%>
			
			<% if(list!=null && list3.size()>0) {%>
			<img src="../image/listrating/A.png" border=0 width=48>濫倒不行&nbsp;<%=list3.size() %>
			
			<%}else{ %>
			<img src="../image/listrating/A.png" border=0 width=48>濫倒不行&nbsp;0
			<% }%>
			<%for(int i=0;i<list.size();i++){ 
			Product p =new Product();
			%>
			<br><br>有人覺得你這件商品還不錯!!<br>
			<%}%>
			<%for(int i=0;i<list2.size();i++){ 
			Product p =new Product();
			%>
			<br><br>有人覺得你這件商品還可以!!<br>
			<%}%>
			<%for(int i=0;i<list3.size();i++){ 
			Product p =new Product();
			%>
			<br><br>有人覺得你這件商品爛到不行!!<br>
			<%}%>
			<br>總筆數：<%=list.size()+list2.size()+list3.size() %>
			
		
			<div>	
			</div>
			
			
				
				
				
				
				
			
			
			
		</div>
		<div>
			<input type="hidden" id="c" value="trade">
		</div>
	
	</div>
</body>
</html>