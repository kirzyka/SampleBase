package services.command.miscellaneous.vat
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.miscellaneous.vat.VATDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.miscellaneous.vat.EditVATEvent;

	public class EditVATCommand extends BaseCommand
	{	
		override public function execute(event:CairngormEvent):void
		{
			_event = EditVATEvent( event );
			var delegate:VATDelegate = new VATDelegate( this );
			
			delegate.editVAT(_event as EditVATEvent);
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			if(data)
			{
				model.vatModule.vatDP.setItemAt((_event as EditVATEvent).vat, (_event as EditVATEvent).index);
			}
			
			super.result( data );
		}
		
	}
}