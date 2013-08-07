// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require_tree .
function menus(str){ 
	var obj; 
	// 返回 str 对象和 picId 对象是否存在 
	if (document.getElementById(str)){ 
		var strs = new Array("menu1_2", "menu1_3", "menu1_4", "menu1_5", "menu1_6", "menu1_7", "menu1_8");
		for (var i=0; i<strs.length; i++)
		{
			if (str != strs[i])
			{
				obj=document.getElementById(strs[i]); 
				obj.style.display = "none";
			}
		}
		obj=document.getElementById(str); //obj 为 DIV 对象 
		
		if (obj.style.display == "none"){ //如果DIV对象的 display 样式值为 none 的话 
			obj.style.display = ""; //就将 display 的样式清空 
			//pic.src = "0001.jpg"; //更改图片对象的路径 
		}
		else{ 
			obj.style.display = "none"; 
			//pic.src = "0000.jpg"; 
		} 
	} 
} 


 
function login(id){
	var $ID=function (id){		
        var d=document.getElementById(id);
        if(!d){
			//alert(id+" control object not exists!") ;
        	return false;
    	}else{
        	return d;
    	}
	}
	var $this = $ID("a1");
	$ID("a3").onmousedown=function (e) {
	    var oe=e||window.event;
	    var startX = oe.clientX - $this.offsetLeft;
	    var startY = oe.clientY - $this.offsetTop;
	    document.onmousemove = function (e) {
	        var oe = e || window.event;
	        $this.style.left = oe.clientX - startX + "px";
	        $this.style.top = oe.clientY - startY + "px";
	    };
        document.onmouseup = function () {
            document.onmousemove = null;
            document.onmouseup = null;
            if ($this.releaseCapture) {
                $this.releaseCapture();
            }
        };
        if ($this.setCapture)$this.setCapture();
        return false;
	}
    if(id==1){
        $ID('a1').style.display='block';
		$ID('a2').style.display='block';
    }else{
    	if( id == 2){
    		$ID('a5').style.display='block';
        	$ID('a6').style.display='block';
    	}
    	else
    	{
    		$ID('a1').style.display='none';
       		$ID('a2').style.display='none';
       		$ID('a5').style.display='none';
       		$ID('a6').style.display='none';
       		$ID('a7').style.display='none';
       		$ID('a8').style.display='none';
    	}
        
    }
}

/* ---------------------------------------------------------------------------------
 * CUSTOM JS
 * --------------------------------------------------------------------------------*/
