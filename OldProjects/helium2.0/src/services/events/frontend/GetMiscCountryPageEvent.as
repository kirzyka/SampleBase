package services.events.frontend
{
	import services.cairngorm.BaseEvent;

	public class GetMiscCountryPageEvent extends BaseEvent
	{
		/**
		 *  This property contain call back function for executing some functions
		 *  if user get result's handler after call remote function from the server.
		 */		 		
		public var loadDefault:Boolean = true;
		/**
		 *  This property contain id of owner country for 
		 *  neccessary region.
		 */
		public var countryId:Number;
		
		public function GetCountryEvent(type:String)
		{
			super(type);
		}
		
	}
}