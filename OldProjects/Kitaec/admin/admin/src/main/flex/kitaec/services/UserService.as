package kitaec.services {

import flash.events.Event;

import kitaec.common.CommonConst;
import kitaec.controller.Controller;
import kitaec.controller.Controller;

import mx.controls.Alert;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;

public class UserService extends BaseService {

    public function login(username:String, password:String):void {
        this.url = CommonConst.USER_SERVICE;
        this.request = { user: username, pass: password };
        this.addEventListener(BaseService.SUCCESS_EVENT, onLoginSuccess);
        this.send();
    }

    private function onLoginSuccess(event:Event):void {
        if (result.status == RESPONSE_STATUS_OK) {
            //role id
            if (result.data["role"] == CommonConst.ROLE_ADMIN) {
                Alert.show(resultStr);  // For Testing
                Alert.show("Добро пожаловать, администратор");
                controller.dispatchEvent(new Event(Controller.LOGIN_SUCCESS_EVENT));

                /*var supService:SupplierService = new SupplierService();
                supService.getSupplierList();*/
            }
            else {
                Alert.show("Йо, неверный пароль!");
            }
        }
    }
}
}
