package services.events.items.arrangementCodes
{
	import services.cairngorm.BaseEvent;

	public class GetArrangementsEvent extends BaseEvent
	{
		// ----------------------------------------------------------- //
		//                    METHODS AND FUNCTIONS                    //
		// ----------------------------------------------------------- //
		/**
		 *  GetArrangementsEvent. Constructor.
		 *  
		 *  @param type:String is the type of the event, accessible
		 *         as Event.type.
		 */
		public function GetArrangementsEvent(type:String)
		{
			super(type);
		}
	}
}