package services.events.items.management
{
	import services.cairngorm.BaseEvent;

	public class GetAllowedHotelsEvent extends BaseEvent
	{
		// ----------------------------------------------------------- //
		//                    METHODS AND FUNCTIONS                    //
		// ----------------------------------------------------------- //
		/**
		 *  GetAllowedHotelsEvent. Constructor.
		 *  
		 *  @param type:String is the type of the event, accessible
		 *         as Event.type.
		 */
		public function GetAllowedHotelsEvent(type:String)
		{
			super(type);
		}
	}
}