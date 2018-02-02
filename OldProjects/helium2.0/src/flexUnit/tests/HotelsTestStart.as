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

	public class HotelsTestStart extends BaseTestCase
	{						
		private var lengthHotelList:int;
		
		public function testAddHotel():void
		{
			var event:UpdateHotelInfoEvent = new UpdateHotelInfoEvent( AppController.UPDATE_HOTEL_INFO_EVENT );
			event.isEdit = false;
			event.hotelTotalInfo = modelTest.testHotelData.hotelInfoTotal;
			addCallBack(AppController.UPDATE_HOTEL_INFO_EVENT, addHotelCallback);
			event.dispatch();
		}
		
		private function addHotelCallback(event:BaseEvent):void
		{
			assertTrue("compare after add iHotelRoomCount", modelTest.testHotelData.hotelInfoTotal.iHotelRoomCount == model.hotelsModule.hotelTotalInfo.iHotelRoomCount);
			assertTrue("compare after add sHotelGMName", modelTest.testHotelData.hotelInfoTotal.sHotelGMName == model.hotelsModule.hotelTotalInfo.sHotelGMName);
			assertTrue("compare after add sHotelCode", modelTest.testHotelData.hotelInfoTotal.sHotelCode == model.hotelsModule.hotelTotalInfo.sHotelCode);
			assertTrue("compare after add iHotelCityId", modelTest.testHotelData.hotelInfoTotal.iHotelCityId == model.hotelsModule.hotelTotalInfo.iHotelCityId);//select
			assertTrue("compare after add sHotelName", modelTest.testHotelData.hotelInfoTotal.sHotelName == model.hotelsModule.hotelTotalInfo.sHotelName);
			assertTrue("compare after add iChildAge1", modelTest.testHotelData.hotelInfoTotal.iChildAge1 == model.hotelsModule.hotelTotalInfo.iChildAge1);
			assertTrue("compare after add sHotelWeb", modelTest.testHotelData.hotelInfoTotal.sHotelWeb == model.hotelsModule.hotelTotalInfo.sHotelWeb) ;
			assertTrue("compare after add iChildAge3", modelTest.testHotelData.hotelInfoTotal.iChildAge3 == model.hotelsModule.hotelTotalInfo.iChildAge3);
			assertTrue("compare after add sHotelPhone", modelTest.testHotelData.hotelInfoTotal.sHotelPhone == model.hotelsModule.hotelTotalInfo.sHotelPhone);
			assertTrue("compare after add iHotelHChainId", modelTest.testHotelData.hotelInfoTotal.iHotelHChainId == model.hotelsModule.hotelTotalInfo.iHotelHChainId); // id group of hotel
			assertTrue("compare after add sHotelEMail", modelTest.testHotelData.hotelInfoTotal.sHotelEMail == model.hotelsModule.hotelTotalInfo.sHotelEMail);
			assertTrue("compare after add sHotelDescription", modelTest.testHotelData.hotelInfoTotal.sHotelDescription == model.hotelsModule.hotelTotalInfo.sHotelDescription);
			assertTrue("compare after add sHotelCountry", modelTest.testHotelData.hotelInfoTotal.sHotelCountry == model.hotelsModule.hotelTotalInfo.sHotelCountry); // select
			assertTrue("compare after add sHotelHChainName", modelTest.testHotelData.hotelInfoTotal.sHotelHChainName == model.hotelsModule.hotelTotalInfo.sHotelHChainName); // select
			assertTrue("compare after add sHotelRegion", modelTest.testHotelData.hotelInfoTotal.sHotelRegion == model.hotelsModule.hotelTotalInfo.sHotelRegion); //select
			assertTrue("compare after add sHotelZip", modelTest.testHotelData.hotelInfoTotal.sHotelZip == model.hotelsModule.hotelTotalInfo.sHotelZip);
			assertTrue("compare after add sHotelFax", modelTest.testHotelData.hotelInfoTotal.sHotelFax == model.hotelsModule.hotelTotalInfo.sHotelFax);
			assertTrue("compare after add sHotelStreet", modelTest.testHotelData.hotelInfoTotal.sHotelStreet == model.hotelsModule.hotelTotalInfo.sHotelStreet); // input from keyboard
			
			var getHotelsListEvent:GetHotelsListEvent = new GetHotelsListEvent(HotelsDelegate.GET_HOTELS_LIST);
			addCallBack(HotelsDelegate.GET_HOTELS_LIST,getHotelListCallback);
			CairngormEventDispatcher.getInstance().dispatchEvent(getHotelsListEvent);
		}
		
		private function getHotelListCallback(evt:BaseEvent):void
		{
			assertTrue("empty or not list of hotels after add ", model.hotelsModule.hotels.length != 0);
			
			modelTest.testHotelData.hotelInfoNewTotal = model.hotelsModule.hotelTotalInfo;
			
			var event:UpdateHotelInfoEvent = new UpdateHotelInfoEvent( AppController.UPDATE_HOTEL_INFO_EVENT );
			event.isEdit = true;
			event.hotelTotalInfo = model.hotelsModule.hotelTotalInfo;
			addCallBack(AppController.UPDATE_HOTEL_INFO_EVENT, editHotelCallback);
			event.dispatch();
		}
		
		private function editHotelCallback(evt:BaseEvent):void
		{
			assertTrue("compare after edit iHotelId", modelTest.testHotelData.hotelInfoNewTotal.iHotelId == model.hotelsModule.hotelTotalInfo.iHotelId);
			assertTrue("compare after edit iHotelRoomCount", modelTest.testHotelData.hotelInfoNewTotal.iHotelRoomCount == model.hotelsModule.hotelTotalInfo.iHotelRoomCount);
			assertTrue("compare after edit sHotelGMName", modelTest.testHotelData.hotelInfoNewTotal.sHotelGMName == model.hotelsModule.hotelTotalInfo.sHotelGMName);
			assertTrue("compare after edit sHotelCode", modelTest.testHotelData.hotelInfoNewTotal.sHotelCode == model.hotelsModule.hotelTotalInfo.sHotelCode);
			assertTrue("compare after edit iHotelCityId", modelTest.testHotelData.hotelInfoNewTotal.iHotelCityId == model.hotelsModule.hotelTotalInfo.iHotelCityId);//select
			assertTrue("compare after edit sHotelName", modelTest.testHotelData.hotelInfoNewTotal.sHotelName == model.hotelsModule.hotelTotalInfo.sHotelName);
			assertTrue("compare after edit iChildAge1", modelTest.testHotelData.hotelInfoNewTotal.iChildAge1 == model.hotelsModule.hotelTotalInfo.iChildAge1);
			assertTrue("compare after edit sHotelWeb", modelTest.testHotelData.hotelInfoNewTotal.sHotelWeb == model.hotelsModule.hotelTotalInfo.sHotelWeb) ;
			assertTrue("compare after edit iChildAge3", modelTest.testHotelData.hotelInfoNewTotal.iChildAge3 == model.hotelsModule.hotelTotalInfo.iChildAge3);
			assertTrue("compare after edit sHotelPhone", modelTest.testHotelData.hotelInfoNewTotal.sHotelPhone == model.hotelsModule.hotelTotalInfo.sHotelPhone);
			assertTrue("compare after edit iHotelHChainId", modelTest.testHotelData.hotelInfoNewTotal.iHotelHChainId == model.hotelsModule.hotelTotalInfo.iHotelHChainId); // id group of hotel
			assertTrue("compare after edit sHotelEMail", modelTest.testHotelData.hotelInfoNewTotal.sHotelEMail == model.hotelsModule.hotelTotalInfo.sHotelEMail);
			assertTrue("compare after edit sHotelDescription", modelTest.testHotelData.hotelInfoNewTotal.sHotelDescription == model.hotelsModule.hotelTotalInfo.sHotelDescription);
			assertTrue("compare after edit sHotelCountry", modelTest.testHotelData.hotelInfoNewTotal.sHotelCountry == model.hotelsModule.hotelTotalInfo.sHotelCountry); // select
			assertTrue("compare after edit sHotelHChainName", modelTest.testHotelData.hotelInfoNewTotal.sHotelHChainName == model.hotelsModule.hotelTotalInfo.sHotelHChainName); // select
			assertTrue("compare after edit sHotelRegion", modelTest.testHotelData.hotelInfoNewTotal.sHotelRegion == model.hotelsModule.hotelTotalInfo.sHotelRegion); //select
			assertTrue("compare after edit sHotelZip", modelTest.testHotelData.hotelInfoNewTotal.sHotelZip == model.hotelsModule.hotelTotalInfo.sHotelZip);
			assertTrue("compare after edit sHotelFax", modelTest.testHotelData.hotelInfoNewTotal.sHotelFax == model.hotelsModule.hotelTotalInfo.sHotelFax);
			assertTrue("compare after edit sHotelStreet", modelTest.testHotelData.hotelInfoNewTotal.sHotelStreet == model.hotelsModule.hotelTotalInfo.sHotelStreet); // input from keyboard
		}
	}
}