package services.command.hotels
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.hotels.HotelsDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.hotels.GetHotelStageListEvent;
	
	import mx.collections.ArrayCollection;

	public class GetHotelStageListCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = GetHotelStageListEvent( event );
			var delegate:HotelsDelegate = new HotelsDelegate( this );
			
			delegate.getHotelStageList( _event as  GetHotelStageListEvent);
			super.execute(event);
		}
		
		override public function result(data:Object):void
		{
			model.hotelsModule.stageDP = new ArrayCollection( data as Array );
			super.result(data);			
			
		}
		
		
	}
}