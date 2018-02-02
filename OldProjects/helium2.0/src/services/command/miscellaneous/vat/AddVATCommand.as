package services.command.miscellaneous.vat
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import services.business.miscellaneous.vat.VATDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.miscellaneous.vat.AddVATEvent;
	import services.vo.backend.VatObjectVO;

	public class AddVATCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = AddVATEvent( event );
			var delegate:VATDelegate = new VATDelegate( this );			
			delegate.addVAT(_event as AddVATEvent);
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			model.vatModule.vatDP.addItem(data as VatObjectVO);	
			super.result( data );
		}
		
	}
}