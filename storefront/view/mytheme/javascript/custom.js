$(window).bind("load", function() {
    $(".se-pre-con").fadeOut("slow");   //by vinacart
    /*$(function () {
            $('#banner_slides').show();

        if($('#banner_slides').oneByOne)
            $('#banner_slides').oneByOne({
                className: 'oneByOneSlide',
                easeType: 'random',
                slideShow: true,
                slideShowDelay: 6000,
                responsive: true
            });
        })*/
});


$('document').ready(function () {
    //====================================== bootstrap ===============================================================
    // Dropdowns
    $('.dropdown').hover(
        function () {
            $(this).addClass('open')
        },
        function () {
            $(this).removeClass('open')
        }
    );
    
    //  2. TOOLTIP
    if($.tooltip) jQuery('[data-toggle="tooltip"]').tooltip();
    if($.tooltip) jQuery('[data-toggle2="tooltip"]').tooltip();

	process_thumbnails();

    //====================================== common (all pages) ===============================================================
   /* ----------------------------------------------------------- */
  /*  10. SCROLL TOP BUTTON
  /* ----------------------------------------------------------- */

  //Check to see if the window is top if not then display button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 50) {
            $('#gotop').fadeIn(500);
        } else {
            $('#gotop').fadeOut(500);
        }
    });
  
    //go to top event
    $("#gotop").click(function () {
        $("html, body").animate({ scrollTop: 0 }, "fast");
        return false;
    });

    $('.top-search .button-in-search').click(function(){
        $('#search_form').submit();
    });

    //====================================== menu ===============================================================
    // Top Main Menu mobile
    $('<select class="form-control" />').appendTo("#topnav");
    var show_text = $("#topnav .sr-only").text();
    $("<option />", {
        "selected": "selected",
        "value": "",
        "text": show_text
    }).appendTo("#topnav select");
    // Populate dropdown with menu items
    $("#topnav a").each(function () {
        var el = $(this);
        $("<option />", {
            "value": el.attr("href"),
            "text": el.text()
        }).appendTo("#topnav select");
    });
    // To make dropdown actually work
    // To make more unobtrusive: http://css-tricks.com/4064-unobtrusive-page-changer/
    $("#topnav select").change(function () {
        window.location = $(this).find("option:selected").val();
    });

    // Category Menu mobile
    $('<select class="form-control" />').appendTo("nav.subnav");
    // Create default option "Go to..."
    $("<option />", {
        "selected": "selected",
        "value": "",
        "text": "Go to..."
    }).appendTo("nav.subnav select");
    // Populate dropdown with menu items
    $("nav.subnav a").each(function () {
        var el = $(this);
        $("<option />", {
            "value": el.attr("href"),
            "text": el.text()
        }).appendTo("nav.subnav select");
    });

    // To make dropdown actually work
    // To make more unobtrusive: http://css-tricks.com/4064-unobtrusive-page-changer/
    $("nav.subnav select").change(function () {
        window.location = $(this).find("option:selected").val();
    });
    
	//show selected category
	$(".subcategories ul li").hover(function () {
		var curr_image = $(this).find('img').clone();
		var parent = $(this).closest('.subcategories').find('.cat_image');
		$(parent).html(curr_image);
		$(parent).find('img').show();
    }, function(){
        // change to parent category
		var parent_image = $(this).closest('.subcategories').find('.parent_cat_image');
		var parent = $(this).closest('.subcategories').find('.cat_image');
		$(parent).html($(parent_image).find('img').clone());
    });
    
    //====================================== category page ===============================================================
    // List & Grid View
    $('#list').click(function () {
        $(this).addClass('btn-orange').children('i').addClass('icon-white');
        $('.grid').fadeOut();
        $('.list').fadeIn();
        $('#grid').removeClass('btn-orange').children('i').removeClass('icon-white');
		
		$(this).closest('li').addClass('active');
		$('#grid').closest('li').removeClass('active');
		window.location.hash = 'list';
    });
    $('#grid').click(function () {
        $(this).addClass('btn-orange').children('i').addClass('icon-white');
        $('.list').fadeOut();
        $('.grid').fadeIn();
        $('#list').removeClass('btn-orange').children('i').removeClass('icon-white');
		
		$(this).closest('li').addClass('active');
		$('#list').closest('li').removeClass('active');
		window.location.hash = 'grid';
    });
	var view_mode = window.location.hash? window.location.hash.replace('#','') : 'grid';
	if(view_mode=='list' || view_mode=='grid') {
		$('#'+ view_mode).click();
	}

    //====================================== product page ===============================================================
    // Prdouctpagetab
    if($.tab) $('#myTab a:first').tab('show');
    $('#myTab a').click(function (e) {
        e.preventDefault();
        $(this).tab('show');
    });

    if(self.document.location.hash=='#review'){
        $('#myTab a:eq(1)').click();
    }

    //====================================== sliders ===============================================================
