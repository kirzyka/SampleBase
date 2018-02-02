package services.command.miscellaneous.salutation
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.miscellaneous.salutation.SalutationDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.miscellaneous.salutation.GetSalutationEvent;
	import services.vo.GlobalStorage;
	
	import mx.collections.ArrayCollection;

	public class GetSalutationCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = GetSalutationEvent( event );
			var delegate:SalutationDelegate = new SalutationDelegate( this );
			
			delegate.getSalutation( _event as GetSalutationEvent );
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			GlobalStorage.salutation = new ArrayCollection( data as Array );
			
			super.result( data );
		}
		
		
	}
}