jQuery(document).ready(function ($) {


        /* NAVIGATION
         * --------------------------------------------------------------------------------*/

        /** Nav Dropdown **/
        $('ul.main-navigation li').children('ul.sub-nav').hide();
        $('ul.main-navigation li ').hover(

        function () {
                $(this).children('ul.sub-nav').stop(true, true).fadeIn({
                        duration: 400,
                        easing: 'easeInSine'
                });
        },

        function () {
                $(this).children('ul.sub-nav').stop(true, true).fadeOut({
                        duration: 400,
                        easing: 'easeOutSine'
                });
        });

        /** Subnav Drop **/
        $('ul.sub-nav li').children('ul.sub-sub-nav').hide();
        $('ul.sub-nav li').hover(

        function () {
                $(this).children('ul.sub-sub-nav').stop(true, true).fadeIn({
                        duration: 400,
                        easing: 'easeInSine'
                });
        },

        function () {
                $(this).children('ul.sub-sub-nav').stop(true, true).fadeOut({
                        duration: 400,
                        easing: 'easeOutSine'
                });
        });

        /** Stay Active Until Sub Nav Active **/
        $('ul.main-navigation li ul').hover(

        function () {
                $(this).parent('li').children('a').addClass('active');
        },

        function () {
                $(this).parent('li').children('a').removeClass('active');
        });

        /** Navigation Background **/
        $('ul.sub-nav li, ul.sub-sub-nav li').hover(

        function () {
                $(this).children('a').stop(true, true).animate({
                        backgroundColor: '#322e39'
                })
        },

        function () {
                $(this).children('a').stop(true, true).animate({
                        backgroundColor: '#fe8a02'
                });
        });

        /** Responsive Nav **/
        $(".responsive-menu select").change(function () {
                window.location = $(this).find("option:selected").val();
        });


        /* NOTIFICATION
         * --------------------------------------------------------------------------------*/

        $('.notification-button a').hover(

        function () {
                $(this).stop(true, true).animate({
                        backgroundColor: '#fe8a02'
                })
        },

        function () {
                $(this).stop(true, true).animate({
                        backgroundColor: '#322e39'
                })
        });

        // If you wanna make notification bar opened simply comment this two lines
        $('.notification').hide();
        $('.notification-button a').text(';');

        // Trigger open/close notification bar on click
        $('.notification-button a').click(function () {
                $('.notification').slideToggle();
                $(this).text($(this).text() == ':' ? ';' : ':'); // <- HERE
                return false;
        });

        /* MAIN SLIDER
         * --------------------------------------------------------------------------------*/

        $("#slider3").responsiveSlides({
                auto: true,
                pager: true,
                nav: true,
                timeout: 6000,
                speed: 800
        });
		
		/* PORTFOLIO SLIDER
         * --------------------------------------------------------------------------------*/

        $("#slider2").responsiveSlides({
                auto: true,
                pager: false,
                nav: true,
                timeout: 6000,
                speed: 800
        });

        $('a.rslides_nav.prev, a.rslides_nav.next').fadeTo('fast', 0.2);
        $('a.rslides_nav.prev, a.rslides_nav.next').hover(

        function () {
                $(this).stop(true, true).fadeTo('slow', 1);
        },

        function () {
                $(this).stop(true, true).fadeTo('slow', 0.2);
        });

        /* FEATURED ICON
         * --------------------------------------------------------------------------------*/
        $('.featured-icon a').hover(

        function () {
                $(this).stop(true, true).animate({
                        color: '#fe8a02'
                })
        },

        function () {
                $(this).stop(true, true).animate({
                        color: '#c2c2c2'
                })
        });

        /* OVERLAY
         * --------------------------------------------------------------------------------*/
        $('.overlay').fadeTo('fast', 0);
        $('.image, .image a, .image img, .overlay a').hover(

        function () {
                $(this).children('.overlay').stop(true, true).fadeTo('slow', 1);
        },

        function () {
                $(this).children('.overlay').stop(true, true).fadeTo('slow', 0);
        });

        $('.overlay a').hover(

        function () {
                $(this).stop(true, true).animate({
                        backgroundColor: '#fe8a02'
                })
        },

        function () {
                $(this).stop(true, true).animate({
                        backgroundColor: '#322e39'
                })
        });

        /* PRETTY PHOTO
         * --------------------------------------------------------------------------------*/

        $("a[rel^='prettyPhoto']").prettyPhoto({
                "theme": 'light_square' /* light_rounded / dark_rounded / light_square / dark_square */
        });

        /* BUTTONS
         * --------------------------------------------------------------------------------*/
        $('a.button').hover(

        function () {
                $(this).stop(true, true).animate({
                        backgroundColor: '#322e39'
                })
        },

        function () {
                $(this).stop(true, true).animate({
                        backgroundColor: '#fe8a02'
                })
        });

        /* TWEET
         * --------------------------------------------------------------------------------*/

        $(".tweet").tweet({ // twitter container
                username: "pebasdesign", // twitter username
                join_text: "", // text of joining, empty fior this theme
                avatar_size: 40, // 0 avatarsize (no avatar) for this theme
                count: 1, // how many tweets will show
                loading_text: "<h3>Please wait, tweets still loading...</h3>", // message for loading tweets
                refresh_interval: 60000, // refresh rate, how much often tweets udate
                template: "{text}{time}" // template, show text and time of tweets
        });

        /* SOCIAL ICONS
         * --------------------------------------------------------------------------------*/

        $('ul.social-icons li a.icon.social').hover(function () {
                $(this).stop(true, true).addClass('active', 600);
        },

        function () {
                $(this).stop(true, true).removeClass('active', 600);
        });

        /* SCROLL TO TOP
         * --------------------------------------------------------------------------------*/

        $('.scrollup').hover(function () {
                $(this).stop(true, true).animate({
                        background: '-21px 21px'
                })
        },

        function () {
                $(this).stop(true, true).animate({
                        background: '0px 0px'
                })
        });

        $(window).scroll(function () {
                if ($(this).scrollTop() > 100) {
                        $('.scrollup').fadeIn();
                }
                else {
                        $('.scrollup').fadeOut();
                }
        });

        $('.scrollup').click(function () {
                $("html, body").animate({
                        scrollTop: 0
                }, 600);
                return false;
        });

        /* --------------------------------------------------------------------------
         * OUR TEAM
         * ------*/

        $('span.team-button').hover(function () {
                $(this).stop(true, true).animate({
                        backgroundColor: '#322e39'
                })
        },

        function () {
                $(this).stop(true, true).animate({
                        backgroundColor: '#fe8a02'
                })
        });

        $('.team-content').hide();
        $('span.team-button').text(':');
        $('span.team-button').click(function () {
                $(this).parent('.image-holder').children('img, .team-content').stop(true, true).slideToggle({
                        duration: 600,
                        easing: 'linear'
                });
                $(this).parent('.image-holder').children('span.team-button').text($(this).text() == ':' ? ';' : ':');
        });

        /* --------------------------------------------------------------------------
         * CLIENTS
         * ------*/

        $('ul.clients li > a > img').adipoli({
                'imageOpacity': '.6',
                'startEffect': 'grayscale',
                'hoverEffect': 'normal',
        });

        $('ul.similar-projects li > a > img').adipoli({
                'imageOpacity': '.6',
                'startEffect': 'grayscale',
                'hoverEffect': 'normal',
        });

        $('.tab-post-image img').adipoli({
                'animSpeed': '200',
                'imageOpacity': '.8',
                'startEffect': 'grayscale',
                'hoverEffect': 'boxRainGrowReverse'
        });

        /* --------------------------------------------------------------------------
         * PROGRESS BAR
         * ------*/
        $('.my-progress-bar').simpleProgressBar({});
		

        /* RECENT WORKS
         * --------------------------------------------------------------------------------*/
        $('.flexslider').flexslider({
                animation: "fade",
                controlNav: false,
                directionNav: true,
                slideshow: false,
                startAt: 0,
                prevText: "(",
                nextText: ")",
                animationLoop: false,
                slideshowSpeed: 6000
        });


        /* PORTFOLIO
         * --------------------------------------------------------------------------------*/

        var $container = $('.portfolio');
        $container.isotope({
                itemSelector: '.item',
                animationEngine: 'jquery',
                animationOptions: {
                        duration: 400,
                        easing: 'linear',
                }
        });


        $('.filter a').click(function () {
                var selector = $(this).attr('data-filter');
                var $this = $(this);
                // don't proceed if already selected
                if ($this.hasClass('selected')) {
                        return;
                }

                var $optionSet = $this.parents('.filter');
                // change selected class
                $optionSet.find('.selected').removeClass('selected');
                $this.addClass('selected');

                $container.isotope({
                        filter: selector
                });
                return false;
        });

        /* CATEGORIES
         * --------------------------------------------------------------------------------*/

        $('.categories ul li').hover(
		function () {
                $(this).children('span').stop(true, true).animate({
                        'margin-right': '25px',
                        duration: 400,
                        easing: 'easeOutSine',
                        color: '#322e39'
                })
        },

        function () {
                $(this).children('span').stop(true, true).animate({
                        'margin-right': '0px',
                        duration: 400,
                        easing: 'easeOutSine',
                        color: '#c8c8c8'
                })
        });

        /* ACCORDION
         * --------------------------------------------------------------------------------*/

        var $container_accordion = $('.accordion > div'),
                $trigger = $('.accordion > h6');
        $container_accordion.hide();
        $trigger.first().addClass('active').next().show();
        $trigger.on('click', function (e) {
                if ($(this).next().is(':hidden')) {
                        $trigger.removeClass('active').next().slideUp(300);
                        $(this).toggleClass('active').next().slideDown(300);
                }
                e.preventDefault();
        });

        /* TABS
         * --------------------------------------------------------------------------------*/
        $('.tab-filter').each(function () {
                var $active, $content, $links = $(this).find('a');
                $active = $links.first().addClass('active');
                $content = $($active.attr('href'));
                $links.not(':first').each(function () {
                        $($(this).attr('href')).hide();
                });
                $(this).on('click', 'a', function (e) {
                        $active.removeClass('active');
                        $content.hide();
                        $active = $(this);
                        $content = $($(this).attr('href'));
                        $active.addClass('active');
                        $content.show();
                        e.preventDefault();
                });
        });


        $('.tags-widget ul li a').hover(function () {
                $(this).stop(true, true).animate({
                        'backgroundColor': '#322e39',
                        duration: 400,
                        easing: 'easeOutSine'
                })
        },

        function () {
                $(this).stop(true, true).animate({
                        'backgroundColor': '#fe8a02',
                        duration: 400,
                        easing: 'easeOutSine'
                })
        });
		
		/* MAP
         * --------------------------------------------------------------------------------*/
        $('.map').gmap3({
                action: 'addMarker',
                address: "Serbia, Novi Sad, Turgenjeva 4",
                map: {
                        mapTypeControl: false,
                        panControl: false,
                        zoomControl: true,
                        scaleControl: false,
                        center: true,
                        zoom: 14,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                }
        });

        /* --------------------------------------------------------------------------
         * TOOLTIPS
         * -------------*/
        $(function () {
                        $('a[rel=tipsy]').tipsy({
                                fade: true,
                                gravity: 's'
                        });
                });
				

        /* PRICE TABLE BUTTON
         * --------------------------------------------------------------------------------*/
        $('.pricing-table ul li:last-child a').hover(function () {
                $(this).stop(true, true).animate({
                        backgroundColor: '#fe8a02'
                })
        },

        function () {
                $(this).stop(true, true).animate({
                        backgroundColor: '#322e39'
                })
        });

        /* FORMS
         * --------------------------------------------------------------------------------*/

        $('form.newsletter-form a.submit, form.search-form a.submit').hover(function () {
                $(this).stop(true, true).animate({
                        backgroundColor: '#322e39'
                })
        },

        function () {
                $(this).stop(true, true).animate({
                        backgroundColor: '#fe8a02'
                })
        });

        /*--------- Set Submit Button ------*/
        $("a[name=submit]").click(function () {
                $(this).parents("form").submit();
        });

        /*--------- Set Empty Fields On Click ------*/
        $('.textarea').val("Your message...");
        $('.comment-form textarea').val("Your comment...");
        $('input, .textarea, .textarea_comment').each(function () {
                var default_value = this.value;
                $(this).focus(function () {
                        if (this.value == default_value) {
                                this.value = '';
                        }
                });
                $(this).blur(function () {
                        if (this.value == '') {
                                this.value = default_value;
                        }
                });
        });

        /*--------- Set Neccessary Methods For JQ Validate ------*/
        jQuery.validator.addMethod("notEqual", function (value, element, param) {
                return this.optional(element) || value != param;
        }, "Please choose a value!");

        jQuery.validator.setDefaults({
                errorPlacement: function (error, element) {
                        error.appendTo($(
                        $(element).val().errorLabel));
                }
        });

        $("form.newsletter-form").validate({
                debug: false,
                email: {
                        required: true,
                        email: true
                },

                submitHandler: function (form) {
                        $.post('php/process_newsletter.php', $("form.newsletter-form").serialize(), function (data) {
                                $("form.newsletter-form").fadeOut(), $('.success-message.news-success').fadeIn({
                                        duration: 800,
                                        easing: 'easeInOutExpo'
                                }).html(data);
                        });
                }
        });

        /*--------- Contact Form ------*/

        $("form.contact_form").validate({
                debug: false,
                rules: {

                        name: {
                                minlength: 2,
                                maxlength: 15,
                                notEqual: "Your name...",
                                required: true,
                        },


                        email: {
                                required: true,
                                email: true
                        },

                        subject: {
                                minlength: 3,
                                notEqual: "Please type subject...",
                                required: true,
                        },

                        message: {
                                minlength: 5,
                                notEqual: "Your message...",
                                required: true,
                        },

                },

                submitHandler: function (form) {

                        $.post('php/process_contact.php', $("form.contact_form").serialize(), function (data) {
                                $("form.contact_form").fadeOut(), $('.success-message').fadeIn({
                                        duration: 800,
                                        easing: 'easeInOutExpo'
                                }).html(data);
                        });
                }
        });

        /*--------- Comment Form ------*/

        $("form.comment-form").validate({
                debug: false,
                rules: {

                        name: {
                                minlength: 2,
                                maxlength: 15,
                                notEqual: "Your name...",
                                required: true,
                        },


                        email: {
                                required: true,
                                email: true
                        },

                        message: {
                                minlength: 5,
                                notEqual: "Your comment...",
                                required: true,
                        },

                },

                submitHandler: function (form) {

                        $.post('php/process_comment.php', $("form.comment-form").serialize(), function (data) {
                                $("form.comment-form").fadeOut(), $('.success-message').fadeIn({
                                        duration: 800,
                                        easing: 'easeInOutExpo'
                                }).html(data);
                        });
                }
        });

        /* --------------------------------------------------------------------------------
END OF CUSTOM JS */
});

