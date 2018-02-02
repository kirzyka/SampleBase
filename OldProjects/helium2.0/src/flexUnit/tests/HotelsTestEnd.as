package flexUnit.tests
{
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	
	import flexUnit.BaseTestCase;
	
	import services.business.hotels.HotelsDelegate;
	import services.cairngorm.BaseEvent;
	import services.controller.AppController;
	import services.events.hotels.DeleteHotelEvent;
	import services.events.hotels.GetHotelsListEvent;
	import services.events.hotels.UpdateHotelInfoEvent;

	public class HotelsTestEnd extends BaseTestCase
	{						
		private var lengthHotelList:int;
		
		public function testRemoveHotel():void
		{
			lengthHotelList = model.hotelsModule.hotels.length;
			
			var event:DeleteHotelEvent = new DeleteHotelEvent(HotelsDelegate.REMOVE_HOTEL);
			addCallBack(HotelsDelegate.REMOVE_HOTEL, deleteGetHotelsCallback);
			CairngormEventDispatcher.getInstance().dispatchEvent(event);
		}
		
		private function deleteGetHotelsCallback(evt:BaseEvent):void
		{
			var getHotelsListEvent:GetHotelsListEvent = new GetHotelsListEvent(HotelsDelegate.GET_HOTELS_LIST);
			addCallBack(HotelsDelegate.GET_HOTELS_LIST,deleteHotelCallback);
			CairngormEventDispatcher.getInstance().dispatchEvent(getHotelsListEvent);			
		}
		
		private function deleteHotelCallback(evt:BaseEvent):void
		{
			assertTrue("compare length of hotelList before and after deleting", lengthHotelList == model.hotelsModule.hotels.length + 1); // input from keyboard
		}
	}
}