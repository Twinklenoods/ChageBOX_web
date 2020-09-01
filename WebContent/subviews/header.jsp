<%@page import="uuu.vgb.entity.remind"%>
<%@page import="uuu.vgb.service.RemindService"%>
<%@page import="uuu.vgb.entity.ShoppingCart"%>
<%@page import="sun.security.util.Length"%>
<%@page import="uuu.vgb.entity.Product"%>
<%@page import="uuu.vgb.service.ProductSelectService"%>
<%@page import="uuu.vgb.entity.Customer" %>
<%@page errorPage="error.jsp"  %>
<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8"%>
<header>
	    	<%ShoppingCart cart = (ShoppingCart)session.getAttribute("cart") ;%>
	    		<ul>
					<li><a href="/CB"><img style="width: 100%;" src="image/yellow/home.png" title="home"></a></li>
					<li>
					<form style="position: relative;top:-10px;" action="<%= request.getContextPath() %>/buy.jsp">
					<input type="search" name="search" placeholder="請輸入關鍵字..." style="width: 120px;height: 30px;">
					<input type="submit" value=""  style="background-image:url(image/yellow/3-1.png);width:30px;height:30px;background-size: 100%;position: relative;top:10px;border: none;">
					</form>
					</li>
					<li class="li-01"><%Customer member=(Customer)session.getAttribute("member");%>
 					<%= member!=null?member.getName():""%>
 					<% if(member == null){ %><a href="<%=request.getContextPath() %>">Login</a>
 					 <%}else{ %>
 					 <a href="<%=request.getContextPath() %>/logout.do">Logout</a>
 					 <% } %> </li>
 					 <li><a href="<%= request.getContextPath() %>/member/cart.jsp"><img style="width: 45px;" id="cart" src="image/yellow/cart.png" title="購物車"></a>
 					 <%if (cart!=null&&cart.size()>0){ %><%=cart.size() %><%}else{ %><% }%>
 					 </li>
					  <% RemindService service2 =new RemindService();
 						RemindService service3 =new RemindService();
		    		if(member != null){
 					 List<remind> list2 =service2.getRemind(member.getId());
 					 List<remind> list3 =service3.getRemindQ(member.getId());%>
 				
 					 <%if (list2!=null){ %>
       						 <a class="remind"><img style="width: 30px;margin-top: 10px;" id="remind" src="image/yellow/remind.png" title="提醒"><%=(list2.size())+(list3.size())%></a>
       						 <li class="none">
      						 <% for(int i=0;i<list2.size();i++){
       							 remind r = list2.get(i);
       							
      						 %>
       						<form id="RmindForm" action="look.do" method="post" onsubmit="return addRmind()">
       						<div><%=r.getOwner().getName() %>給你一則悄悄話</div><br>
       						
       						
       						<input type="text" name="RemindId" style="display: none;" value="<%=r.getRemindId()%>">
       						<input type="submit" style="" value="確認已讀" onclick="javascript:window.location.reload();" >
       						</form>	
       						<% }%>
      						
      						 <% for(int i=0;i<list3.size();i++){
       							 remind r = list3.get(i);
       							
      						 %>
       						<form id="RmindForm" action="look.do" method="post" onsubmit="return addRmind()">
       						<div>來自<%=r.getQ_owner().getName() %>一筆新的問答</div><br>
       						
       						
       						<input type="text" name="RemindId" style="display: none;" value="<%=r.getRemindId()%>">
       						<input type="submit" style="" value="確認已讀" onclick="javascript:window.location.reload();" >
       						</form>	
       						<% }%>
      						
      						
      						</li>
     					<%}else{ %>
     
     			 <a class="remind"><img style="width: 30px;margin-top: 10px;" id="remind" src="image/yellow/remind.png" title="提醒">0</a>
     
     			<% }%>
     			
     			 
     				
     				
     				
     				
     				
     				
     				<%}else{ %>
     
     			 <a class="remind"><img style="width: 30px;margin-top: 10px;" id="remind" src="image/yellow/remind.png" title="提醒">0</a>
     
     			<% }%>
					
				</ul>
			</header>
			<script type="text/javascript">
			function addRmind(){
	
	//1.阻擋form submit送出同步請求
	$.ajax({
		url:$("#RmindForm").attr("action"),
		method:$("#RmindForm").attr("method"),
		data:$("#RmindForm").serialize()
		
	}).done(addRmind_DoneHandler);
	
	
	//2.改用非同步請求...
	return false;
}
function addRmind_DoneHandler(data, status, xhr){

	//$("").html(data);
}


</script>