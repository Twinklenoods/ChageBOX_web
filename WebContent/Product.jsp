<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<LINK href="css/IndexDivBG.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, user-scalable=no">
<style>
	
	
	
	#main {
		width:100%;
		max-width:1950px;
		margin: 0px;
		padding: 0px;
		display: flex;
		height:1600px;
	}
	#main > article,#main > nav,#main > aside,footer {
		margin: 0px;
		padding: 0px;
		position:relative;
		top:114px;
		
		
	}
	#main > article {
		
		
		flex-grow: 5;
	}

	#main > nav {
		
		flex-grow: 1;
	}

	#main > aside {
		flex-grow: 1;
	}

	footer{
	background:url("testbg/05.png") center top no-repeat ,	
				url("testbg/foot.png") center top no-repeat;
		position:relative;
		top:1600px;
		background-size: 100%;
		width: 100%;
		height: 770px;
		
		
	}
	
	
	
	.article-1, .article-2{
		max-width: 600px;
		min-width:400px;
		height: 600px;
		
		
	}
	.article-1{
	margin: 0px 0px 0 0;
	position: relative;
	
	
	}
	
	.article-2{
	position: relative;
	left:10%;
	
	
	}
	
	
 	header ul {
	margin: 0px;
	list-style: none;
	width: 280px;
	margin: auto;
	}

	header li {
	float: left;
	padding: 5px 10px;
	border-left: 1px solid white;
	}
	
	a {
	text-decoration: underline;
	text-decoration: overline;
	text-decoration: line-through;
	text-decoration: none;
	}
	a:link {
		color: white;
		
		
	}
	
	a:visited {
		color: white;
	}
	
	a:hover {
		color: red;
	}
	
	a:active {
		color: rgb(195,0,0);
	}
	
	 a.non-action:hover {
	      opacity: 1;
	    }
	
	inputㄝ, select{
	
	 font-size: 18px;
	 margin: 5px;
	}
	    
	 .formSpan1{
	 position: relative;
	 top:150px;
	 left:120px;
	 color:white;
	 }
	 
	  .formSpan2{
	 position: relative;
	 top:90px;
	 left:170px;
	 
	 }
	 #toggle{
	display: none;
	}	
	@media screen and (max-width: 800px){
	
	.formSpan1
	{
	top:10%;
		left:10%;
	}
	 .formSpan2{
	 	
	 	top:9%;
		left:25%;
	}
	 
	
	.article{
	
	}
	.article-1, .article-2{
		position: static;
		 text-align: left;
		}
	.article-2{
		display:;
		position:relative;
	 	top:-200px;
	 	left:-20px;
		}
	#toggle{
	display: block;
	position: relative;
	top:310px;
	left:455px;
	}	
		#main{
			flex-direction: column;
			
		}
		#main > aside {
			display:none;
		}
		#main > nav {
			display:none;
		}
		
	}
	
	
	@media screen and (min-width: 1200px){
	.article-1, .article-2{
		display: block;
		}
	.article-1{
		display: block;
		}
		}
	
	#tabs{
	padding:0;
	margin:0;
	
	
}

	#tabs li{
	list-style:none;
	float:left;
	margin-right:5px;
	}
	#comment1, #comment2{
	width: 300px;
	height: 200px;
	}
	
	#status{
			padding:5px;
			font:14px/1.5 Arial, Helvetica, sans-serif;
		}
		#preview{
			wight:200px;
			height:200px;
			background:Black;
			padding:10px;
			border:1px solid #333;
			display:none;
		}

