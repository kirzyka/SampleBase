jQuery.cachedScript = function( url, options ) {
 
  // Allow user to set any option except for dataType, cache, and url
  options = $.extend( options || {}, {
    dataType: "script",
    cache: true,
    url: url
  });
 
  // Use $.ajax() since it is more flexible than $.getScript
  // Return the jqXHR object so we can chain callbacks
  return jQuery.ajax( options );
};


$(document).ready(function () {

    // Usage
    $.cachedScript( "http://kitaec-avaprojects.rhcloud.com/js/common.js" ).done(function( script, textStatus ) {
      console.log( textStatus );
    });

   /* var imported = document.createElement('script');
    imported.src = 'js/common.js';
    document.head.appendChild(imported);*/
    /*$.getScript( "common.js" )
      .done(function( script, textStatus ) {
        console.log( textStatus );
      })
      .fail(function( jqxhr, settings, exception ) {
        console.log( exception );  
    });
*/



    //startPooling();

    // Popup
    $('.open-popup-location').on('click', function (event) {
        event.preventDefault();
        selectLocation();
    });

    $('.open-popup-date').on('click', function (event) {
        event.preventDefault();
        selectDate();
    });

    $('.open-popup-time').on('click', function (event) {
        event.preventDefault();
        selectTime();
    });
});

function selectLocation(){
    openSelectPopup(locations, 'close-popup-location', setLocation, getDates);
}

function selectDate(){
    openDatePopup('close-popup-date', setDate, getTimes);
}

function selectTime(){
    openSelectPopup(times, 'close-popup-time', setTime, getMenu);
}

function getMenu() {
    if(currentSupplier != null && currentLocation != null && currentDate != null && currentTime != null) {
        return;
    }

    ajaxManager.addReq({
        timeout: TIMEOUT,
        //contentType: "text/plain; charset=UTF-8",
        type: "POST",
        url: '/offer',
        cache: false,
        data: {
            action: "get_menu_for_date",
            supplier_id: currentSupplier.supplier_id,
            location_id: currentLocation.location_id,
            date: currentDate * 1000,
            time: currentTime.value
        },
        success: function(result){
            buidMenuGrid(result.data);   
        },
        error: function (request, errorType, errorMessage) {
            alert('Error: ' + errorType + ' with message: ' + errorMessage);
        }
    });
}

function buidMenuGrid(list) {
    $('#menuOffers').html("");
    $.each(list, function( index, item ) {
        var description = item.description;
        /*if(description.length > 60) {
         description =  description.substring(0, 60) + "...";
         } */

        var menuBlockWrapper = $('<div class="offerWrapper"></div>');
        var menuBlock = $('<div class="offer" ' +
            'data-title="' + item.name + '" ' +
            'data-price="' + item.price + '" ' +
            'data-offer-id="' + item.offerId + '">' +
            '</div>');
        var menuTitle = $('<p class="title">' + item.name + '</p>');
        var menuDescription = $('<p class="description">' + description + '</p>');
        var menuOrderButton = $('<a class="button" href="#"><p>Хочу</p></a>');

        menuOrderButton.on('click', function(event) {
            event.preventDefault();

            var offerId = $(this).closest('.offer').data('offer-id');
            var name = $(this).closest('.offer').data('title');
            var price = $(this).closest('.offer').data('price');

            addToBasket(offerId, name, description, price);
        });

        menuBlock.append(menuTitle);
        menuBlock.append(menuDescription);
        menuBlock.append(menuOrderButton);
        menuBlockWrapper.append(menuBlock);

        var menuPrice = $('<div class="price"><p class="amount">' + item.price + '</p><p>грн.</p></div>');
        menuBlockWrapper.append(menuPrice);

        $('#menuOffers').append(menuBlockWrapper);
    });
    $('#menuOffers').append($('<div class="cl">&nbsp;</div>'));
}

function startPooling() {

    function progressPooling() {

        if(currentSupplier != null && currentLocation != null && currentDate != null && currentTime != null) {
            ajaxManager.addReq({
                timeout: TIMEOUT,
                type: "POST",
                url: '/order',
                cache: false,
                data: {
                    action: "get_delivery_state",
                    supplier_id: currentSupplier.supplier_id,
                    location_id: currentLocation.location_id,
                    date: currentDate * 1000,
                    time: currentTime.value
                },
                success: function(result){
                    //update progress bar
                    if(result == "") {
                        setTimeout(progressPooling, 10000);  // 10 sec.
                        console.log("ERROR: Empty response");
                        return;
                    }
                    $('#pb').find('.progress-bar').find('span').css("width", result.data.percent + "%");
                    $('#pb').find('.price').text( result.data.deliveryPrice );
                    $('#pb').find('.msg').text( result.data.message );
                }
            });
        }
        setTimeout(progressPooling, 10000);  // 10 sec.
    }

    progressPooling();
}


