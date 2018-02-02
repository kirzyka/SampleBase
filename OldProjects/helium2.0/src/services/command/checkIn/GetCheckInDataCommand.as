package services.command.checkIn
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.checkIn.GetCheckInDataDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.checkIn.GetCheckInDataEvent;
	
	import mx.collections.ArrayCollection;

	public class GetCheckInDataCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = GetCheckInDataEvent( event );
			var delegate:GetCheckInDataDelegate = new GetCheckInDataDelegate( this );
			  
			delegate.getCheckInData( _event as GetCheckInDataEvent );
			super.execute( event );
		}
		 
		override public function result(data:Object):void
		{
			if(data != null ) 
			{
				model.checkInModule.checkInData = new ArrayCollection( (data as Array)[0] );
				model.checkInModule.floorsData = new ArrayCollection( (data as Array)[1] );
				model.checkInModule.counter = (data as Array)[2];
			}
			super.result( data );
		}
		
	}
}