</style>
 <script type="text/javascript" src="jquery.js"></script>
		<script type="text/javascript">
		var file = undefined;
	    var reader = undefined;
	    $(document).ready(init);
	    function init(){	
			file = $("#fileInput")[0];
			$("#fileInput").change(fileChangeHandler);
			reader = new FileReader();
			$(reader).on("load",loadendHandler);
	    }
	    
	    /*window.onresize = function(){
		if(document.body.offsetWidth >600){
			console.log('YORK');
		}else{
			console.log('seed');
		}
	}
	var file = undefined;
    var reader = undefined;
    $(document).ready(init);
    function init(){	
		file = $("#fileInput")[0];
		$("#fileInput").change(fileChangeHandler);
		reader = new FileReader();
		$(reader).on("load",loadendHandler);
    }*/
	    
	    function fileChangeHandler(){
			
			if( file.files.length > 0 ){
				var selectedFile = file.files[0];
				
				reader.readAsDataURL(selectedFile);
			}else{
				$("#status").html("No file selected!");
			}
	    }
	    
	    function loadendHandler(){
	       	$("#preview").attr("src",reader.result);
	    	$("#preview").fadeIn(500);
	    }
	    
	   /*show buy*/ 
	    function Show(which){
	    	if(which=='change'){
	    	 	if(document.getElementById("change").checked ==true){
	    			document.getElementById("Schange").style.display = "block";
	    			$('#WantChange').attr("required", "true");
	    		}else{
	    			document.getElementById("Schange").style.display = "none";
	    			$('#WantChange').removeAttr("required");
	    		} 
	    	}
	    	if(which=='buy'){
	    	 	if(document.getElementById("buy").checked ==true){
	    			document.getElementById("Sbuy").style.display = "block";
	    			$('#BuyPrice').attr("required", "true");
	    		}else{
	    			document.getElementById("Sbuy").style.display = "none";
	    			$('#BuyPrice').removeAttr("required");
	    		} 
	    	}

	    }
	    
	   
		</script>
</head>
<body>
    <div class="divBG">
    <header>header中文
    <ul>
		<li><a href="/CB">Home</a></li>
		<li><a href=#>Products</a></li>
		<li><a href=#>Service</a></li>
		<li id="lastLi"><a href=#>Support</a></li>
	</ul>
    </header>
    <div id="main">
        <nav>nav<br>
         			物品分類<br>
					買賣 <br>
					 交換<br>
					物品名稱<br>
					圖片上傳<br>
					物品詳細<br>
					物品所在地<br>
					想交換物品<br>
					直購價格<br>
        </nav>
        <article>  
			<form autocomplete="off">
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
   					<input class="add-attr" type="checkbox" name="buy" id="buy" value="yes" onchange="Show('buy')">買賣
   					
					<input class="add-attr" type="checkbox" name="change" id="change" value="yes" onchange="Show('change')" checked="checked">交換
					<hr><br><br><br>
					<span style="color:red">*</span>
        			<input type="text" id="name" name="name" autofocus required placeholder="遊戲名稱"><br><br>
        			<label for="comment1"></label><br>
       				<textarea id="comment1" name="comment1" placeholder="商品敘述 最多100個字" maxlength="100"></textarea><br>
     				<span style="color:red">*</span>
     				<label for="fileInput">遊戲圖片上傳</label><br>
     				<input type="file" id="fileInput" value="" name="img" accept="image/png,image/jpeg" required>
     				<div id="status"></div>
    				<img id="preview" alt=""><br>
    				<label for="origin">物品所在地</label>
    				<select name="origin" id="origin" class="origin" onchange="changeCity(this)">  
    				<option value="">請選擇</option>
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
		  			<input id="BuyPrice" type="text" name="BuyPrice" size="16" class="ap_w150_h30 f12 corner_textbox" value="" placeholder="直購價格">（價格若無特別說明直購價包含運費）
  					</div>
  					<div id="Schange" ><br>想交換物品<br><textarea  required="required" name="WantChange" id="WantChange" rows="5" cols="50" class="ap_area_w500_h80" placeholder="想交換的遊戲 最多100個字" maxlength="100"></textarea><br></div>
  				<input type="submit" id="submit01" ><label for="submit01" class="myDiv1"></label>
  				</span>
  				</article>
  				</form>
        	</article>
        	</div>
        <aside>aside</aside>
    </div>
    <footer>footer</footer>
    
</body>
</html>
