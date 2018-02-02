package framework.module
{
	import mx.collections.ArrayCollection;
	
	import services.vo.reservation.ReservationVO;

	[Bindable]
	public class ReservationEditModule
	{
		public var currPage:int = 0;
		//public var pageNames:Array = ["Search"];
		
		// --------------------------------------------------------------------- //
		// 				Result For Search Reservation	                         //
		// --------------------------------------------------------------------- //	

		public var individualReservationsCount:int = 0;
		public var individualReservationList:ArrayCollection = new ArrayCollection();				//ReservationViewVO
		public var groupReservationsCount:int = 0;
		public var groupReservationList:ArrayCollection = new ArrayCollection();					//ReservationViewVO		
		
		// --------------------------------------------------------------------- //
		// 				Edit Reservation	        			                 //
		// --------------------------------------------------------------------- //	
		
		public var reservationSearchMode:int = 0;// 0 - individual; 1 - group
		public var reservationForEdit:ReservationVO = new ReservationVO();
		public var reservationCanceletionReasons:ArrayCollection = new ArrayCollection(); 	//CancelationReason

	}
}