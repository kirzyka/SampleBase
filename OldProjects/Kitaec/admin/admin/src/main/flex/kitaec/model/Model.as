package kitaec.model {

import kitaec.vo.location.LocationVO;
import kitaec.vo.order.OrderVO;
import kitaec.vo.supplier.SupplierVO;

import mx.collections.ArrayCollection;

[Bindable]
public class Model {

    // Common
    public var isShowLoading:Boolean;

    // Orders
    public var orderList:ArrayCollection = new ArrayCollection();  // of OrderVO
    public var order:OrderVO;
    public var orderForEdit:OrderVO;
    public var orderOfferList:ArrayCollection = new ArrayCollection();  // of OrderOfferInfoVO

    // History

    // Offers
    public var offerList:ArrayCollection = new ArrayCollection();  // of OfferVO
    public var offerDayList:Array = new Array();
    public var offerDateList:ArrayCollection = new ArrayCollection();
    public var offerTimeList:ArrayCollection = new ArrayCollection();

    // Dishes
    public var dishes:ArrayCollection = new ArrayCollection();
    //Suppliers
    public var suppliers:ArrayCollection = new ArrayCollection();

    public var supplierEdit:SupplierVO = new SupplierVO();
    //Location
    public var locations:ArrayCollection = new ArrayCollection();

    public var locationEdit:LocationVO = new LocationVO();

    //---------------------------
    private static var _instance:Model;

    public function Model(){
        if(_instance){
            throw new Error("Singleton... use getInstance()");
        }
        _instance = this;
    }

    public static function getInstance():Model{
        if(!_instance){
            new Model();
        }
        return _instance;
    }
}
}
