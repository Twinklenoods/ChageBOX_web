$(document).ready(init7);
/*alert("test");*/
function init7(){
	
	$(".ch01").click(clickHandler1);
	$(".ch02").click(clickHandler2);
	$(".showin-button").click(inHandler);
	
}


function clickHandler1(){
	$(".table01").stop().slideToggle( 500 );

	}
function clickHandler2(){
	$(".table02").stop().slideToggle( 500 );
	}
function inHandler() {
	var op = $('.block').css('left');

    if (op == '-550px')
    	$(".block").animate({left:"0px"},500);

    else if(op == '0px')
    	$(".block").animate({left:"-550px"},500);        

}

var rector =3;
var stopit = 0;
var a=1;
var zhend;
function init2(which)
{
  stopit =0;
  zhend = which;
  zhend.style.left =0;
  zhend.style.top =0;
}
function rattleimage()
{
  if(stopit==1)
  {
    return;
  }  
  if(a==1)
  {
    zhend.style.top = parseInt(zhend.style.top)+rector+"px";
  }
  else if(a==2)
  {
    zhend.style.left = parseInt(zhend.style.left)+rector+"px";
  }
  else if(a==3)
  {
    zhend.style.top = parseInt(zhend.style.top)-rector+"px";
  }
  else 
  {
    zhend.style.left = parseInt(zhend.style.left)-rector+"px";
  }
  if(a<4)a++;  else a =1;
  setTimeout("rattleimage()",500);
}

function stoprattle(which)
{
  stopit = 1;
  which.style.left =0;  
  which.style.top =0;    
}

var file = undefined;
var reader = undefined;
$(document).ready(init21);
function init21(){	
	file = $("#fileInput")[0];
	$("#fileInput").change(fileChangeHandler);
	$("#fileInput").on(fileChangeHandler);
	reader = new FileReader();
	$(reader).on("load",loadendHandler);
}



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
	$("#status01").attr("value",reader.result);
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