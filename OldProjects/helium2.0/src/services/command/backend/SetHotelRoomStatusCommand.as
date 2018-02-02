package services.command.backend
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.backend.SetHotelRoomStatusDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.hotels.SetHotelRoomStatusEvent;

	/**
	* The SetHotelRoomStatusCommand class is 
	*
	* @author Anton Kirzyk / Ramada
	 * @update Viktor Potapov / Ramada
	*
	* @version $Revision 1.1 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/
	public class SetHotelRoomStatusCommand extends BaseCommand
	{
		
		override public function execute(event:CairngormEvent):void
		{
			 _event = SetHotelRoomStatusEvent(event);
			var delegate:SetHotelRoomStatusDelegate = new SetHotelRoomStatusDelegate( this );			
			delegate.setHotelRoomStatus(event as SetHotelRoomStatusEvent);
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{	
			super.result( data );
		}
		
		
		
	}
}