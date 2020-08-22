<%@page import="uuu.vgb.service.ProductService"%>
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
<LINK href="../css/IndexDivBG.css" rel="stylesheet" type="text/css">
<LINK href="../css/product.css" rel="stylesheet" type="text/css">
<style>
.article-3{
color: white;
}

</style>
<title>產品修改</title>
<script type="text/javascript" src="../jquery.js"></script>
<script type="text/javascript" src="../js/IndexJs.js"></script>
<script type="text/javascript" src="../js/product.js"></script>
<script>
<%  String productId = request.getParameter("downIn");
	Product product = null;	

	if("POST".equalsIgnoreCase(request.getMethod())) { %>
	$(fieldRepopulate); //$() 等同與$(document).ready(...)
	function fieldRepopulate(){					
	//alert('fieldRepopulate');
	$("#productId").val('<%= request.getParameter("productId")%>');
	$("#mySelect").val('<%= request.getParameter("host")%>');
	$("#change").val('<%= request.getParameter("change")%>');
	$("#buy").val('<%= request.getParameter("buy")%>');
	$("#name").val('<%= request.getParameter("name")%>');
	$("#comment1").val('<%= request.getParameter("comment1")%>'); 
	$("#fileInput").val('<%= request.getParameter("img")%>'); 
	$("#origin").val('<%= request.getParameter("origin")%>'); 
	$("#BuyPrice").val('<%= request.getParameter("BuyPrice")%>'); 
	$("#WantChange").val('<%= request.getParameter("WantChange")%>'); 
	$("#owner").val('<%= request.getParameter("owner")%>'); 
	
	
	
	
	
	

}

<%}%>

			</script>
</head>

<body>
	<%
			
			if(productId!=null){
				ProductSelectService service = new ProductSelectService();
				product = service.getProduct(productId);
			}
		%>	
	    	

			<article class="article-3">
			<% if(product!=null) {%>
			<nav class="n02"><form autocomplete="off" method="post" action="changeProduct.do">
     			<article class="article-1"><br>
        			<span class="formSpan1">
        			<span style="color:red">*</span>
        			<label for="mySelect">物品分類:</label>
       				<select id="mySelect" required name="host">
        				<optgroup label="主機平台" >
	   						<option value="Switch">Switch</option>
	  						<option value="PS4">PS4</option>
  						</optgroup>
   					</select>
   					<% if (product.getBuy()!=null) {%>
   					<input class="add-attr" type="checkbox" name="buy" id="buy" value="yes" onchange="Show('buy')"checked="checked">買賣
   					<%}else{ %>
   					<input class="add-attr" type="checkbox" name="buy" id="buy" value="yes" onchange="Show('buy')" >買賣
   					<% }%>
   					<% if (product.getChangebox()!=null) {%>
   					<input class="add-attr" type="checkbox" name="change" id="change" value="yes" onchange="Show('change')" checked="checked">交換
					<%}else{ %>
					<input class="add-attr" type="checkbox" name="change" id="change" value="yes" onchange="Show('change')" >交換
					<% }%>
					
					<hr><br><br><br>
					<span style="color:red">*</span>
        			<input type="text" id="name" name="name" autofocus required placeholder="遊戲名稱" value="<%= product.getName() %>"><br><br>
        			<label for="comment1"></label><br>
       				<textarea id="comment1" name="comment1" placeholder="商品敘述 最多100個字" maxlength="100"style="width: 300px;height: 200px;"vlue="<%= product.getDescription() %>"><%= product.getDescription() %></textarea><br>
     				<span style="color:red">*</span>
     				<label for="fileInput">遊戲圖片上傳</label><br>
     				<input type="text" id="status01" name="img" style="display: none;">
     				<input type="file" id="fileInput" value="" accept="image/png,image/jpeg" required>
     				<div id="status"></div>
    				<img id="preview" alt=""style="width:300px; height: 200px;background-color:white;"><br>
    				<label for="origin">物品所在地</label>
    				<select name="origin" id="origin" class="origin" onchange="changeCity(this)">  
    				<option value=""><%=product.getOrigin()%></option>
    				<option value="基隆市">基隆市</option>
    				<option value="臺北市">臺北市</option>
    				<option value="新北市">新北市</option>
    				<option value="宜蘭縣">宜蘭縣</option>
    				<option value="新竹市">新竹市</option>
    				<option value="新竹縣">新竹縣</option>
    				<option value="桃園市">桃園市</option>
    				<option value="苗栗縣">苗栗縣</option>
    				<option value="臺中市">臺中市</option>
    				<option value="彰化縣">彰化縣</option>
    				<option value="南投縣">南投縣</option>
    				<option value="嘉義市">嘉義市</option>
    				<option value="嘉義縣">嘉義縣</option>
    				<option value="雲林縣">雲林縣</option>
    				<option value="臺南市">臺南市</option>
    				<option value="高雄市">高雄市</option>
    				<option value="屏東縣">屏東縣</option>
    				<option value="臺東縣">臺東縣</option>
    				<option value="花蓮縣">花蓮縣</option>
    				<option value="金門縣">金門縣</option>
    				<option value="連江縣">連江縣</option>
    				<option value="澎湖縣">澎湖縣</option>
    				</select><br>
    				
    				<div id="Sbuy" style="display: none;">
					<div class="ap_item_title f14"><span style="color:red">*</span>直購資料（願意買賣才需要填寫）</div>
		  			<input id="BuyPrice" type="text" name="BuyPrice" size="16" class="ap_w150_h30 f12 corner_textbox" placeholder="直購價格" value="<%=product.getUnitPrice() %>">（價格若無特別說明直購價包含運費）
  					</div>
  					<div id="Schange" ><br>想交換物品<br><textarea  required="required" name="WantChange" id="WantChange" rows="5" cols="50" class="ap_area_w500_h80" placeholder="想交換的遊戲 最多100個字" maxlength="100"value="<%=product.getWantChange()%>"><%=product.getWantChange()%></textarea><br></div>
  					<input class="owner" type="text" id="owner" name="owner" value="<%Customer member=(Customer)session.getAttribute("member");%><%= member!=null?member.getId():""%>">
  					<!--  <input class="owner" type="text" id="ownerN" name="ownerN" value="<% member=(Customer)session.getAttribute("member");%>--><%= member!=null?member.getName():""%>">
  					<input class="owner" type="text" id="productId" name="productId" value="<%=product.getId()%>">
  				<input type="submit" id="submit01" onclick="return(confirm('確認是否修改?'))"><label for="submit01" class="myDiv1"></label>
  				</span>
  				
  				
 				
  				
  				</article>
  				</form></nav>
				
			
			<%}else{ %>
			<p>查無此編號(#<%= productId %>)的產品</p>
			<% } %>
		</article>
</body>
</html>