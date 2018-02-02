package services.business.miscellaneous.salutation
{
	import services.cairngorm.BaseDelegate;
	import services.events.miscellaneous.salutation.AddSalutationEvent;
	import services.events.miscellaneous.salutation.DeleteSalutationEvent;
	import services.events.miscellaneous.salutation.GetSalutationEvent;
	import framework.module.CommonModule;
	import services.Services;
	import services.vo.GlobalStorage;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;


	/**
	* The SalutationDelegate class is
	*
	* @author Viktor Potapov / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-10-05 11:28:29 +0300 (Mon, 05 Oct 2009) $
	*
	*/
	public class SalutationDelegate extends BaseDelegate
	{
		public static const SAVE_SALUTATION:String = "SaveSalutation";
		public static const DELETE_SALUTATION:String = "DeleteSalutation";
		public static const GET_SALUTATION_LIST:String = "GetSalutationList";

		
		/**
		 *  CountryDelegate. Constructor.
		 *  
		 *  @param responder:IResponder - contact provider for any service.
		 */
		public function SalutationDelegate(responder:IResponder)
		{
			super(responder);
		}
		/**
		 *  Remote call to add Salutation.
		 *  
		 *  @param event:AddSalutationEvent
		 */
		public function addSalutation(event:AddSalutationEvent):void
		{
			service.getRemoteObject(Services.SERVICE_SALUTATION).getOperation(SAVE_SALUTATION).addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_SALUTATION).getOperation(SAVE_SALUTATION).send(CommonModule.userOptions, event.salutation);
		}
	
		/**
		 *  Remote call to delete Salutation.
		 *  
		 *  @param event:DeleteSalutationEvent
		 */
		public function deleteSalutation(event:DeleteSalutationEvent):void
		{
			service.getRemoteObject(Services.SERVICE_SALUTATION).getOperation(DELETE_SALUTATION).addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_SALUTATION).getOperation(DELETE_SALUTATION).send(CommonModule.userOptions, event.salutation);
		}
		
		
		/**
		 *  Remote call to get Salutation.
		 *  
		 *  @param event:GetSalutationEvent
		 */
		public function getSalutation(event:GetSalutationEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_SALUTATION).getOperation(GET_SALUTATION_LIST);			
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.languageId);
		}
		
	}
}