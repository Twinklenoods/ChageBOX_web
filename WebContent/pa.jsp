<%@page import="uuu.vgb.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
<title>排行榜</title>
<meta name="viewport" content="width=device-width, user-scalable=no">
<LINK href="css/IndexDivBG.css" rel="stylesheet" type="text/css">
<style>
	.header2{
		display:none;
		background: url("image/psd/bg03.png") center top no-repeat;
		position: fixed;
		background-size: 100% 100%;
		width: 100%;
		height: 100px;
		margin:about;
		z-index:99;
	}
	.footer2{
	display: none;
	background:url("image/testbg/pa.png") center top no-repeat ,	
				url("image/testbg/foot.png") center top no-repeat;
		top:250px;position:relative;
		background-size: 100%;
		width: 100%;
		height: 770px;
	}
	 .article-02{
		flex-grow:2;
		height: 2250px;
	 }
	 .article-02 img{
	 width: 900px;
	 }
	 .nav-01{
	 flex-grow:1;
	 width: 400px;
	 }
	 .div-01{
	 min-width:1000px;
	 }
	.divBG2{display: none;
	background: url("image/testbg/01.png") left top no-repeat,
			url("image/testbg/02.png") right top no-repeat,
			url("image/testbg/0.png") center top no-repeat ;
	color: white;
	width:100%;		
	height: 2950px;
	position: absolute;
	}
	.divBG{ min-width:1100px;
	}
	
	footer{
	background: url("image/testbg/pa.png") center top no-repeat,
	url("image/testbg/foot.png") center top no-repeat;
	top:-770px;position:relative;
		background-size: 100%;
		width: 100%;
		height: 700px;
	}
	.article-02 p{
	max-width: 900px; 
	}
	@media screen and (max-width: 450px){
	nav{display: none;}
	.header2{display: block;}
	header{display:none;}
	.footer2{display: block;}
	footer{display: none;}
	article{width: 410px;}
	.article-02 img{width: 400px;}
	.article-02 p{width: 400px; }
	 .div-01{
	 min-width:410px;
	 }
	.divBG{ min-width:420px;
	}
	.divBG2{display: block;}
	}
</style>
<script type="text/javascript" src="jquery.js"></script>
			<script type="text/javascript" src="js/IndexJs.js">
			</script><script type="text/javascript">
	
			</script> 
</head>
<body>
    <div class="divBG2" style="height: 4000px;"></div>
    <div class="divBG" style="height: 4000px;">
 		<a href="#" id="gotop" title="Go To Top" data-tracking="nav,jump,top">
   			<i class="gototop"></i></a>	
	    <header style="min-width: 1000px;">  
		    <ul>
					<li><a href="/CB">Home</a></li>
					<li><a href=#>Products</a></li>
					<li><a href=#>Service</a></li>
					
				</ul><li class="li-01">
					
					<%Customer member=(Customer)session.getAttribute("member");%>
 					<%= member!=null?member.getName():""%>
 					<% if(member == null){ %><a href="<%=request.getContextPath() %>">會員登入</a>
 					 <%}else{ %>
 					 <a href="<%=request.getContextPath() %>/logout.do">登出</a>
 					 <% } %>
 					 </li>
		</header>
	  	<div class="header2"> <ul>
				<ul>
					<li><a href="/CB">Home</a></li>
					<li><a href=#>Products</a></li>
					<li><a href=#>Service</a></li>
					
				</ul><li class="li-01">
					
					<%member=(Customer)session.getAttribute("member");%>
 					<%= member!=null?member.getName():""%>
 					<% if(member == null){ %><a href="<%=request.getContextPath() %>">會員登入</a>
 					 <%}else{ %>
 					 <a href="<%=request.getContextPath() %>/logout.do">登出</a>
 					 <% } %>
 					 </li></div>
	    <div id="main">
	       	<nav class="nav-01" style="max-width: 450px;">nav</nav>
	        <article class="article-02">
	        <div class="div-01">
	        <p>Top1《對馬戰鬼》（PS4）</p>
	        <img src="image/NewPa/top01.jpg"></img>
	        	<p>由曾打造《惡名昭彰》系列的 Sucker Punch Productions 開發的日本武士開放世界遊戲，以 13 世紀對馬島為舞台，蒙古大軍來襲事件為背景，玩家將扮演大戰中唯一倖存的武士「境井仁」，為了抵抗蒙古大軍，他將化身為令敵人膽戰心驚的「戰鬼」，不擇手段拯救遭受蹂躪的家園與同胞。</p>
	        <P>Top 2《紙片瑪利歐：摺紙國王》（NS Switch）<P>
	        <img src="image/NewPa/top02.jpg"></img>
	        	<p>角色扮演風格的《瑪利歐》回來了，受到碧姬公主邀請參加祭典的瑪利歐卻看到，被變成摺紙的碧姬公主和摺紙「奧利王」。奧利王先把奇諾比奧等人摺成紙片，宣言要把整個世界變成摺紙。瑪利歐和奧利王的妹妹「奧莉維亞」一起在世界到處奔跑，有時會與紙片庫巴軍團合作，爲了阻止奧利王的野心一同前往碧姬公主城堡。</p>
	        <P>Top 3《集合啦！動物森友會》（NS Switch）<P>
	        <img src="image/NewPa/top03.jpg"></img>
	        <p>系列最新作品重新詮釋動物之森的體驗方式，玩家參加「無人島移居計畫」，在以無人島為背景的遊戲中展開全新的生活。可以悠閒地在海邊漫步、四處探索，在什麼都沒有的無人島展開自由自在的生活。另外，還有全新改造系統，讓玩家可以 DIY，將島上的材料收集起來，DIY 成家具及生活所需的道具等等。享受園藝、釣魚、島上探索、居家環境佈置、與移居到島上的可愛動物們交流等多項體驗，讓玩家可以一面感受四季變化，一面享受悠閒生活。</p>
	        <P>Top 4《瑪利歐賽車 8 豪華版》（NS Switch）<P>
	        <img src="image/NewPa/top04.jpg"></img>
	        <p>《瑪利歐賽車 8 豪華版》是在 Wii U 主機上推出的《瑪利歐賽車 8》的加強版作品，內容收錄了《瑪利歐賽車 8》發售後推出的全部追加下載項目，並且再追加了新角色、賽道、車種和道具，帶來《瑪利歐賽車》系列最大的遊戲份量。</p>
	        <P>Top 5《健身環大冒險》（NS Switch）<P>
	        <img src="image/NewPa/top05.jpg"></img>
	        <p>任天堂再出搭配體感的新招，遊戲伴隨推出的配件，充滿彈性的「健身環」。透過環內擠壓感測器感應玩家動作，藉由玩家自身的運動在遊戲中打敗怪獸。遊戲內以角色扮演的冒險模式為主，還有額外的健身小遊戲和健身鍛鍊模式。讓玩家在玩遊戲的同時，也能體驗道地的健身運動。</p>
	       </div>
	        </article>
	    </div>
	    <footer style="top: 1150px;min-width: 1000px; ">footer</footer>
	  	<div class="footer2"></div>
	
	</div>
</body>
</html>