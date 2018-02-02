package services.events.items.itemGroups
{
	import services.cairngorm.BaseEvent;

	public class GetSystemItemsGroupsEvent extends BaseEvent
	{
		// ----------------------------------------------------------- //
		//                    METHODS AND FUNCTIONS                    //
		// ----------------------------------------------------------- //
		/**
		 *  GetSystemItemsGroupsEvent. Constructor.
		 *  
		 *  @param type:String is the type of the event, accessible
		 *         as Event.type.
		 */
		public function GetSystemItemsGroupsEvent(type:String)
		{
			super(type);
		}
	}
}