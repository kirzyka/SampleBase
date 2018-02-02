package services.events.profiles.individual
{
	import services.cairngorm.BaseEvent;

	public class GetProfilesPageEvent extends BaseEvent
	{
		/**
		 *  This property contain id of hotel for which to get the
		 *  sample pages.
		 */
		public var hotelId:Number;
		/**
		 *  This property contain index of page for get the sample
		 *  pages of profiles.
		 */
		public var page:int;
		/**
		 *  This property contain count of profiles in the page.
		 */
		public var count:int;
		/**
		 *  GetHotelProfilesPageEvent. Constructor.
		 *  
		 *  @param type:String - type of the dispatching event.
		 *  @param bubbles:Boolean - Indicates whether an event is a
		 *         bubbling event.
		 *  @param cancelable:Boolean - indicates whether the behavior
		 *         associated with the event can be prevented.
		 */
		public function GetProfilesPageEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}