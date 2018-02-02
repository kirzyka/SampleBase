$(document).ready(function () {

    init();

    $(document).bind(EVENT_TIME_CHANGED, buildCart);

    $(window).on('resize', function(){
        buildCart();
    });

    $('#checkout').on('click', function (event) {
        event.preventDefault();

        currentUser.name = $('#basketUserFirstName').val();
        currentUser.phone = $('#basketUserPhone').val();
        currentUser.email = $('#basketUserEmail').val();
        currentUser.confirmation = $('#basketUseEmail').is(":checked");
        currentUser.comment = $('#basketUserComment').val();

        if(currentUser.name == "" || currentUser.phone == "") {
            alert('Укажите своё имя и телефон.');
        } else {

            var basket = _Basket.getBasket(_Basket.getBaskets());
            if(basket != null) {
                var order = {};
                order['name'] = currentUser.name;
                order['phone'] = currentUser.phone;
                order['email'] = currentUser.email;
                order['confiramtion'] = currentUser.confirmation;
                order['comment'] = currentUser.comment;
                order['date'] = basket.date;
                order['time'] = basket.time.value;
                order['offer_list'] = basket.orders ;// [{offer_id : 1, count: 1},{offer_id : 2, count: 2}];

                ajaxManager.addReq({
                    timeout: TIMEOUT,
                    //contentType: "text/plain; charset=UTF-8",
                    type: "POST",
                    url: URL_ORDER,
                    cache: false,
                    data: {
                        action: "create_order",
                        order: JSON.stringify(order)
                    },
                    success: function( data, status, request ){
                        alert('Заказ оформлен. Ожидайте, за вами уже выехали!');
                        goToPage(HOME);

                    },
                    error: function ( request, status, error ) {
                        alert('Error: ' + status + ' with message: ' + error);
                    },
                    complete: function ( request, status ) {
                        $('#basketOfferBody').html('');
                        _Basket.cleanBaskets();
                    }
                });
            } else {
                alert('Корзина пуста');
            }
        }
    });


});

function buildCart() {
    _Basket.updateBasketMsg();
    var basket = _Basket.getBasket(_Basket.getBaskets());
    if(basket != null) {
        $('.basket-content').html('');

        var win = $(window);

        var totalSum = 0;
        var totalCount = 0;
        $.each(basket.orders, function( j, order ) {
            totalSum += order.price * order.count;

            var basketItem;
            var title;
            var description;
            var sumAndCount;
            var more;
            var control;

            basketItem = $('<div class="basket-content-item"></div>');

            if (win.width() >= 767) {
                title = $('<div class="title"><p class="green">' + order.name + '</p><span class="more-button black">Подробнее</span></div>');
                description = $('<div class="description"><p class="black">' + order.description + '</p></p></div>');
                sumAndCount = $('<div class="sum-and-count">' +
                    '<div class="white brown-bg-2 info-icon price"><p>' + order.price + '</p><span>грн.<span></div>' +
                    '<div class="green white-bg info-icon count"><p>' + order.count + '</p><span class="brown">шт.</span></div>' +
                    '</div>');
                control = $('<div class="control">' +
                    '<a class="button green-bg" href="#"><p data-id="' + order.offer_id + '">Ещё</p></a>' +
                    '<span data-id="' + order.offer_id + '">Удалить</span>' +
                    '</div>');

                basketItem.append(title);
                basketItem.append(description);
                basketItem.append(sumAndCount);
                basketItem.append(control);
            } else {
                sumAndCount = $('<div class="sum-and-count">' +
                    '<div class="white brown-bg-2 info-icon price"><p>' + order.price + '</p><span>грн.<span></div>' +
                    '<div class="green white-bg info-icon count"><p>' + order.count + '</p><span class="brown">шт.</span></div>' +
                    '</div>');
                title = $('<div class="title"><p class="green">' + order.name + '</p></div>');
                description = $('<div class="description"><p class="black">' + order.description + '</p></p></div>');
                more = $('<span class="more-button black">Подробнее</span>');
                control = $('<div class="control">' +
                    '<a class="button green-bg" href="#"><p data-id="' + order.offer_id + '">Ещё</p></a>' +
                    '<span data-id="' + order.offer_id + '">Удалить</span>' +
                    '</div>');

                basketItem.append(sumAndCount);
                basketItem.append(title);
                basketItem.append(description);
                basketItem.append(more);
                basketItem.append(control);
            }

            /* more */
            basketItem.find('.more-button').on('click', function (event) {
                if(description.hasClass('extended')) {
                    $(this).html('Подробнее');
                    description.removeClass('extended');
                } else {
                    $(this).html('Скрыть подробности');
                    description.addClass('extended');
                }
            });


            /* + */
            control.find('p').on('click', function (event) {
                var id = $(this).data('id');
                var basket = _Basket.getBasket(_Basket.getBaskets());
                if(basket != null) {
                    $.each(basket.orders, function( j, order ) {
                        if(order.offer_id == id) {
                            _Basket.increaseFromBasket(order.offer_id);
                        }
                    });
                }

                buildCart();
            });
            /* - */
            control.find('span').on('click', function (event) {
                var id = $(this).data('id');
                var basket = _Basket.getBasket(_Basket.getBaskets());
                if(basket != null) {
                    $.each(basket.orders, function( j, order ) {
                        if(order.offer_id == id) {
                            _Basket.removeFromBasket(order.offer_id);
                        }
                    });
                }

                buildCart();
            });

            $('.basket-content').append(basketItem);
        });

        $('.basket-content').append('<p class="total black">Итого:<b class="green">' + totalSum + '</b> грн.</p>');

    }


}
