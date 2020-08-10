
<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>

<head>
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

</style>
<script type="text/javascript" src="jquery.js"></script>
</script><script type="text/javascript">
function product_updown_dmark(param_pid,p_type,p_pdivid){

	var nnpage = $('#nnpage').val();
	var nnc = $('#nnc').val();
	var nnp = $('#nnp').val();
	var nnm = $('#nnm').val();
	var durl_param = 'page='+nnpage+'&c='+nnc+'&p='+nnp+'&m='+nnm;
	if(p_type==1 && param_pid!=''){
		if(confirm("是否確定物品上架？")){

			jQuery.ajax({
				url: 'e1515'+'_myproduct_process'+'.p'+'hp',
				type: "POST",	
				data: 'pid=' + param_pid + '&ptype='+p_type,
				cache: false,
				error: function(xhr) {
				  alert("連線出現問題！請重試！");
				},
				success: function(response) {
					if(response.trim()=='upactionok'){
					  	jQuery('#'+p_pdivid).hide();
					  	location.href='ListMemberProduct?'+durl_param;
				  	}
				}
			});
		}
	}
	if(p_type==2 && param_pid!=''){
		if(confirm("是否確定物品下架？")){

			jQuery.ajax({
				url: 'e1515'+'_myproduct_process'+'.p'+'hp',
				type: "POST",	
				data: 'pid=' + param_pid + '&ptype='+p_type,
				cache: false,
				error: function(xhr) {
				  alert("連線出現問題！請重試！");
				},
				success: function(response) {
					if(response.trim()=='downactionok'){
				  		jQuery('#'+p_pdivid).hide();
				  		location.href='ListMemberProduct?'+durl_param;
				  	}
				}
			});
		}
	}
	if(p_type==3 && param_pid!=''){
		if(confirm("是否確定刪除物品？")){

			jQuery.ajax({
				url: 'e1515'+'_myproduct_process'+'.p'+'hp',
				type: "POST",	
				data: 'pid=' + param_pid + '&ptype='+p_type,
				cache: false,
				error: function(xhr) {
				  alert("連線出現問題！請重試！");
				},
				success: function(response) {
					if(response.trim()=='delactionok'){
				  		jQuery('#'+p_pdivid).hide();
				  		location.href='ListMemberProduct?'+durl_param;
				  	}
				}
			});
		}
	}	
}
function load_talk_content(param_otid,param_cnew)
{
	jQuery.ajax({
		url: 'e1515'+'_load_talkconversation'+'.p'+'hp',
		type: "POST",	
		data: 'otid=' + param_otid,
		cache: false,
		error: function(xhr) {
		  alert("載入失敗！請重試！");
		},
		success: function(response) {
			if(response.substr(0,9)=='blacklist'){
				response = response.substr(9);
				$('#talk_postareadiv').hide();
				$('#talk_blacklist_area').html('你在對方的黑名單中，無法發出悄悄話！');
				$('#talk_blacklist_area').show();
			}else if(response.substr(0,11)=='toblacklist'){
				response = response.substr(11);
				$('#talk_postareadiv').hide();
				$('#talk_blacklist_area').html('對方已在你的黑名單中，無法發出悄悄話！');
				$('#talk_blacklist_area').show();
			}else{
				$('#talk_postareadiv').show();
				$('#talk_blacklist_area').hide();
			}
		  	$('#talk_convcontent').html(response);
		  	$('#sot_mid').val(param_otid);
		 	$('#talk_contentdiv').stop().animate({
			  scrollTop: $('#talk_contentdiv')[0].scrollHeight
			}, 800);
			if(param_cnew!=0){
				var total = parseInt($('.accordion-header .newnum_tip').html(),10);
        if( !isNaN(total) ){
          total -= param_cnew;
          if(total == 0){
				$('.accordion-header .newnum_tip').html('0');
				$('.accordion-header .newnum_tip').hide();
          }else{
				$('.accordion-header .newnum_tip').html(total);
          }
        }
				$('#newnum_tip_'+param_cnew).html('0');
				$('#newnum_tip_'+param_cnew).hide();
			}
		}
	});
}
function sentmessage(){
	var postmsg = $('#postmsg').val();
	var sot_mid = $('#sot_mid').val();
	if(postmsg.trim()!='' && sot_mid!=''){

		jQuery.ajax({
			url: 'e1515'+'_addmessage'+'.p'+'hp',
			type: "POST",	
			data: 'oid=' + sot_mid + '&msg='+postmsg,
			cache: false,
			error: function(xhr) {
			  alert("連線出現問題！請重試！");
			},
			success: function(response) {
				if(response.trim()!=''){//sendmessageok
					$('#postmsg').val('');
					load_talk_content(sot_mid);
					$('#talk_contentdiv').stop().animate({
					  scrollTop: $('#talk_contentdiv')[0].scrollHeight
					}, 800);
				}
			}
		});


	}
	
}
function remove_myblack(reparam_id){
	if(confirm("確定刪除這個黑名單？")){
		location.href="e1515_remove_myblack.php?bid="+reparam_id;
	}
}
function remove_myfavority(reparam_id){
	if(confirm("確定刪除這個追蹤？")){
		location.href="e1515_remove_myfavority.php?fid="+reparam_id;
	}
}
function agree_friend(param_wid,type_param){
	if(type_param==1){
		if(confirm("確定同意對方加好友的請求？")){
			location.href="e1515_agree_myfriend.php?wid="+param_wid+'&t='+type_param;
		}
	}
	if(type_param==2){
		if(confirm("確定取消這個好友？")){
			location.href="e1515_agree_myfriend.php?wid="+param_wid+'&t='+type_param;
		}
	}
	if(type_param==3){
		if(confirm("確定刪除這個好友？")){
			location.href="e1515_agree_myfriend.php?wid="+param_wid+'&t='+type_param;
		}
	}	
}

