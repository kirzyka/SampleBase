package services.business.miscellaneous.vat
{
	import services.cairngorm.BaseDelegate;
	import services.events.miscellaneous.vat.AddVATEvent;
	import services.events.miscellaneous.vat.DeleteVATEvent;
	import services.events.miscellaneous.vat.EditVATEvent;
	import services.events.miscellaneous.vat.GetVATDataEvent;
	import framework.module.CommonModule;
	import services.Services;
	import services.vo.GlobalStorage;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;


	/**
	* The VATDelegate class is
	*
	* @author Viktor Potapov / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-10-05 11:28:29 +0300 (Mon, 05 Oct 2009) $
	*
	*/
	public class VATDelegate extends BaseDelegate
	{
		/**
		 *  CountryDelegate. Constructor.
		 *  
		 *  @param responder:IResponder - contact provider for any service.
		 */
		public function VATDelegate(responder:IResponder)
		{
			super(responder);
		}
		/**
		 *  Remote call to add VAT.
		 *  
		 *  @param event:AddVATEvent
		 */
		public function addVAT(event:AddVATEvent):void
		{
			service.getRemoteObject(Services.SERVICE_SYSTEM_VAT).getOperation("AddNewVat").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_SYSTEM_VAT).getOperation("AddNewVat").send(CommonModule.userOptions, event.vat);
		}
	
		/**
		 *  Remote call to delete VAT.
		 *  
		 *  @param event:DeleteVATEvent
		 */
		public function deleteVAT(event:DeleteVATEvent):void
		{
			service.getRemoteObject(Services.SERVICE_SYSTEM_VAT).getOperation("DeleteVat").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_SYSTEM_VAT).getOperation("DeleteVat").send(CommonModule.userOptions, event.vat);
		}
		
		
		/**
		 *  Remote call to get VAT.
		 *  
		 *  @param event:GetVATDataEvent
		 */
		public function getVAT(event:GetVATDataEvent):void
		{
			service.getRemoteObject(Services.SERVICE_SYSTEM_VAT).getOperation("GetVatList").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_SYSTEM_VAT).getOperation("GetVatList").send(CommonModule.userOptions);
		}
		
		public function editVAT(evt:EditVATEvent):void
		{
			service.getRemoteObject(Services.SERVICE_SYSTEM_VAT).getOperation("EditVat").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_SYSTEM_VAT).getOperation("EditVat").send(CommonModule.userOptions, evt.vat);
		}
		
	}
}