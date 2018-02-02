package kitaec.view.order {

import flash.events.Event;

import kitaec.common.CommonConst;
import kitaec.controller.event.NotifyEvent;
import kitaec.controls.comboboxes.AutoPopulatedValueComboBox;
import kitaec.controls.date.DateChooser;
import kitaec.services.LocationService;
import kitaec.services.OfferService;
import kitaec.services.OrderService;
import kitaec.services.SupplierService;
import kitaec.view.*;
import kitaec.view.order.popup.OrderDetailsPopup;
import kitaec.vo.DateVO;
import kitaec.vo.location.LocationVO;
import kitaec.vo.offer.OfferTimeVO;
import kitaec.vo.order.OrderStatusVO;
import kitaec.vo.order.OrderVO;
import kitaec.vo.supplier.SupplierVO;

import mx.controls.DateField;
import mx.events.FlexEvent;

import spark.components.gridClasses.GridColumn;
import spark.events.GridEvent;

public class OrdersViewBase extends BaseView {

    [Bindable]
    protected var selectedSupplier:SupplierVO;
    [Bindable]
    protected var selectedLocation:LocationVO;
    [Bindable]
    protected var selectedDate:DateVO;
    [Bindable]
    protected var selectedTime:OfferTimeVO;

    public function OrdersViewBase() {
    }

    override protected function onShow(event:FlexEvent):void {
        if (selectedSupplier == null) {
            loadSuppliers();
        }
    }

    // Filter
    /** Loaders **/
    protected function loadSuppliers():void {
        var supService:SupplierService = new SupplierService();
        supService.callBackFunction = onLoadSuppliersSuccess;
        supService.getSupplierList();
    }

    protected function onLoadSuppliersSuccess():void {
        if (model.suppliers.length > 0) {
            selectedSupplier = model.suppliers.getItemAt(0) as SupplierVO;
            loadLocations();
        }
    }

    protected function loadLocations():void {
        var locService:LocationService = new LocationService();
        locService.callBackFunction = onLoadLocationsSuccess;
        locService.getLocationListBySupId(selectedSupplier.supplierId);
    }

    protected function onLoadLocationsSuccess():void {
        if (model.locations.length > 0) {
            selectedLocation = model.locations.getItemAt(0) as LocationVO;
            loadDates();
        }
    }

    protected function loadDates():void {
        var offerService:OfferService = new OfferService();
        offerService.callBackFunction = onLoadDatesSuccess;
        offerService.getOfferDayList(selectedSupplier.supplierId, selectedLocation.locationId);
    }

    protected function onLoadDatesSuccess():void {
        if (model.offerDateList.length > 0) {
            selectedDate = model.offerDateList.getItemAt(0) as DateVO;
            loadTimes();
        }
    }

    protected function loadTimes():void {
        var offerService:OfferService = new OfferService();
        offerService.callBackFunction = onLoadTimesSuccess;
        offerService.getOfferTimeList(selectedSupplier.supplierId, selectedLocation.locationId, selectedDate.date);
    }

    protected function onLoadTimesSuccess():void {
        if (model.offerTimeList.length > 0) {
            selectedTime = model.offerTimeList.getItemAt(0) as OfferTimeVO;
            onLoadOrderList();
        }
    }

    /** Handlers **/
    protected function onSupplierChange(event:Event):void {
        var control:AutoPopulatedValueComboBox = event.currentTarget as AutoPopulatedValueComboBox;
        selectedSupplier = control.selectedItem as SupplierVO;
        loadLocations();
    }

    protected function onLocationChange(event:Event):void {
        var control:AutoPopulatedValueComboBox = event.currentTarget as AutoPopulatedValueComboBox;
        selectedLocation = control.selectedItem as LocationVO;
        loadDates();
    }

    protected function onDateChange(event:Event):void {
        var control:DateChooser = event.currentTarget as DateChooser;
        selectedDate = control.selectedItem as DateVO;
        loadTimes();
    }

    protected function onTimeChange(event:Event):void {
        var control:AutoPopulatedValueComboBox = event.currentTarget as AutoPopulatedValueComboBox;
        selectedTime = control.selectedItem as OfferTimeVO;
        onLoadOrderList();
    }

    // Grid
    protected function onLoadOrderList():void {
        var srv:OrderService = new OrderService();
        srv.getOrderList(selectedSupplier.supplierId, selectedLocation.locationId, selectedDate.date, selectedTime.value);
    }

    protected function statusLabelFunction(item:OrderVO, column:GridColumn):String {
        var result:String = "";
        var status:OrderStatusVO;
        for each(status in CommonConst.ORDER_STATUS) {
            if (item.status == status.id) {
                result = status.name;
            }
        }
        return result;
    }


    // Details
    protected  function onCreateOrder():void {
        // Create New
        model.order = new OrderVO();
        model.order.supplierId = selectedSupplier.supplierId;
        model.order.locationId = selectedLocation.locationId;
        model.order.date = selectedDate.date;
        model.order.time = selectedTime.value;
        openDetails();
    }

    protected function onLoadOrderDetails(event:GridEvent):void {
        // Set Current Order
        model.order = event.item as OrderVO;

        openDetails();
    }

    protected function openDetails():void {
        // Init popup
        var popup:OrderDetailsPopup = new OrderDetailsPopup();
        // Load Offer List
        var srvOffer:OfferService = new OfferService();
        srvOffer.getOfferList(selectedSupplier.supplierId, selectedLocation.locationId, selectedDate.date, selectedTime.value);
        // Load Details from DB
        var srvOrder:OrderService = new OrderService();
        srvOrder.callBackFunction = popup.calculateTotal;
        srvOrder.getOfferList(model.order.orderId);

        // Show Popup
        popup.show(true);
    }


}
}
