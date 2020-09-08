
<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
 

<html>


<head>

<title>a</title>
</head>

<body>
</nav>
<body background="test-1.jpg" bgproperties=fixed>
<div class="madmin_content">
	<form name="fm_chall" action="e1515_myproduct_processall.php"
		method="POST" onsubmit="return chkchoice()" >
		<div style="height: 30px; width: 100%; border-bottom: 1px #cccccc solid; margin-bottom: 3px; text-align: left;">
			<a href='QAll.jsp'target="b"><input type="button" value="商品狀態" class="adminbtn active"> </a>

			<a href='Qunuse.jsp'target="b"><input type="button" value="待發貨" class="adminbtn active"> </a>
			<a href='Quse.jsp'target="b"><input type="button" value="已發貨" class="adminbtn active"> </a>
			<a href='Qlist.jsp'target="b"><input type="button" value="已評價" class="adminbtn active"> </a>
			<a href='https://www.hct.com.tw/Search/SearchGoods_n.aspx'target="b"><input type="button" value="查詢單號" class="adminbtn active"> </a>
		</div>
		</form>
</div>
</body>
</html>
