<%@page import="java.time.LocalDate"%>
<%@page import="uuu.vgb.entity.BloodType"%>
<%@page import="uuu.vgb.entity.Customer"%>
<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1" >
		<link rel="stylesheet" type="text/css" href="../style/vgb.css">
		<title>會員修改</title>
		<style>
			p>label:first-child{width: 3.5em;display:inline-block;}
			#captchaImg{vertical-align: middle;}
			.errors{color:darkred}
		</style>
		<script src="https://code.jquery.com/jquery-3.5.1.js" 
			integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
			crossorigin="anonymous"></script>
		<script>
			function refreshCaptcha(){
				//alert("refreshCaptcha");
				var captchaImg = document.getElementById("captchaImg");
				captchaImg.src = "../images/register_captcha.jpeg?refresh="+new Date();				
			}
			
						
			<%  Customer member = (Customer)session.getAttribute("member");			
				if("POST".equalsIgnoreCase(request.getMethod())) { %>
				$(fieldRepopulate); //$() 等同與$(document).ready(...)
				function fieldRepopulate(){					
					//alert('fieldRepopulate');
					$("#id").val('<%= request.getParameter("id")%>');
					$("#name").val('<%= request.getParameter("name")%>');
					$("#email").val('<%= request.getParameter("email")%>');
					$("#birthday").val('<%= request.getParameter("birthday")%>');
					$("#phone").val('<%= request.getParameter("phone")%>');
					$("#address").text('<%= request.getParameter("address")%>');  //textarea
					
					$("#<%= request.getParameter("gender")%>").prop("checked", true);  //radio
					
					$("#bloodType").val('<%= request.getParameter("bloodType")%>');	
					$("#married").prop("checked", <%= request.getParameter("married")!=null%>); //checkbox
				}
			<%}else if("GET".equalsIgnoreCase(request.getMethod()) && member!=null){				%>
				$(fieldRepopulate); //$() 等同與$(document).ready(...)
				function fieldRepopulate(){					
					//alert('fieldRepopulate');
					$("#id").val('<%= member.getId() %>');
					$("#name").val('<%= member.getName()%>');
					$("#email").val('<%= member.getEmail()%>');
					$("#birthday").val('<%= member.getBirthday()%>');
					$("#phone").val('<%= member.getPhone()%>');
					$("#address").text('<%= member.getAddress()%>');  //textarea
					
					$("#<%= member.getGender()%>").prop("checked", true);  //radio
					
					$("#bloodType").val('<%= member.getBloodType()!=null?member.getBloodType().name():"" %>');	
					$("#married").prop("checked", <%= member.isMarried() %>); //checkbox
				}
			<%}%>
			
		</script>
	</head>
	<body>		
		<header>
			<h1><a href='/vgb'>非常好書</a> 
				<sub>會員修改</sub>
			</h1>
			<hr>						
		</header>
		<article>	
			<%
				List<String> errors = (List<String>)request.getAttribute("errors");			
			%>
			<% if(errors!=null && errors.size()>0){ %>
			<ul class='errors'>
				<% for(int i=0;i<errors.size();i++) {%>
				<li><% out.print(errors.get(i));   %></li>
				<% } %>
			</ul>
			<% } %>
			<form action="register.do" method="POST">
			<p>
				<label>帳號:</label>
				<input id='id' name='id' pattern="[A-Z][12][0-9]{8}" maxlength="10"
					readonly placeholder="請輸入身分證號/Email">
			</p>
			<p>
				<label>姓名:</label>
				<input id='name' name='name' required placeholder="請輸入姓名">
			</p>			
			<p>
				<label>密碼:</label>
				<input type='password' id='pwd1' name="pwd1" placeholder="請輸入新的密碼" required
					minlength="<%= Customer.PWD_MIN_LENGTH %>" 
					maxlength="<%= Customer.PWD_MAX_LENGTH %>">
			</p>
			<p>
				<label>確認:</label>
				<input type='password' name="pwd2" placeholder="再輸入一次密碼" required
					minlength="<%= Customer.PWD_MIN_LENGTH %>" 
					maxlength="<%= Customer.PWD_MAX_LENGTH %>">
			</p>
			<p>
				<label>email:</label>
				<input type='email' id='email' name="email" placeholder="請輸入email" required>
			</p>
			<p>
				<label>生日:</label>
				<input type='date' id='birthday' name="birthday" required
					max='<%= LocalDate.now().plusYears(-20) %>'>
			</p>			
						
			<p>
				<label>性別:</label>
				<input type='radio' id="<%=Customer.MALE%>"  name="gender" value='<%=Customer.MALE%>' required><label>男</label>
				<input type='radio' id="<%=Customer.FEMALE%>" name="gender" value='<%=Customer.FEMALE%>' required><label>女</label>
			</p>	
			<p>
				<label>電話:</label>
				<input type='tel' id='phone' name="phone">
			</p>			
			<p>
				<label>地址:</label>
				<textarea id="address" name="address" style='vertical-align: middle'></textarea>
			</p>
			<p>
				<label>血型:</label>
				<select id="bloodType" name="bloodType">
					<option value="">請選擇...</option>
					<% for(int i=0;i<BloodType.values().length;i++){ %>
						<option value='<%= BloodType.values()[i].name() %>'><%= BloodType.values()[i]%></option>
					<% } %>					
				</select>, 
				<input type='checkbox' id='married' name="married">
				<label>已婚</label>				
			</p>	
			<!-- TODO: 補上驗證碼 -->
			<p>
				<label>驗證碼:</label>
				<input type='text' name="captcha" placeholder="請依據右圖輸入驗證碼" required>
				<img id="captchaImg" src="../images/register_captcha.jpeg" onclick="refreshCaptcha()"
					alt="驗證碼" title="點選即可更新驗證碼">
			</p>				
			<input type="submit" value='修改'>
		</form>
	</article>
	</body>
</html>