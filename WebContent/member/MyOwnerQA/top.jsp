
<%@page import="uuu.vgb.entity.Customer"%>
<%@page import="uuu.vgb.entity.OwnerQa"%>
<%@page import="uuu.vgb.service.OwnerQaService"%>
<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
 

<html>


<head>

<title>a</title>
</head>

<body>
<%Customer member=(Customer)session.getAttribute("member");%>

<%
	OwnerQaService service =new OwnerQaService();
	List<OwnerQa> list1 =service.getOwnerIdOnly(member!=null?member.getId():""); 		
	List<OwnerQa> list2 =service.getOwnerIdOFF(member!=null?member.getId():""); 	
	List<OwnerQa> list3 =service.getOwnerIdOn(member!=null?member.getId():""); 	
%>


<div class="madmin_content">
		<% if(list1!=null &&list2!=null  && list3!=null ) {%>
	<form name="fm_chall" action="e1515_myproduct_processall.php"
		method="POST" onsubmit="return chkchoice()" >
		<div style="height: 30px; width: 100%; border-bottom: 1px #cccccc solid; margin-bottom: 3px; text-align: left;">
			<a href='all.jsp'target="b"><input type="button" value="所有(<%=list1.size()%>)" class="adminbtn active"> </a>
			<a href='off.jsp'target="b"><input type="button" value="未回答(<%=list2.size()%>)" class="adminbtn active"> </a>
			<a href='on.jsp'target="b"><input type="button" value="已回答(<%=list3.size()%>)" class="adminbtn active"> </a>
		</div>
	</form>
	<%}%>
	
</div>
</body>
</html>
