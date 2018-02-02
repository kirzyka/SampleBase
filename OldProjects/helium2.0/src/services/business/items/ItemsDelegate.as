package services.business.items
{
	import services.cairngorm.BaseDelegate;
	import services.events.items.arrangementCodes.DeleteArrangementEvent;
	import services.events.items.arrangementCodes.GetArrangementsEvent;
	import services.events.items.arrangementCodes.SaveArrangementsEvent;
	import services.events.items.itemGroups.ApplySystemGroupsToHotelEvent;
	import services.events.items.itemGroups.DeleteHotelGroupEvent;
	import services.events.items.itemGroups.DeleteHotelSubGroupEvent;
	import services.events.items.itemGroups.DeleteSystemGroupEvent;
	import services.events.items.itemGroups.DeleteSystemSubGroupEvent;
	import services.events.items.itemGroups.GetHotelItemsGroupsEvent;
	import services.events.items.itemGroups.GetSystemGroupsListEvent;
	import services.events.items.itemGroups.SaveSystemGroupEvent;
	import services.events.items.itemGroups.SaveSystemSubGroupEvent;
	import services.events.items.management.DeleteSystemArticleEvent;
	import services.events.items.management.DeleteSystemTransactionEvent;
	import services.events.items.management.GetAllowedHotelsEvent;
	import services.events.items.management.GetHotelTransactionsEvent;
	import services.events.items.management.GetSystemTransactionsEvent;
	import services.events.items.management.GetVatPeriodsEvent;
	import services.events.items.management.SaveHotelArticleEvent;
	import services.events.items.management.SaveHotelTransactionEvent;
	import services.events.items.management.SaveSystemArticleEvent;
	import services.events.items.management.SaveSystemTransactionEvent;
	import services.events.items.management.SaveVatPeriodEvent;
	import framework.module.CommonModule;
	import services.Services;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class ItemsDelegate extends BaseDelegate
	{
		/* Arrangement codes method's name */
		public static const DELETE_ARRANGEMENT:String = "DeleteArrangment";
		public static const GET_ARRANGEMENTS_LIST:String = "GetArrangementsList";
		public static const SAVE_ARRANGEMENTS:String = "SaveArrangments";
		/* Item's groups method's name */
		public static const APPLY_SYSTEM_GROUPS_TO_HOTEL:String = "ApplySystemGroupsToHotel";
		public static const DELETE_HOTEL_GROUP:String = "DeleteHotelGroup";
		public static const DELETE_HOTEL_SUB_GROUP:String = "DeleteHotelSubGroup";
		public static const DELETE_SYSTEM_GROUP:String = "DeleteSystemGroup";
		public static const DELETE_SYSTEM_SUB_GROUP:String = "DeleteSystemSubGroup";
		public static const GET_HOTEL_GROUPS:String = "GetHotelGroups";
		public static const GET_SYSTEM_GROUPS:String = "GetSystemGroupsList";
		public static const SAVE_SYSTEM_GROUP:String = "SaveSystemGroup";
		public static const SAVE_SYSTEM_SUB_GROUP:String = "SaveSystemSubGroup";
		/* Transaction managment method's name */
		public static const DELETE_SYSTEM_ARTICLE:String = "DeleteSystemArticle";
		public static const DELETE_SYSTEM_TRANSACTION:String = "DeleteSystemTransaction";
		public static const GET_ALLOWED_HOTELS:String = "GetAllowedHotels";
		public static const GET_HOTEL_TRANSACTIONS:String = "GetHotelTransactions";
		public static const SAVE_HOTEL_TRANSACTION:String = "SaveHotelTransaction";
		public static const SAVE_HOTEL_ARTICLE:String = "SaveHotelArticle";
		public static const GET_SYSTEM_TRANSACTIONS:String = "GetSystemTransactions";
		public static const SAVE_SYSTEM_ARTICLE:String = "SaveSystemArticle";
		public static const SAVE_SYSTEM_TRANSACTIONS:String = "SaveSystemTransaction";
		/*VAT perios*/
		public static const GET_VAT_PERIODS:String = "getVatPeriods";
		public static const SAVE_VAT_PERIOD:String = "saveVatPeriod";
		
		public function ItemsDelegate(responder:IResponder)
		{
			super(responder);
		}
		// ================================================================= //
		//                       ARRANGEMENT CODES                           //
		// ================================================================= //
		/**
		 *  Remote call to try to remove arrangement code.
		 *  
		 *  @param event:DeleteArrangmentEvent
		 */
		public function removeArrangement(event:DeleteArrangementEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_ITEMS_GROUP).getOperation(DELETE_ARRANGEMENT);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.codeId);
		}
		/**
		 *  Remote call for get arrangement codes list for transaction module.
		 *  
		 *  @param event:GetArrangementsListEvent
		 */
		public function getArrangementsList(event:GetArrangementsEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_ITEMS_GROUP).getOperation(GET_ARRANGEMENTS_LIST);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions);
		}
		/**
		 *  Remote call for update item of arragement code list.
		 *  
		 *  @param event:SaveArrangmentsEvent
		 */
		public function saveArragements(event:SaveArrangementsEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_ITEMS_GROUP).getOperation(SAVE_ARRANGEMENTS);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.code);
		}
		
		// ================================================================= //
		//                          ITEMS GROUPS                             //
		// ================================================================= //
		/**
		 *  Send request to the server to apply checked system groups
		 *  and their sub groups to groups hotel by the server.
		 *  
		 *  @param event:SetSysGroupsToHotelEvent
		 */
		public function setSysGroupsToHotel(event:ApplySystemGroupsToHotelEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_ITEMS_GROUP).getOperation(APPLY_SYSTEM_GROUPS_TO_HOTEL); 
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.sysGroups, event.hotelId);
		}
		/**
		 *  The method to call remote server function for removing main group
		 *  by id for hotel.
		 *  
		 *  @param event:DeleteHotelGroupEvent
		 */
		public function deleteHotelMainGroup(event:DeleteHotelGroupEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_ITEMS_GROUP).getOperation(DELETE_HOTEL_GROUP);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.groupId);
		}
		/**
		 *  The method to call remote server function for removing sub
		 *  group by id for hotel.
		 *  
		 *  @param event:DeleteHotelSubGroupEvent
		 */
		public function deleteHotelSubGroup(event:DeleteHotelSubGroupEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_ITEMS_GROUP).getOperation(DELETE_HOTEL_SUB_GROUP);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.subGroupId);
		}
		/**
		 *  The method to call remote server function for remove main
		 *  system group by id.
		 *  
		 *  @param event:DeleteHotelMainGroupEvent
		 */
		public function deleteSystemMainGroup(event:DeleteSystemGroupEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_ITEMS_GROUP).getOperation(DELETE_SYSTEM_GROUP);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.groupId);
		}
		/**
		 *  The method to call remote server function to remove system
		 *  sub group by id.
		 *  
		 *  @param event:DeleteSystemSubGroupEvent
		 */
		public function deleteSystemSubGroup(event:DeleteSystemSubGroupEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_ITEMS_GROUP).getOperation(DELETE_SYSTEM_SUB_GROUP);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.subGroupId);
		}
		/**
		 *  The method to call remote server function for get list of
		 *  groups for hotel by his id.
		 *  
		 *  @param event:GetHotelItemsGroupsEvent
		 */
		public function getHotelItemsGroups(event:GetHotelItemsGroupsEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_ITEMS_GROUP).getOperation(GET_HOTEL_GROUPS);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.hotelId);
		}
		/**
		 *  The method to call remote server function to get system
		 *  gropups.
		 *  
		 *  @param event:GetSystemGroupsListEvent
		 */
		public function getSystemItemsGroups(event:GetSystemGroupsListEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_ITEMS_GROUP).getOperation(GET_SYSTEM_GROUPS);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions);
		}
		/**
		 *  The method to call remote server function to save changes
		 *  by system group.
		 *  
		 *  @param event:SaveSystemGroupEvent
		 */
		public function saveSystemMainGroups(event:SaveSystemGroupEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_ITEMS_GROUP).getOperation(SAVE_SYSTEM_GROUP);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.group);
		}
		/**
		 *  The method to call remote server function to save changes
		 *  by system sub group.
		 *  
		 *  @param event:SaveSystemSubGroupEvent
		 */
		public function saveSystemSubGroup(event:SaveSystemSubGroupEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_ITEMS_GROUP).getOperation(SAVE_SYSTEM_SUB_GROUP); 
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.subGroups, event.groupId);
		}
		// ================================================================= //
		//                      TRANSACTION MANAGMENT                        //
		// ================================================================= //
		/**
		 *  The method to call remote server function to remove system
		 *  article by id.
		 *  
		 *  @param event:DeleteSystemArticleEvent
		 */
		public function deleteSystemArticle(event:DeleteSystemArticleEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_ITEMS_GROUP).getOperation(DELETE_SYSTEM_ARTICLE);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.articleId);
		}
		/**
		 *  The method to call remote server function to remove system
		 *  transacton by id.
		 *  
		 *  @param event:DeleteSystemTransactionEvent
		 */
		public function deleteSystemTransaction(event:DeleteSystemTransactionEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_ITEMS_GROUP).getOperation(DELETE_SYSTEM_TRANSACTION);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.sysGroupId);
		}
		/**
		 *  The method to call remote server function to get allowed
		 *  hotels by logined user.
		 *  
		 *  @param evt:GetAllowedHotelsEvent
		 */
		public function getAllowedHotels(event:GetAllowedHotelsEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_ITEMS_GROUP).getOperation(GET_ALLOWED_HOTELS);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions);
		}
		/**
		 *  The method to call remote server function to get hotel's
		 *  transactions by hotel id.
		 *  
		 *  @param event:GetHotelTransactionsEvent
		 */
		public function getHotelTransactions(event:GetHotelTransactionsEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_ITEMS_GROUP).getOperation(GET_HOTEL_TRANSACTIONS);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.pattern, event.hotelId, event.groupId, event.page, event.count);
		}
		/**
		 *  The method to call remote server function to save changes
		 *  in the hotel article by his id.
		 *  
		 *  @param event:SaveHotelArticleEvent
		 */
		public function saveHotelArticle(event:SaveHotelArticleEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_ITEMS_GROUP).getOperation(SAVE_HOTEL_ARTICLE);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.hotelId, event.hotelSubGroupId, event.hotelTransactionId, event.hotelItem);
		}
		/**
		 *  The method to call remote server function to save hotel's
		 *  transactions by hotel id.
		 *  
		 *  @param event:SaveHotelTransactionEvent
		 */
		public function saveHotelTransaction(event:SaveHotelTransactionEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_ITEMS_GROUP).getOperation(SAVE_HOTEL_TRANSACTION);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.hotelId, event.groupId, event.item);
		}
		/**
		 *  The method to call remote server function to get list of
		 *  system transactions.
		 *  
		 *  @param event:DeleteHotelSubGroupEvent
		 */
		public function getSystemTransactions(event:GetSystemTransactionsEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_ITEMS_GROUP).getOperation(GET_SYSTEM_TRANSACTIONS);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.pattern, event.sysGroupId, event.page, event.count);
		}
		/**
		 *  The method to call remote server function to save changes
		 *  in the article by his id.
		 *  
		 *  @param event:SaveSystemArticleEvent
		 */
		public function saveSystemArticle(event:SaveSystemArticleEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_ITEMS_GROUP).getOperation(SAVE_SYSTEM_ARTICLE);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.item, event.sysGroupId, event.sysTransactionId);
		}
		/**
		 *  The method to call remote server function to save changes
		 *  in the transaction by his id.
		 *  
		 *  @param event:SaveSystemTransactionEvent
		 */
		public function saveSystemTransaction(event:SaveSystemTransactionEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_ITEMS_GROUP).getOperation(SAVE_SYSTEM_TRANSACTIONS); 
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.item, event.sysGroupId);
		}
		
		/**
		 *  The method to call remote server function to get vat periods.
		 *
		 */
		public function getVatPeriods(event:GetVatPeriodsEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_ITEMS_GROUP).getOperation(GET_VAT_PERIODS);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.bBasicList, event.iItemId);
		}
		
		/**
		 *  The method to call remote server function to save vat periods.
		 *
		 */
		public function saveVatPeriods(event:SaveVatPeriodEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_ITEMS_GROUP).getOperation(SAVE_VAT_PERIOD);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.oVatPeriod);
		}
	}
}