/*
    // Brand Carousal
    $(window).load(function () {
        $('#brandcarousal').carouFredSel({
            width: '100%',
            scroll: 1,
            auto: false,
            prev: '#prev',
            next: '#next',
            //pagination: "#pager2",
            mousewheel: true,
            swipe: {
                onMouse: true,
                onTouch: true
            }
        });
    });
*/ 

});


//====================================== other sliders ===============================================================   
// Flexsliders	  
$(window).load(function () {
/*
    // Flexslider index banner
    if($.flexslider) 
	$('#mainslider').flexslider({
        animation: "slide",
        start: function (slider) {
            $('body').removeClass('loading');
        }
    });
    // Flexslider side banner
	if($.flexslider) 
    $('#mainsliderside').flexslider({
        animation: "slide",
        start: function (slider) {
            $('body').removeClass('loading');
        }
    });

    // Flexslider Category banner
	if($.flexslider) 
    $('#catergoryslider').flexslider({
        animation: "slide",
        start: function (slider) {
            $('body').removeClass('loading');
        }
    });

    // Flexslider Brand
	if($.flexslider) 
    $('#advertise').flexslider({
        animation: "fade",
        start: function (slider) {
            $('body').removeClass('loading');
        }
    });

    // Flexslider Blog
	if($.flexslider) 
    $('#blogslider').flexslider({
        animation: "fade",
        start: function (slider) {
            $('body').removeClass('loading');
        }
    });

    // Flexslider  Musthave
	if($.flexslider) 
    $('#musthave').flexslider({
        animation: "fade",
        start: function (slider) {
            $('body').removeClass('loading');
        }
    });
*/
    /* ----------------------------------------------------------- */
    /*  TESTIMONIAL SLIDER (SLICK SLIDER)
    /* ----------------------------------------------------------- */
/* @deprecated
    if($().flexslider && $('#testimonial_flex').length) 
    $('#testimonial_flex').flexslider({
        animation: "slide",
        start: function (slider) {
            $('body').removeClass('loading');
        }
    });
*/

/* @deprecated
    if(jQuery().slick && jQuery('#testimonial_slick').length)
    jQuery('#testimonial_slick').slick({
      dots: true,
      infinite: true,
      arrows: false,
      speed: 300,
      slidesToShow: 1,
      adaptiveHeight: true
    });
*/
    //flexslider
    if($().flexslider) {
        $('.vnc_flexslider').each(function(){
            var options = $(this).data('options');
            if(options) options=vnc_parse_json(options);
            else options = {
              animation: "slide"
            };
            options.start=function (slider) {
                $('body').removeClass('loading');
            };

            $(this).flexslider(options);
        });
    }

    //slick slider
    if($().slick) {
        $('.vnc_slider_slick').each(function(){
            var options = $(this).data('options');
            if(options) options=vnc_parse_json(options);
            else options = {
              dots: true,
              infinite: true,
              arrows: false,
              speed: 300,
              slidesToShow: 1,
              adaptiveHeight: true
            };

            $(this).slick(options); //console.log(options);
        });
        
    }
    $('.countbox').each(function() {
		var dstart = $(this).data('date-start'),
			dend = $(this).data('date-end');
		
		if(typeof ClockCountdown=='function') ClockCountdown(dstart, dend, "#"+ $(this).attr('id'));
	});
});
//=================================== functions ==============================================================================
function vnc_parse_json(str) {
    var arr=str.split(','), item, json={}, value;
    for(var i=0;i<arr.length;i++){
        item = arr[i].split(':');
        value = item[1].trim();
        switch(true) {
            //boolean values
            case value=='true':value = true;break;
            case value=='false':value = false;break; 
            case jQuery.isNumeric(value)==true: value=parseFloat(value);
        }
        json[item[0].trim()] = value;
    }
    return json;
}

