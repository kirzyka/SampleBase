package kitaec.view.order.popup {

import flash.events.Event;

import kitaec.common.ObjectUtil;
import kitaec.controls.comboboxes.AutoPopulatedValueComboBox;
import kitaec.services.OrderService;
import kitaec.view.BasePopup;
import kitaec.vo.offer.OfferVO;
import kitaec.vo.order.OrderOfferInfoVO;
import kitaec.vo.order.OrderVO;

import mx.events.ValidationResultEvent;

import mx.utils.ObjectUtil;
import mx.validators.Validator;

import spark.components.DataGrid;
import spark.components.List;
import spark.components.TextArea;
import spark.components.TextInput;
import spark.components.gridClasses.GridColumn;

public class OrderDetailsPopupBase extends BasePopup {

    public var validators:Array;
    public var dg:DataGrid;

    [Bindable]
    protected var selectedOffer:OfferVO;
    [Bindable]
    protected var totalLabel:String;
    [Bindable]
    protected var isSaveEnabled:Boolean;

    public function OrderDetailsPopupBase() {
    }

    override public function show(modal:Boolean = true):void {
        super.show(modal);
        model.orderForEdit = kitaec.common.ObjectUtil.convertResultObject(model.order, OrderVO);
    }


    protected function onOfferListChange(event:Event):void {
        var control:List = event.currentTarget as List;
        selectedOffer = control.selectedItem as OfferVO;
    }

    public function calculateTotal():void {
        var total:Number = 0;
        for each(var item:OrderOfferInfoVO in model.orderOfferList) {
            total += (item.count * item.price);
        }
        totalLabel = total.toFixed(2);
    }

    protected function onNameChange(event:Event):void {
        var control:TextInput = event.currentTarget as TextInput;
        model.orderForEdit.name = control.text;
        orderChanged();
    }

    protected function onPhoneChange(event:Event):void {
        var control:TextInput = event.currentTarget as TextInput;
        model.orderForEdit.phone = control.text;
        orderChanged();
    }

    protected function onEmailChange(event:Event):void {
        var control:TextInput = event.currentTarget as TextInput;
        model.orderForEdit.email = control.text;
        orderChanged();
    }

    protected function onCommentChange(event:Event):void {
        var control:TextArea = event.currentTarget as TextArea;
        model.orderForEdit.comment = control.text;
        orderChanged();
    }

    protected function orderChanged():void {
        isSaveEnabled = true;
        calculateTotal();
    }

    protected function onAdd(event:Event):void {
        var orderOfferInfoItem:OrderOfferInfoVO
        // check if exist
        if (selectedOffer != null) {
            for each(orderOfferInfoItem in model.orderOfferList) {
                if (orderOfferInfoItem.offerId == selectedOffer.offerId) {
                    orderOfferInfoItem.count++;
                    orderChanged();
                    return;
                }
            }
            // create
            orderOfferInfoItem = kitaec.common.ObjectUtil.convertResultObject(selectedOffer, OrderOfferInfoVO);
            orderOfferInfoItem.count = 1;
            // add
            model.orderOfferList.addItem(orderOfferInfoItem);
            orderChanged();
        }
    }

    protected function onAddOffer():void {
        var orderOffer:OrderOfferInfoVO = dg.selectedItem as OrderOfferInfoVO;
        orderOffer.count++;
        orderChanged();
    }

    protected function onDeleteOffer():void {
        var orderOffer:OrderOfferInfoVO = dg.selectedItem as OrderOfferInfoVO;
        if(orderOffer.count == 1) {
            model.orderOfferList.removeItemAt(model.orderOfferList.getItemIndex(orderOffer));
        } else {
            orderOffer.count--;
        }
        orderChanged();
    }

    protected function onStatusChange(event:Event):void {
        var control:AutoPopulatedValueComboBox = event.currentTarget as AutoPopulatedValueComboBox;
        model.orderForEdit.status = int(control.selectedValue);
        orderChanged();
    }

    protected function isValid():Boolean {
        var result:Boolean = true;
        for each(var validator:Validator in validators){
            if(validator.validate().type == ValidationResultEvent.INVALID) {
                result = false;
            }
        }
        return result;
    }

    protected function onSave():void {
        if(!isValid()) { return; }

        var srv:OrderService = new OrderService();
        srv.callBackFunction = onSaveSuccess;
        if(model.orderForEdit.orderId == 0) {
            srv.createOrder(model.orderForEdit, model.orderOfferList);
        } else {
            srv.updateOrder(model.orderForEdit, model.orderOfferList);
        }
    }

    protected function onSaveSuccess():void {
        model.order = mx.utils.ObjectUtil.clone(model.orderForEdit) as OrderVO;
        hide();
    }

    protected function onCancel():void {
        hide();
    }


    /* Label function */
    protected function descriptionLabelFunction(item:Object, column:GridColumn):String {
        var orderOfferInf:OrderOfferInfoVO = item as OrderOfferInfoVO;
        return orderOfferInf.description;
    }

    protected function priceLabelFunction(item:Object, column:GridColumn):String {
        var orderOfferInf:OrderOfferInfoVO = item as OrderOfferInfoVO;
        return orderOfferInf.price.toFixed(2);
    }

    protected function sumLabelFunction(item:Object, column:GridColumn):String {
        var orderOfferInf:OrderOfferInfoVO = item as OrderOfferInfoVO;
        return (orderOfferInf.count * orderOfferInf.price).toFixed(2);
    }
}
}
