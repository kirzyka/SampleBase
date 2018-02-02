package services.events.items.itemGroups
{
	import services.cairngorm.BaseEvent;

	public class GetSystemGroupsListEvent extends BaseEvent
	{
		// ----------------------------------------------------------- //
		//                    METHODS AND FUNCTIONS                    //
		// ----------------------------------------------------------- //
		/**
		 *  GetSystemGroupsListEvent. Constructor.
		 *  
		 *  @param type:String is the type of the event, accessible
		 *         as Event.type.
		 */
		public function GetSystemGroupsListEvent(type:String)
		{
			super(type);
		}
	}
}