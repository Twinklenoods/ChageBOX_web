$(function() {
		    /* 按下GoTop按鈕時的事件 */
		    $('#gotop').click(function(){
		        $('html,body').animate({ scrollTop: 0 }, 'slow');   /* 返回到最頂上 */
		        return false;alert('fieldRepopulate');
		    });
		    
		    /* 偵測卷軸滑動時，往下滑超過400px就讓GoTop按鈕出現 */
		    $(window).scroll(function() {
		        if ( $(this).scrollTop() > 400){
		            $('#gotop').fadeIn(333);
		        } else {
		            $('#gotop').fadeOut('slow');
		        }
		    });
		});
		
$(function() {
		    /* 按下GoTop按鈕時的事件 */
		    $('#tab0,#tab-a, #tab-b').click(function(){
		        $('html,body').animate({ scrollTop: 300 }, 'slow');   /* 返回到最頂上 */
		        
		    });
		});
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