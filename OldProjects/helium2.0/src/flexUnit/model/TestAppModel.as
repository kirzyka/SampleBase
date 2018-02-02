package flexUnit.model
{
	import flexUnit.model.data.TestTransactionsData;
	import flexUnit.model.data.TestHotelData;
	import flexUnit.model.data.TestReservationData;
	
	
	[Bindable]
	public class TestAppModel
	{
		private static var instance:TestAppModel;
		
		/**
		 *  AppModelLocator. Constructor.
		 */
		public function TestAppModel()
		{
			testHotelData = new TestHotelData();
			testReservationData = new TestReservationData();
			testTransactionsData = new TestTransactionsData();
		}
		
		public static function getInstance():TestAppModel
		{
			if(instance == null) instance = new TestAppModel();
			
			return instance;
		}
		
		//------------------------------------------------
		
		public var testHotelData:TestHotelData;
		public var testReservationData:TestReservationData;
		public var testTransactionsData:TestTransactionsData;
	}
}