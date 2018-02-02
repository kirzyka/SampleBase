package kitaec.common {
import kitaec.vo.order.OrderStatusVO;

import mx.collections.ArrayCollection;

public class CommonConst {

    //services section
    public static const USER_SERVICE:String = "/user";
    public static const ORDER_SERVICE:String = "/order";
    public static const OFFER_SERVICE:String = "/offer";
    public static const SUPPLIER_SERVICE:String = "/supplier";
    public static const LOCATION_SERVICE:String = "/loc";
    public static const DISH_SERVICE:String = "/dish";

    //service actions section
    public static const ADD_DISH_ACTION:String = "add_dish";
    public static const UPDATE_DISH_ACTION:String = "update_dish";
    //roles section
    public static const ROLE_ADMIN:String = "ROLE_ADMIN";

    //dish types
    /*public static const DISH_TYPES :Object =
    {
    0 : "Не указан/другое",
    1 : "Первое",
    2 : "Второе",
    3 : "Напиток",
    4 : "Десерт",
    5 : "Салат"
    };*/

    //индекс в массиве и есть тип блюда - это хуйня, ооочень плохая практика. Давайте не будем лениться и делать ВОшки
    public static const DISH_TYPES :Array = ["Не указан/другое", "Первое", "Второе", "Напиток", "Десерт", "Салат"];

    public static const ORDER_STATUS:ArrayCollection = new ArrayCollection([
        new OrderStatusVO(1, "не подтвержден"),
        new OrderStatusVO(2, "подтверждён"),
        new OrderStatusVO(3, "доставлен и оплачен"),
        new OrderStatusVO(4, "отменен"),
        new OrderStatusVO(5, "доставлен но не оплачен")
    ]);
}
}
