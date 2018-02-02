package services.events.items.itemGroups
{
	import services.cairngorm.BaseEvent;
	
	public class ApplySystemGroupsToHotelEvent extends BaseEvent
	{
		// ----------------------------------------------------------- //
		//                          VARIABLES                          //
		// ----------------------------------------------------------- //
		/**
		 *  This property is system group, which will be added to
		 *  hotel groups.
		 */
		private var _sysGroups:Array = [];
		
		/**
		 *  This property is id of hotel.
		 */
		private var _hotelId:Number = 0;
		
		// ----------------------------------------------------------- //
		//                    METHODS AND FUNCTIONS                    //
		// ----------------------------------------------------------- //
		/**
		 *  ApplySystemGroupsToHotelEvent. Constructor.
		 *  
		 *  @param type:String is the type of the event, accessible
		 *         as Event.type.
		 */
		public function ApplySystemGroupsToHotelEvent(type:String)
		{
			super(type);
		}
		
		// ----------------------------------------------------------- //
		//                      GETTER AND SETTER                      //
		// ----------------------------------------------------------- //
		/**
		 *  The system group, which will be added to hotel groups.
		 */
		public function get sysGroups():Array
		{
			return _sysGroups;
		}
		/**
		 *  @private
		 */
		public function set sysGroups(value:Array):void
		{
			_sysGroups = value;
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