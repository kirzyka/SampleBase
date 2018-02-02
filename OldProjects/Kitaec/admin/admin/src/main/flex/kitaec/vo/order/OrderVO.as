package kitaec.vo.order {

[Bindable]
public class OrderVO {

    public static const STATUS_NOT_APPROVED:int = 1;           //  1 - не подтвержден;
    public static const STATUS_APPROVED:int = 2;               //  2 - подтвержден;
    public static const STATUS_DELIVERED_AND_PAID:int = 3;     //  3 - доставлен и оплачен;
    public static const STATUS_CANCELED:int = 4;               //  4 - отменен;
    public static const STATUS_DELIVERED_NOT_PAID:int = 5;     //  5 - доставлен но не оплачен;


    public var orderId:int;
    public var clientId:int;
    public var locationId:int;
    public var supplierId:int;
    public var name:String;
    public var phone:String;
    public var email:String;
    public var confirmation:int;
    public var date:Number;
    public var time:int;
    public var status:int;
    public var comment:String = "";


    public function OrderVO() {
        this.status = STATUS_NOT_APPROVED;
    }
}
}
