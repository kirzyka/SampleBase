package services.events.items.itemGroups
{
	import services.cairngorm.BaseEvent;
	import services.vo.items.ItemsGroupVO;

	public class SaveSystemGroupEvent extends BaseEvent
	{
		// ----------------------------------------------------------- //
		//                          VARIABLES                          //
		// ----------------------------------------------------------- //
		/**
		 *  This properety contain item for saving.
		 *  
		 *  @default new ItemsGroupVO()
		 *  
		 *  @see services.vo.backend.ItemsGroupVO
		 */
		private var _group:ItemsGroupVO = new ItemsGroupVO();
		
		// ----------------------------------------------------------- //
		//                    METHODS AND FUNCTIONS                    //
		// ----------------------------------------------------------- //
		/**
		 *  SaveSystemGroupEvent. Constructor.
		 *  
		 *  @param type:String is the type of the event, accessible
		 *         as Event.type.
		 */
		public function SaveSystemGroupEvent(type:String)
		{
			super(type);
		}
		
		// ----------------------------------------------------------- //
		//                      GETTER AND SETTER                      //
		// ----------------------------------------------------------- //
		/**
		 *  Item for saving.
		 */
		public function get group():ItemsGroupVO
		{
			return _group;
		}
		/**
		 *  @private
		 */
		public function set group(value:ItemsGroupVO):void
		{
			_group = value;
		}
	}
}