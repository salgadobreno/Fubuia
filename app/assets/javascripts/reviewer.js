/* 
Reviewer JS by Jake Caputo / DesignCrumbs.com

<![CDATA[  */
var J = jQuery.noConflict();
J(document).ready(function() {
	
	// Childen Flyout on Menu
	function mainmenu() {
		J("#pagemenu ul li ul, #category_menu ul li ul").css({
			display: "none"
		}); // Opera Fix
		J("#pagemenu ul li, #category_menu ul li").hover(function() {
			J(this).find('ul:first').css({
				visibility: "visible",
				display: "none"
			}).show(300);
		}, function() {
			J(this).find('ul:first').css({
				visibility: "hidden"
			});
		});
	}
	
	J(document).ready(function() {
		mainmenu();
	});
	
	// Animates the soc nets on hover
	J("#socnets").delegate("img", "mouseover mouseout", function(e) {
		if (e.type == 'mouseover') {
			J("#socnets a img").not(this).dequeue().animate({
				opacity: "0.3"
			}, 300);
		} else {
			J("#socnets a img").not(this).dequeue().animate({
				opacity: "1"
			}, 300);
		}
	});
	
	// Animates the Sticky Posters on Hover
	J(function() {
		J('.featured_post').hover(function() {
			J(this).find('img.featured_poster').animate({
				top: '-9px'
			}, {
				queue: false,
				duration: 200
			});
			J(this).find('.contest').animate({
				top: '7px'
			}, {
				queue: false,
				duration: 200
			});
			
		}, function() {
			J(this).find('img.featured_poster').animate({
				top: '9px'
			}, {
				queue: false,
				duration: 400
			});
			J(this).find('.contest').animate({
				top: '25px'
			}, {
				queue: false,
				duration: 400
			});
		});
	});
	
	// Index poster hovers
	J(document).ready(function() {
		J('.poster_info_wrap').hover(function() {
			J(this).children('.description').stop().fadeTo(200, .9);
		}, function() {
			J(this).children('.description').stop().fadeTo(200, 0);
		});
	});
});
/* ]]> */