/*! http://responsiveslides.com v1.32 by @viljamis */
(function(d,D,v){d.fn.responsiveSlides=function(h){var b=d.extend({auto:!0,speed:1E3,timeout:4E3,pager:!1,nav:!1,random:!1,pause:!1,pauseControls:!1,prevText:"(",nextText:")",maxwidth:"",controls:"",namespace:"rslides",before:function(){},after:function(){}},h);return this.each(function(){v++;var e=d(this),n,p,i,k,l,m=0,f=e.children(),w=f.size(),q=parseFloat(b.speed),x=parseFloat(b.timeout),r=parseFloat(b.maxwidth),c=b.namespace,g=c+v,y=c+"_nav "+g+"_nav",s=c+"_here",j=g+"_on",z=g+"_s",
o=d("<ul class='"+c+"_tabs "+g+"_tabs' />"),A={"float":"left",position:"relative"},E={"float":"none",position:"absolute"},t=function(a){b.before();f.stop().fadeOut(q,function(){d(this).removeClass(j).css(E)}).eq(a).fadeIn(q,function(){d(this).addClass(j).css(A);b.after();m=a})};b.random&&(f.sort(function(){return Math.round(Math.random())-0.5}),e.empty().append(f));f.each(function(a){this.id=z+a});e.addClass(c+" "+g);h&&h.maxwidth&&e.css("max-width",r);f.hide().eq(0).addClass(j).css(A).show();if(1<
f.size()){if(x<q+100)return;if(b.pager){var u=[];f.each(function(a){a=a+1;u=u+("<li><a href='#' class='"+z+a+"'>"+a+"</a></li>")});o.append(u);l=o.find("a");h.controls?d(b.controls).append(o):e.after(o);n=function(a){l.closest("li").removeClass(s).eq(a).addClass(s)}}b.auto&&(p=function(){k=setInterval(function(){f.stop(true,true);var a=m+1<w?m+1:0;b.pager&&n(a);t(a)},x)},p());i=function(){if(b.auto){clearInterval(k);p()}};b.pause&&e.hover(function(){clearInterval(k)},function(){i()});b.pager&&(l.bind("click",
function(a){a.preventDefault();b.pauseControls||i();a=l.index(this);if(!(m===a||d("."+j+":animated").length)){n(a);t(a)}}).eq(0).closest("li").addClass(s),b.pauseControls&&l.hover(function(){clearInterval(k)},function(){i()}));if(b.nav){c="<a href='#' class='"+y+" prev'>"+b.prevText+"</a><a href='#' class='"+y+" next'>"+b.nextText+"</a>";h.controls?d(b.controls).append(c):e.before(c);var c=d("."+g+"_nav"),B=d("."+g+"_nav.prev");c.bind("click",function(a){a.preventDefault();if(!d("."+j+":animated").length){var c=
f.index(d("."+j)),a=c-1,c=c+1<w?m+1:0;t(d(this)[0]===B[0]?a:c);b.pager&&n(d(this)[0]===B[0]?a:c);b.pauseControls||i()}});b.pauseControls&&c.hover(function(){clearInterval(k)},function(){i()})}}if("undefined"===typeof document.body.style.maxWidth&&h.maxwidth){var C=function(){e.css("width","100%");e.width()>r&&e.css("width",r)};C();d(D).bind("resize",function(){C()})}})}})(jQuery,this,0);