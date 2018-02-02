
$(document).ready(function () {

    buildCart();
    $(window).on('resize', function(){
        buildCart();
    });

    $('#checkout').on('click', function (event) {
        event.preventDefault();

        __CurrentUser__.name = $('#basketUserFirstName').val();
        __CurrentUser__.phone = $('#basketUserPhone').val();
        __CurrentUser__.email = $('#basketUserEmail').val();
        __CurrentUser__.confirmation = $('#basketUseEmail').is(":checked");
        __CurrentUser__.comment = $('#basketUserComment').val();

        if(__CurrentUser__.name == "" || __CurrentUser__.phone == "") {
            alert('Укажите своё имя и телефон.');
        } else {

            var basket = getBasket();
            if(basket != null) {
                var order = {};
                order['name'] = __CurrentUser__.name;
                order['phone'] = __CurrentUser__.phone;
                order['email'] = __CurrentUser__.email;
                order['confiramtion'] = __CurrentUser__.confirmation;
                order['comment'] = __CurrentUser__.comment;
                order['date'] = basket.date;
                order['time'] = basket.time.value;
                order['offer_list'] = basket.orders ;// [{offer_id : 1, count: 1},{offer_id : 2, count: 2}];

                ajaxManager.addReq({
                    timeout: __timeout__,
                    //contentType: "text/plain; charset=UTF-8",
                    type: "POST",
                    url: '/order',
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
                        cleanBasket();
                    }
                });
            } else {
                alert('Корзина пуста');
            }
        }
    });


});

function buildCart() {
    var basket = getBasket();
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
                var basket = getBasket();
                if(basket != null) {
                    $.each(basket.orders, function( j, order ) {
                        if(order.offer_id == id) {
                            increaseFromBasket(order.offer_id);
                        }
                    });
                }

                buildCart();
            });
            /* - */
            control.find('span').on('click', function (event) {
                var id = $(this).data('id');
                var basket = getBasket();
                if(basket != null) {
                    $.each(basket.orders, function( j, order ) {
                        if(order.offer_id == id) {
                            removeFromBasket(order.offer_id);
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
