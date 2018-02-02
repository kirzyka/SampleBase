/*------------------------------------------------------
    Author : www.webthemez.com
    License: Commons Attribution 3.0
    http://creativecommons.org/licenses/by/3.0/
---------------------------------------------------------  */

(function ($) {
    "use strict";
    var btn;
    var mainApp = {

        initFunction: function () {
            /*MENU 
            ------------------------------------*/
            $('#main-menu').metisMenu();
			
            $(window).bind("load resize", function () {
                console.log('resize');
                if ($(this).width() < 768) {
                    $('div.sidebar-collapse').addClass('collapse');
                    mainApp.close();
                } else {
                    $('div.sidebar-collapse').removeClass('collapse')
                }
            });
          
	 
        },

        initialization: function () {
            mainApp.initFunction();

        },

        open: function () {
            $('.navbar-side').animate({left: '0px'});
            btn.removeClass('closed');
            $('#page-wrapper').animate({'margin-left' : '260px'});
        },

        close: function () {
            btn.addClass('closed');
            $('.navbar-side').animate({left: '-260px'});
            $('#page-wrapper').animate({'margin-left' : '0px'}); 
        }



    }
    // Initializing ///

    $(document).ready(function () {
		$(".dropdown-button").dropdown();
		$("#sideNav").click(function(){
            btn = $(this);
			if(btn.hasClass('closed')){
                mainApp.open();				
			}
			else{
			    mainApp.close();
			}
		});
		
        mainApp.initFunction(); 
    });

	$(".dropdown-button").dropdown();
	
}(jQuery));