function process_thumbnails() {
    // Product thumbnails
    $('.thumbnail').each(function () {
        $(this).hover(
            function () {
                $(this).children('.shortlinks').fadeIn()
            },
            function () {
                $(this).children('.shortlinks').fadeOut()
            });
    });
}

//if(typeof openModalRemote!=='function')
function openModalRemote(id, url, loadText, replace, title){
	var modal = $(id);
	var modalBody = $(id +' .modal-body');
	if(modalBody.length==0) modalBody = $(id +' .vnc-modal-body');
    if($(id).find('.vnc-modal-body').length && !_HW.get('quick_view_modal')) {
        _HW.set('quick_view_modal', $(id).clone());
    }
    if(modal.hw_is_ajax_working()) return;
    $('body').css('cursor','wait');
    if(title) modal.find('.vnc-modal-title').html(title);
    if(replace) modal.find('.vnc-modal-title').html('');

	modal.off('show.bs.modal');	//prevent duplicate event
	modal.on('show.bs.modal', function () {
		if(loadText) modalBody.html('loading..');
        
        $.ajax({
            url: url,
            success: function(output) {
                //var modal = $(id);
                modal.hw_reset_ajax_state(true);
                $('body').css('cursor','');

                if(!replace) {
                    if(modalBody.length==0 && _HW.get('quick_view_modal')) {
                      modal.replaceWith(_HW.get('quick_view_modal').attr('id',id.replace('#','') ));
                      modalBody = $(id).find('.vnc-modal-body');//modal.parent().find(id+' .vnc-modal-body');
                    }
                    if(modalBody.length) {
                        //if(title) modal.find('.vnc-modal-title').html(title);
                        //modalBody.html(output);
                        //$(id +' .vnc-modal-body').empty().append(output.trim());
                        modalBody.empty().append(output.trim());
                    }
                    else console.log('Not found modal body: .vnc-modal-body');
                }
                else {
                    var newDlg =$(output.trim()).attr('id', id.replace('#',''));
                    newDlg.attr({'id':'', 'class':''});
                    modal.empty().append(newDlg);    //modal.replaceWith(newDlg);
                    //destroy dialog
                    //modal.data('modal', null).modal( 'hide' ).data( 'bs.modal', null );
                    //modal.attr('id', id.replace('#',''));
                }
                move_form_fields_requirement();
            }
        });
            
	    //modalBody.load(url)
		/*$.ajax({	//do not use this method or with replace option
			url: url,
			success: function(responseText) {
				modalBody.append(responseText);
			}
		}).done(function(){}).error(function(){});*/
	}).modal();
    openModalRemote.currentModal=modal;
}
function closeModalRemote(id) {
  //$.magnificPopup.instance.close();
  if(openModalRemote.currentModal) openModalRemote.currentModal.modal('hide').modal('toggle');
}

//show toast messages
function show_toast(msg) {
    $.toast({ 
      text : msg, 
      showHideTransition : 'slide',  // It can be plain, fade or slide
      //bgColor : 'blue',              // Background color for toast
      //textColor : '#eee',            // text color
      allowToastClose : false,       // Show the close button or not
      hideAfter : 2000,              // `false` to make it sticky or time in miliseconds to hide after
      stack : 10,                     // `fakse` to show one stack at a time count showing the number of toasts that can be shown at once
      textAlign : 'left',            // Alignment of text i.e. left, right, center
      position : 'top-right'
    });
}
//additional by vinacart
//in openModalRemote(), template\form\form.tpl, pages\product\product.tpl
function move_form_fields_requirement(form) {
    if(!form) form = $('form');
    $(form).each(function() {
        $(this).find('.input-group-addon,span.required').each(function() {
            var parent = $(this).parent(), c=0, mark=$(this).text();
            while(parent.find('label').length==0 && parent.find('.input-group-addon').length==1) {
                parent = parent.parent();
                if(c++>10) break;
            }
            if(parent.find('label').length) {
                if(parent.find('label').html().indexOf(mark)===-1) parent.find('label').append(mark);
                $(this).remove();
            }
        });
    });
}
