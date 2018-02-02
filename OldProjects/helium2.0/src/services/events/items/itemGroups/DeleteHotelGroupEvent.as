package services.events.items.itemGroups
{
	import services.cairngorm.BaseEvent;
	
	public class DeleteHotelGroupEvent extends BaseEvent
	{
		// ----------------------------------------------------------- //
		//                          VARIABLES                          //
		// ----------------------------------------------------------- //
		/**
		 *  This property contain id of removing main group.
		 */
		private var _groupId:Number;
		/**
		 *  This property contain index of removing main group in 
		 *  data provider.
		 */
		private var _groupIndex:int;
		
		// ----------------------------------------------------------- //
		//                    METHODS AND FUNCTIONS                    //
		// ----------------------------------------------------------- //
		/**
		 *  DeleteHotelGroupEvent. Constructor.
		 *  
		 *  @param type:String is the type of the event, accessible
		 *         as Event.type.
		 */
		public function DeleteHotelGroupEvent(type:String)
		{
			super(type);
		}
		
		// ----------------------------------------------------------- //
		//                      GETTER AND SETTER                      //
		// ----------------------------------------------------------- //
		/**
		 *  id of removing hotel main group.
		 */
		public function get groupId():Number
		{
			return _groupId;
		}
		/**
		 *  @private
		 */
		public function set groupId(value:Number):void
		{
			_groupId = value;
		}
		
		/**
		 *  The index of removing main group in data provider.
		 */
		public function get groupIndex():int
		{
			return _groupIndex;
		}
		/**
		 *  @private
		 */
		public function set groupIndex(value:int):void
		{
			_groupIndex = value;
		}
	}
}