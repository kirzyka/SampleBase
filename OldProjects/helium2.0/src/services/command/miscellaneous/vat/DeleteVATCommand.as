package services.command.miscellaneous.vat
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import services.business.miscellaneous.vat.VATDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.miscellaneous.vat.DeleteVATEvent;
	import services.vo.backend.VatObjectVO;

	public class DeleteVATCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = DeleteVATEvent( event );
			var delegate:VATDelegate = new VATDelegate( this );			
			delegate.deleteVAT(_event as DeleteVATEvent);
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			var realIndex:int;
			
			for(var i:int=0;i<model.vatModule.vatDP.length;i++)
				if((model.vatModule.vatDP.getItemAt(i) as VatObjectVO).iVatId == (_event as DeleteVATEvent).vat.iVatId)
				{
					realIndex = i;
					break;
				}
			
			model.vatModule.vatDP.removeItemAt(realIndex);
			if (realIndex!=(_event as DeleteVATEvent).index)
			(_event as DeleteVATEvent).targetArray.removeItemAt((_event as DeleteVATEvent).index);
			
			super.result( data );
		}
	}
}