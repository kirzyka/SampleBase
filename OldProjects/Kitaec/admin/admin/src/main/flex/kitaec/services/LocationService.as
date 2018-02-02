package kitaec.services {

import flash.events.Event;

import kitaec.common.CommonConst;
import kitaec.common.ObjectUtil;
import kitaec.vo.location.LocationVO;

import mx.collections.ArrayCollection;

public class LocationService extends BaseService {


    // GET LOCATION LIST BY SUPPLIER ID
    public function getLocationListBySupId(supplierId:int):void {
        this.url = CommonConst.LOCATION_SERVICE;
        this.request = { action: "get_loc_list_by_sup_id", supplier_id: supplierId };
        this.addEventListener(BaseService.SUCCESS_EVENT, onGetLocationListResult);
        this.send();
    }

    private function onGetLocationListResult(event:Event):void {
        this.removeEventListener(BaseService.SUCCESS_EVENT, onGetLocationListResult);
        if (result.status == RESPONSE_STATUS_OK) {
            model.locations = ObjectUtil.convertResultList(new ArrayCollection(result.data), LocationVO);
            callBack();
        }
    }
}
}
