package services.events.frontend
{
	import services.cairngorm.BaseEvent;
	/**
	 *  The event to get cities by id of owner region.
	 *  
	 *  @author Artemyev Dmitriy
	 *  @date 08.06.2009
	 *  
	 *  @see com.adobe.cairngorm.control.CairngormEvent
	 */
	public class GetCityEvent extends BaseEvent
	{
		/**
		 *  This property contain id of owner region for 
		 *  neccessary city.
		 */
		public var regionId:Number;
		/**
		 *  GetCityEvent. Constructor.
		 */
		public function GetCityEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}