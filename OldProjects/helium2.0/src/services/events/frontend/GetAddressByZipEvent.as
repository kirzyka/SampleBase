package services.events.frontend
{
	import com.adobe.cairngorm.control.CairngormEvent;
	/**
	 *  Event for find addreses by zip code.
	 *  
	 *  @author Artemyev Dmitriy
	 *  @date 05.06.2009
	 */
	public class GetAddressByZipEvent extends CairngormEvent
	{
		/**
		 *  This property contain view of zip code.
		 */
		public var zipCode:String;
		/**
		 *  GetAddressByZipEvent. Constructor.
		 */
		public function GetAddressByZipEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}