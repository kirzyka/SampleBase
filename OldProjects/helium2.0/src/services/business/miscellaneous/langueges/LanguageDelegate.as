package services.business.miscellaneous.langueges
{
	import services.cairngorm.BaseDelegate;
	import services.events.miscellaneous.langueges.AddLanguageEvent;
	import services.events.miscellaneous.langueges.DeleteLanguageEvent;
	import services.events.miscellaneous.langueges.GetLanguageEvent;
	import framework.module.CommonModule;
	import services.Services;
	import services.vo.GlobalStorage;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;


	/**
	* The LanguageDelegate class is
	*
	* @author Viktor Potapov / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-10-05 11:28:29 +0300 (Mon, 05 Oct 2009) $
	*
	*/
	public class LanguageDelegate extends BaseDelegate
	{
		public static const SAVE_LANGUAGE:String = "SaveLanguage";
		public static const DELETE_LANGUAGE:String = "DeleteLanguage";
		public static const GET_LANGUAGE_LIST:String = "GetLanguageList";

		
		/**
		 *  CountryDelegate. Constructor.
		 *  
		 *  @param responder:IResponder - contact provider for any service.
		 */
		public function LanguageDelegate(responder:IResponder)
		{
			super(responder);
		}
		/**
		 *  Remote call to add language.
		 *  
		 *  @param event:AddLanguageEvent
		 */
		public function addLanguage(event:AddLanguageEvent):void
		{
			service.getRemoteObject(Services.SERVICE_LANGUAGE).getOperation(SAVE_LANGUAGE).addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_LANGUAGE).getOperation(SAVE_LANGUAGE).send(CommonModule.userOptions, event.language);
		}
	
		/**
		 *  Remote call to delete language.
		 *  
		 *  @param event:DeleteLanguageEvent
		 */
		public function deleteLanguage(event:DeleteLanguageEvent):void
		{
			service.getRemoteObject(Services.SERVICE_LANGUAGE).getOperation(DELETE_LANGUAGE).addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_LANGUAGE).getOperation(DELETE_LANGUAGE).send(CommonModule.userOptions, event.language);
		}
		
		
		/**
		 *  Remote call to get Language.
		 *  
		 *  @param event:GetLanguageEvent
		 */
		public function getLanguage(event:GetLanguageEvent):void
		{
			service.getRemoteObject(Services.SERVICE_LANGUAGE).getOperation(GET_LANGUAGE_LIST).addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_LANGUAGE).getOperation(GET_LANGUAGE_LIST).send(CommonModule.userOptions);
		}
		
	}
}