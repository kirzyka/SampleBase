package kitaec.vo.order {

[Bindable]
public class OrderStatusVO {

    private var _id:int;
    private var _name:String;

    public function get id():int {
        return _id;
    }

    public function set id(value:int):void {
        _id = value;
    }

    public function get name():String {
        return _name;
    }

    public function set name(value:String):void {
        _name = value;
    }


    public function OrderStatusVO(id:int, name:String) {
        _id = id;
        _name = name;
    }
}
}
