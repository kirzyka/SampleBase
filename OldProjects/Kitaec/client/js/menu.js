$(document).ready(function () {

    //stratPooling(1, 1, 1385405546);
    //stratPooling(1, 1, 1385474400);

    startPooling(1, 1, __CurrentDate__);

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

    // create menu
    $("#nav-drop-list").html("");
    for(var i = 0; i < SUPPLIERS.length; i++) {
        var supplier = SUPPLIERS[i];
        $("#nav-drop-list").append('<li><a href="#" class="nav-item ' + supplier.color + '" data-id="' + supplier.id + '" title="' + supplier.description + '">' + supplier.name + '</a></li>');
    }

    // set supplier from cookies
    for(var i = 0; i < SUPPLIERS.length; i++) {
        var supplier = SUPPLIERS[i];
        if(supplier.id == $.cookie(CKS_SUPPLIER)){
            __CurrentSupplier__ = supplier;
        }
    }
    setSupplier(__CurrentSupplier__);
    getMenu();   //in millisecondes  1385474400 26-11-2013 14:00

    // change supplier
    $('.nav-item').on('click', function (event) {
        event.preventDefault();
        for(var i = 0; i < SUPPLIERS.length; i++) {
            var supplier = SUPPLIERS[i];
            if(supplier.id == $(this).data("id")){
                setSupplier(supplier);
                $.cookie(CKS_SUPPLIER, supplier.id);
                goToPage(HOME);
            }
        }
    });
});

function selectLocation(){
    openSelectPopup(LOCATIONS, 'close-popup-location', '__CurrentLocation__', getMenu);
}

function selectDate(){
    openDatePopup('close-popup-date', '__CurrentDate__', getMenu);
}

function selectTime(){
    openSelectPopup(TIMES, 'close-popup-time', '__CurrentTime__', getMenu);
}


function setSupplier(supplier){
    __CurrentSupplier__ = supplier;
    $("#nav-selected").text(supplier.name);
    $("#nav-selected").removeClass();
    $("#nav-selected").addClass(supplier.color);
    getMenu();
}

function getMenu() {
    
    var caurrentDate = new Date(__CurrentDate__ * 1000); 
    $('#selectedDate').html(caurrentDate.getDate());
    $('#selectedMonth').html(MONTH[caurrentDate.getMonth()]);
    $('#selectedTime').html(__CurrentTime__.name);
    $('#selectedAddress').html(__CurrentLocation__.name);

    var order = {};
    order['supplier_id'] = __CurrentSupplier__.id;
    order['location_id'] = __CurrentLocation__.id;
    order['date'] = __CurrentDate__ + __CurrentTime__.value;

    ajaxManager.addReq({
        timeout: __timeout__,
        //contentType: "text/plain; charset=UTF-8",
        type: "POST",
        url: '/vegano',
        cache: false,
        data: {
            action: "get_menu_for_date",
            order: JSON.stringify(order)
        },
        success: function(data){
            //update progress bar
            $('#menuOffers').html("");
            $.each(data.menu, function( index, item ) {
                var description = item.description;
                if(description.length > 60) {
                    description =  description.substring(0, 60) + "...";
                }

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
        },
        error: function (request, errorType, errorMessage) {
            alert('Error: ' + errorType + ' with message: ' + errorMessage);
        }

    });
}

function addToBasket(offerId, name, description, price) {
    var baskets = getBaskets();

    var currentBasket;
    var currentOrder;

    if(baskets == null) {
        baskets = [];
    }
    $.each(baskets, function( index, item ) {
        if(item.supplierId == __CurrentSupplier__.id) {
            currentBasket = item;
        }
    });
    if(currentBasket == null) {
        currentBasket = { supplierId:__CurrentSupplier__.id,
            location:__CurrentLocation__.id,
            date:__CurrentDate__,
            orders:[]} ;

        baskets.push(currentBasket);
    }
    if(currentBasket.orders == null) { currentBasket.orders = [] };
    $.each(currentBasket.orders, function( index, item ) {
        if(item.offer_id == offerId) {
            currentOrder = item;
        }
    });
    if(currentOrder == null) {
        currentBasket.orders.push( { offer_id:offerId, name:name, description:description, price:price, count: 1 } );
    } else {
        currentOrder.count++;
    }

    if (typeof localStorage !== "undefined") {
        localStorage.setItem(CKS_BASKET, JSON.stringify(baskets));
    } else {
        $.cookie(CKS_BASKET, JSON.stringify(baskets));
    }
    updateBasketMsg();
}

function increaseFromBasket(offerId) {
    var baskets = getBaskets();

    var currentBasket;
    var currentOrder;

    if(baskets == null) {
        baskets = [];
    }
    $.each(baskets, function( index, item ) {
        if(item.supplierId == __CurrentSupplier__.id) {
            currentBasket = item;
        }
    });

    if(currentBasket.orders == null) { currentBasket.orders = [] };
    $.each(currentBasket.orders, function( index, item ) {
        if(item.offer_id == offerId) {
            currentOrder = item;
        }
    });
    if(currentOrder != null) {
        currentOrder.count++;
    }

    if (typeof localStorage !== "undefined") {
        localStorage.setItem(CKS_BASKET, JSON.stringify(baskets));
    } else {
        $.cookie(CKS_BASKET, JSON.stringify(baskets));
    }
    updateBasketMsg();
}

function removeFromBasket(offerId) {
    var baskets = getBaskets();

    var currentBasket;
    var currentOrder;

    if(baskets == null) {
        baskets = [];
    }
    $.each(baskets, function( index, item ) {
        if(item.supplierId == __CurrentSupplier__.id) {
            currentBasket = item;
        }
    });

    if(currentBasket.orders == null) { currentBasket.orders = [] };
    $.each(currentBasket.orders, function( index, item ) {
        if(item.offer_id == offerId) {
            currentOrder = item;
        }
    });
    if(currentOrder != null) {
        if(currentOrder.count > 1) {
            currentOrder.count--;
        } else {
            removeFromArray(currentBasket.orders, currentOrder);
        }
    }

    if (typeof localStorage !== "undefined") {
        localStorage.setItem(CKS_BASKET, JSON.stringify(baskets));
    } else {
        $.cookie(CKS_BASKET, JSON.stringify(baskets));
    }
    updateBasketMsg();
}


function startPooling(supplier_id, location_id, date) {

    var inRequest = {};
    inRequest['supplier_id'] = supplier_id;
    inRequest['location_id'] = location_id;
    inRequest['date'] = date; //in millisecondes  1385474400 26-11-2013 14:00

    function progressPooling() {
        ajaxManager.addReq({
            timeout: __timeout__,
            //contentType: "text/plain; charset=UTF-8",
            //contentType: "application/json; charset=UTF-8",
            type: "POST",
            url: '/vegano',
            cache: false,
            data: {
                action: "get_delivery_state",
                order: JSON.stringify(inRequest)
            },
            success: function(data){
                //update progress bar
                if(data == "") {
                    setTimeout(progressPooling, 10000);  // 10 sec.
                    console.log("ERROR: Empty response");
                    return;
                }
                $('#pb').find('.progress-bar').find('span').css("width", data.delivery_state.percent + "%");
                $('#pb').find('.price').text( data.delivery_state.deliveryPrice );
                $('#pb').find('.msg').text( data.delivery_state.message );
            }
        });
        setTimeout(progressPooling, 10000);  // 10 sec.
    }

    progressPooling();
}


