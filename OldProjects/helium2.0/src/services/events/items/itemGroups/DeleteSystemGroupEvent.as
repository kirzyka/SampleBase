package services.events.items.itemGroups
{
	import services.cairngorm.BaseEvent;
	
	public class DeleteSystemGroupEvent extends BaseEvent
	{
		// ----------------------------------------------------------- //
		//                          VARIABLES                          //
		// ----------------------------------------------------------- //
		/**
		 *  This property contain id of removing system main group.
		 */
		private var _groupId:Number;
		/**
		 *  This property contain index of removing system main group in
		 *  data provider.
		 */
		private var _groupIndex:int;
		
		// ----------------------------------------------------------- //
		//                    METHODS AND FUNCTIONS                    //
		// ----------------------------------------------------------- //
		/**
		 *  DeleteSystemGroupEvent. Constructor.
		 *  
		 *  @param type:String is the type of the event, accessible
		 *         as Event.type.
		 */
		public function DeleteSystemGroupEvent(type:String)
		{
			super(type);
		}
		
		// ----------------------------------------------------------- //
		//                      GETTER AND SETTER                      //
		// ----------------------------------------------------------- //
		/**
		 *  Id of removing system main group.
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
		 *  The index of removing system main group in data provider.
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