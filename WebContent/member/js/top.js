$(document).ready(init011);
/*alert("test");*/
function init011(){
	
	$(".ch01").click(clickHandler1);
	$(".ch02").click(clickHandler2);
	$(".showin-button").click(inHandler);
	
	$(".remind").click(clickHandlerTEST);
	
}

function clickHandlerTEST(){
	$(".none").stop().slideToggle( 500 );
	
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