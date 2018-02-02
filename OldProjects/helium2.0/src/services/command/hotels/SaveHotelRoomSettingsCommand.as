package services.command.hotels
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.hotels.HotelsDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.hotels.SaveHotelRoomSettingsEvent;

	/**
	 *  Command for save Hotel Room Setting.
	 *  
	 *  @author Potapov Viktor
	 *  @date 21.07.2009 (update)
	 */
	public class SaveHotelRoomSettingsCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = SaveHotelRoomSettingsEvent(event);
			var delegate:HotelsDelegate = new HotelsDelegate( this );
			 
			delegate.saveHotelRoomSettings(_event as SaveHotelRoomSettingsEvent);
			super.execute(event);
		}
		
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			super.result(data);
		}
		
	}
}