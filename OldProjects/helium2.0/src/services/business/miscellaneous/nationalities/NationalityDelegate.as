package services.business.miscellaneous.nationalities
{
	import services.cairngorm.BaseDelegate;
	import services.events.miscellaneous.nationalities.AddNationalitiesEvent;
	import services.events.miscellaneous.nationalities.DeleteNationalityEvent;
	import services.events.miscellaneous.nationalities.GetNationalityEvent;
	import framework.module.CommonModule;
	import services.Services;
	import services.vo.GlobalStorage;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;


	/**
	* The NationalityDelegate class is
	*
	* @author Viktor Potapov / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-10-05 11:28:29 +0300 (Mon, 05 Oct 2009) $
	*
	*/
	public class NationalityDelegate extends BaseDelegate
	{
		public static const SAVE_NATIONALITIES:String = "SaveNationalities";
		public static const DELETE_NATIONALITY:String = "DeleteNationalities";
		public static const GET_NATIONALITIES:String = "GetNationalitiesList";

		
		/**
		 *  CountryDelegate. Constructor.
		 *  
		 *  @param responder:IResponder - contact provider for any service.
		 */
		public function NationalityDelegate(responder:IResponder)
		{
			super(responder);
		}
		/**
		 *  Remote call to add nationality.
		 *  
		 *  @param event:AddNationalitiesEvent
		 */
		public function addNationality(event:AddNationalitiesEvent):void
		{
			service.getRemoteObject(Services.SERVICE_NATIONALITY).getOperation(SAVE_NATIONALITIES).addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_NATIONALITY).getOperation(SAVE_NATIONALITIES).send(CommonModule.userOptions, event.nationality);
		}
	
		/**
		 *  Remote call to delete nationality.
		 *  
		 *  @param event:DeleteNationalityEvent
		 */
		public function deleteNationality(event:DeleteNationalityEvent):void
		{
			service.getRemoteObject(Services.SERVICE_NATIONALITY).getOperation(DELETE_NATIONALITY).addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_NATIONALITY).getOperation(DELETE_NATIONALITY).send(CommonModule.userOptions, event.nationality);
		}
		
		
		/**
		 *  Remote call to get nationality.
		 *  
		 *  @param event:GetNationalityEvent
		 */
		public function getNationality(event:GetNationalityEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_NATIONALITY).getOperation(GET_NATIONALITIES)
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions);
		}
		
	}
}