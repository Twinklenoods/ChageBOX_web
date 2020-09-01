<%@page import="uuu.vgb.entity.Question"%>
<%@page import="javafx.scene.control.ListCellBuilder"%>
<%@page import="uuu.vgb.entity.Product"%>
<%@page import="uuu.vgb.entity.Customer"%>
<%@page import="java.util.List"%>
<%@page import="uuu.vgb.service.ProductSelectService"%>
<%@page import="uuu.vgb.service.QuestionService"%>
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
	max-width:800px; 
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

<script type="text/javascript">
function addRmind(){
	
	//1.阻擋form submit送出同步請求
	$.ajax({
		url:$("#QForm").attr("action"),
		method:$("#QForm").attr("method"),
		data:$("#QForm").serialize()
		
	}).done(addRmind_DoneHandler);
	
	
	//2.改用非同步請求...
	return false;
}
function addRmind_DoneHandler(data, status, xhr){
	alert("已送出")
	location.href="";
	//$("").html(data);
}
</script>
</head>
<body>
	<%
			String productId = request.getParameter("buyInId");
			Product product = null;
			Question question = null;
			if(productId!=null){
				ProductSelectService service = new ProductSelectService();
				product = service.getProduct(productId);
			}
		%>	
		<%Customer member=(Customer)session.getAttribute("member");%>
	    	<%
	    		
	    		QuestionService service =new QuestionService();
	    		List<Question> list =service.getQuertionsByProductID(productId);
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
					
				</div>
			</div>
				<%--= QA --%>
	<% if(list!=null && list.size()>0) {%>
	
		
	    <form action="question3.do" id="QForm" onsubmit="return addRmind()" method="post">
		<table class="table01">
			<caption>QA</caption>
			<tr>
			
				<th>暱稱</th>
				<th>QA</th>
				<th>TIME</th>
			</tr>
			<% for(int i=0;i<list.size();i++) {
	    		Question q = list.get(i);
	    	%>
			<tr class="tr01">
			
				<td><%=q.getUser().getName() %></td>
				<td style="width: 50%;"><%=q.getQuestion() %></td>			
				<td><%=q.getCreateTime() %></td>
			<tr>
			<%} %>
				<td colspan="3">
				<% if(member == null){ %><a href="<%=request.getContextPath() %>">需登入才能提出問題喔!!</a>
				<%}else{ %>
				<input style="display: none;" type="text" name="user" value="<%=member.getId()%>">
				<input style="display: none;" type="text" name="productId" value="<%=productId %>">
				<textarea style="width: 100%;height:100px;" required="required" name="question" id="question" rows="5" cols="50" class="ap_area_w500_h80" placeholder="想提出的問題 最多250個字" maxlength="500"></textarea>
				<input type="submit" name="submit" value="送出">
				<% } %>
				</td>
			</tr>	
			
		</table></form>	
			
	    	
	    	
	    	
	    	<%}else{ %>
	    	  <form action="question3.do" id="QForm" onsubmit="return addRmind()" method="POST">
		<table class="table01">
			<caption>QA</caption>
			<tr>
			
				<th>暱稱</th>
				<th>QA</th>
				<th>TIME</th>
			</tr>
			
			<tr class="tr01">
				
				<td></td>
				<td style="width: 50%;">還沒有人提出問題喔!!</td>			
				<td></td>
			<tr>
				
				<td colspan="3">
				<% if(member == null){ %><a href="<%=request.getContextPath() %>">需登入才能提出問題喔!!</a>
				<%}else{ %>
				<input style="display: none;" type="text" name="user" value="<%=member.getId()%>">
				<input style="display: none;" type="text" name="productId" value="<%=productId %>">
				<textarea style="width: 100%;height:100px;" required="required" name="question" id="question" rows="5" cols="50" class="ap_area_w500_h80" placeholder="想提出的問題 最多250個字" maxlength="500"></textarea>
				<input type="submit" name="submit" value="送出">
				</td><% } %> 
		
				
			</tr>	
			
		</table></form>	
	    	<% }%>
			
			<%}else{ %>
			<p>查無此編號(#<%= productId %>)的產品</p>
			<% } %>
		</div>
	
</body>
</html>