function ValueChange(){
	same(0)	
}
function same(ID){	
	var tt=document.fm_adprod.ScrapValue.value
	tt=tt-ID
	//alert(tt)
	if (tt<0) tt=0
	document.fm_adprod.HopeValue.value=tt
}
function Show(which){
	if(which=='change'){
	 	if(document.getElementById("change").checked ==true){
			document.getElementById("Schange").style.display = "block";
			document.getElementById("Schange2").style.display = "block"; 
		}else{
			document.getElementById("Schange").style.display = "none";
			document.getElementById("Schange2").style.display = "none";
		} 
	}
	if(which=='buy'){
	 	if(document.getElementById("buy").checked ==true){
			document.getElementById("Sbuy").style.display = "block";
		}else{
			document.getElementById("Sbuy").style.display = "none";
		} 
	}
	if(which=='rent'){
	 	if(document.getElementById("rent").checked ==true){
			document.getElementById("Srent").style.display = "block";
		}else{
			document.getElementById("Srent").style.display = "none";
		} 
	}
	
}
function product_edit(pid_param){
	if(pid_param!=''){
		location.href="EditProduct.php?pid="+pid_param;
	}
}
function chkaddwish(){
	if(document.fm_adprod.SubCat.value.length==0 )
    {
	alert("請選擇物品分類！");
	return false;
    }
    if(document.fm_adprod.ProductName.value.length==0 )
    {
	alert("想要的物品名稱需輸入！");
	return false;
    }

	if(confirm("確定送出？")) return true;
	
	return false;

}
function del_wish(wid_param){
	if(wid_param!=''){
		if(confirm("確定刪除這筆許願資料？")){
			location.href="e1515_remove_mywish?wid="+wid_param;
		}
	}

}
function get_mylocky(){
	jQuery.ajax({
		url: 'e1515'+'_get_lottery'+'.p'+'hp',
		type: "POST",	
		data: 't=xn',
		cache: false,
		error: function(xhr) {
		  alert("連線出現問題！請重試！");
		},
		success: function(response) {
			var obj = jQuery.parseJSON(response);
		  	if(obj.err!="ok" && obj.err!=""){
		  		alert(obj.err);
		  	}
		  	if(obj.err=="ok"){
		  		alert('您今日抽到'+obj.pchid+'點！加油！！');
		  		if(obj.pchid>80 ){
		  			$('#show_lresult').html('您今日抽到'+obj.pchid+'點！很旺喔！');
		  		}
		  		if(obj.pchid>50 && obj.pchid<=80){
		  			$('#show_lresult').html('您今日抽到'+obj.pchid+'點！手氣不錯喔！');
		  		}
		  		if(obj.pchid<=50 && obj.pchid>10){
		  			$('#show_lresult').html('您今日抽到'+obj.pchid+'點！還不賴嘛！');
		  		}
		  		if(obj.pchid<=10 ){
		  			$('#show_lresult').html('您今日抽到'+obj.pchid+'點！別氣餒，明日還有機會！');
		  		}

		  	}
		}
	});
}
function pstsend(dtype){
	var channel_param = $('#c').val();
	var sid_param = $('#sid').val();
	var s_param = $('#sscdid').val();
	var r_param = $('#rscdid').val();
	if(dtype==1 || dtype==3){
		var ps_param = $('#sps').val();
	}else{
		var ps_param = "";
	}
	jQuery.ajax({
		url: 'e1515'+'_upd_pststatus'+'.p'+'hp',
		type: "POST",	
		data: 'dt=' + dtype + '&sid='+s_param +'&rid='+r_param+'&sps='+ps_param,
		cache: false,
		error: function(xhr) {
		  alert("連線出現問題！請重試！");
		},
		success: function(response) {
			if(dtype==1){
			 if(response.trim()=='updok'){
			 	alert('已更新為寄出！');
			 	location.href="ListTransactionsDetail?c="+channel_param+'&sid='+sid_param;
			 }
			}
			if(dtype==2){
			 if(response.trim()=='updok'){
			 	alert('已更新為收到囉！');
			 	location.href="ListTransactionsDetail?c="+channel_param+'&sid='+sid_param;
			 }
			}
			if(dtype==3){
			 if(response.trim()=='updok'){
			 	alert('已記錄匯款資訊囉！');
			 	location.href="ListTransactionsDetail?c="+channel_param+'&sid='+sid_param;
			 }
			}		
		}
	});


}
function sendcredit(prod_param){
	$('#creditform1').modal();
}
function chkcredit(){
	var channel_param = $('#c').val();
	var sid_param = $('#sid').val();
	var rscdid = $('#rscdid').val();
	var cr_cont = $('#crcontent').val();
	var item = $('input:radio:checked[name="credit"]').val();
	if(cr_cont.trim()==''){
		alert("評價內容還沒有填寫喔！");
		$('#crcontent').focus();
		return false;
	}
	if(item==''){
		alert("評價好壞沒有選到喔！");
		$('#credit').focus();
		return false;
	}	
	if(rscdid!='' && cr_cont.trim()!='' && item!=''){
		if(confirm("確定給予評價？")){

			jQuery.ajax({
				url: '/e1515'+'_addcredit'+'.p'+'hp',
				type: "POST",	
				data: 'sid=' + rscdid+'&cr='+ item +'&rcont='+cr_cont,
				cache: false,
				error: function(xhr) {
				  alert("連線出現問題！請重試！");
				},
				success: function(response) {
					if(response.trim()=='downactionok'){
				  		alert("給予評價成功！");
				  		location.href="ListTransactionsDetail?c="+channel_param+'&sid='+sid_param;
				  	}
				  	if(response.trim()=='acterror'){
					  	alert("操作錯誤！給予評價失敗");
				  	}
				  	$('#crcontent').val('');
				  	$.modal.close();
				}
			});
		}
	}

}
function replycredit(mcid_param,scdid_param){
	$('#mcid').val(mcid_param);
	$('#scdid').val(scdid_param);
	$('#creditform1').modal();
}
function chkreplycredit(){
	var channel_param = $('#c').val();
	var cr_cont = $('#crcontent').val();
	var mcid = $('#mcid').val();
	var scdid = $('#scdid').val();
	if(mcid!='' && scdid!='' && cr_cont.trim()!=''){
		if(confirm("確定回覆評價？")){

			jQuery.ajax({
				url: '/e1515'+'_replycredit'+'.p'+'hp',
				type: "POST",	
				data: 'mid=' + mcid+'&sid='+ scdid +'&rcont='+cr_cont,
				cache: false,
				error: function(xhr) {
				  alert("連線出現問題！請重試！");
				},
				success: function(response) {
					if(response.trim()=='downactionok'){
				  		alert("回覆評價成功！");
				  		location.href="ListRating?c="+channel_param;
				  	}
				  	if(response.trim()=='acterror'){
					  	alert("操作錯誤！回覆評價失敗");
				  	}
				  	$('#crcontent').val('');
				  	$.modal.close();
				}
			});
		}
	}
}
function choiceall_doit(){
	var cha_totnum = $('#cha_num').val();
	if(cha_totnum>0){
		if($('#choiceall').prop("checked")==true){
			for (var i = 1; i <= cha_totnum; i++) {
				$('#choice-'+i).prop('checked', true);
			};
		}else{
			for (var i = 1; i <= cha_totnum; i++) {
				$('#choice-'+i).prop('checked', false);
			};			
		}
	}
}
function chkchoice(){
	var ptype = $('#ptype').val();
	if(ptype=='1' || ptype=='2'){
		var cha_totnum = $('#cha_num').val();
		var have_num =0;
		if(cha_totnum>0){
			for (var i = 1; i <= cha_totnum; i++) {
				if($('#choice-'+i).prop("checked")==true){
					have_num++;
				}
			};
		}
		if(have_num>0){
			return true;
		}else{
			return false;
		}
	}else{
		return false;
	}
}
function product_updown_dmark_all(p_type){
	if(p_type==1 || p_type==2){
		var cha_totnum = $('#cha_num').val();
		var have_num =0;
		if(cha_totnum>0){
			for (var i = 1; i <= cha_totnum; i++) {
				if($('#choice-'+i).prop("checked")==true){
					have_num++;
				}

			};
		}
		if(have_num>0){
			$('#ptype').val(p_type);
			document.fm_chall.submit();
		}
	}

}
</script>
<title>新網頁</title>
</head>
<div class="madmin_content">
	<form name="fm_chall" action="e1515_myproduct_processall.php"
		method="POST" onsubmit="return chkchoice()">
		<div
			style="height: 30px; width: 100%; border-bottom: 1px #cccccc solid; margin-bottom: 3px; text-align: left;">
			<input type="button" value="所有" class="adminbtn active"
				onclick="location.href='ListMemberProduct'"> <input
				type="button" value="交換" class="adminbtn"
				onclick="location.href='ListMemberProduct?c=change'"> <input
				type="button" value="買賣" class="adminbtn"
				onclick="location.href='ListMemberProduct?c=trade'"> <input
				type="button" value="租賃" class="adminbtn"
				onclick="location.href='ListMemberProduct?c=rent'">
		</div>
		<div
			style="height: 30px; width: 100%; margin-bottom: 10px; text-align: right;">
			<input type="button" value="未上架 (0)" class="adminbtn2"
				onclick="location.href='index.jsp'"> <input
				type="button" value="已上架 (0)" class="adminbtn2"
				onclick="location.href='ListMemberProduct?p=y'"> <input
				type="button" value="已成交 (0)" class="adminbtn2"
				onclick="location.href='ListMemberProduct?m=y'">
		</div>
		<div width="50%">
			
		</div>
		
		
		<nav style="text-align: center; clear: both;">
			<ul class="pagination f14">
				<li class="active"><a
					href="ListMemberProduct?page=1&amp;m=&amp;p=&amp;c=&amp;s=">1</a></li>
			</ul>
		</nav>
		<input type="hidden" id="nnpage" name="nnpage" value="1">
		<input type="hidden" id="nnc" name="nnc" value="">
		<input type="hidden" id="nnp" name="nnp" value="">
		<input type="hidden" id="nnm" name="nnm" value="">
		<input type="hidden" id="cha_num" name="cha_num" value="2">
		<input type="hidden" id="ptype" name="ptype" value="">
	</form>
</div>

</body>

</html>
