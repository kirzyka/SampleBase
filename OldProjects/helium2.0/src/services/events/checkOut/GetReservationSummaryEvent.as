package services.events.checkOut
{
	import services.cairngorm.BaseEvent;

	public class GetReservationSummaryEvent extends BaseEvent
	{
		// ===================================================================== //
		//                        VARIABLES AND CONSTANTS                        //
		// ===================================================================== //
		/**
		 *  This property is list with profile's id.
		 */
		private var _profileIds:Array;
		
		// ===================================================================== //
		//                      COMMON METHODS AND HANDLERS                      //
		// ===================================================================== //
		/**
		 *  GetReservationSummaryEvent. Constructor.
		 *
		 *  @param type:String — The type of the event, accessible as BaseEvent
		 */
		public function GetReservationSummaryEvent(type:String)
		{
			super(type);
		}
		
		// ===================================================================== //
		//                       GETTER AND SETTER HANDLERS                      //
		// ===================================================================== //
		/**
		 *  The list with profile's id.
		 */
		public function get profileIds():Array
		{
			return _profileIds;
		}
		/**
		 *  @private
		 */
		public function set profileIds(value:Array):void
		{
			_profileIds = value;
		}
	}
}