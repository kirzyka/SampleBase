package services.events.checkOut
{
	import services.cairngorm.BaseEvent;

	public class GetCheckoutStateFromInvoiceEvent extends BaseEvent
	{
		public static const GET_CHECKOUT_STATE_FROM_INVOICE:String = "GetCheckoutStateFromInvoice";
		// ----------------------------------------------------------- //
		//                          VARIABLES                          //
		// ----------------------------------------------------------- //
		/**
		 *  This property is list with ids of proiles by check out's room.
		 *
		 *  @default []
		 */
		private var _profileIds:Array = [];
		/**
		 *  This property is id of hotel.
		 *
		 *  @default 0
		 */
		private var _hotelId:Number = 0;

		// ----------------------------------------------------------- //
		//                    METHODS AND FUNCTIONS                    //
		// ----------------------------------------------------------- //
		/**
		 *  GetCheckoutStateFromInvoiceEvent. Constructor.
		 *
		 *  @param type:String is the type of the event, accessible
		 *         as Event.type.
		 */
		public function GetCheckoutStateFromInvoiceEvent()
		{
			super(GET_CHECKOUT_STATE_FROM_INVOICE, bubbles, cancelable);
		}

		// ----------------------------------------------------------- //
		//                      GETTER AND SETTER                      //
		// ----------------------------------------------------------- //
		/**
		 *  The list with ids of proiles by check out's room.
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

		/**
		 *  Id of hotel.
		 */
		public function get hotelId():Number
		{
			return _hotelId;
		}
		/**
		 *  @private
		 */
		public function set hotelId(value:Number):void
		{
			_hotelId = value;
		}
	}
}