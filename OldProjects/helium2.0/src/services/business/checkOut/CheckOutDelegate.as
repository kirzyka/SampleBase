package services.business.checkOut
{
	import framework.module.CommonModule;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	import services.Services;
	import services.cairngorm.BaseDelegate;
	import services.events.checkOut.AcceptPaymentsEvent;
	import services.events.checkOut.AddDebitorPaymentEvent;
	import services.events.checkOut.AddNewItemsEvent;
	import services.events.checkOut.AddPaymentEvent;
	import services.events.checkOut.AddPaymentsEvent;
	import services.events.checkOut.AdjustItemEvent;
	import services.events.checkOut.AttachItemToAccountEvent;
	import services.events.checkOut.AttachPackageToAccountEvent;
	import services.events.checkOut.DeleteItemEvent;
	import services.events.checkOut.DeletePaymentEvent;
	import services.events.checkOut.DetachItemToAccountEvent;
	import services.events.checkOut.DetachItemsToAccountEvent;
	import services.events.checkOut.DetachPackageFromAccountEvent;
	import services.events.checkOut.DetachPaymentsFromAccountEvent;
	import services.events.checkOut.GetCheckoutStateEvent;
	import services.events.checkOut.GetCheckoutStateFromInHouseEvent;
	import services.events.checkOut.GetCheckoutStateFromInvoiceEvent;
	import services.events.checkOut.GetGuestListEvent;
	import services.events.checkOut.GetItemsRoutingEvent;
	import services.events.checkOut.GetReservationSummaryEvent;
	import services.events.checkOut.MergeItemsEvent;
	import services.events.checkOut.PrintActualReportEvent;
	import services.events.checkOut.PrintDebitReportEvent;
	import services.events.checkOut.SplitItemEvent;
	import services.events.checkOut.UnmergeItemEvent;

	public class CheckOutDelegate extends BaseDelegate
	{
		public static const GET_GUEST_LIST:String = "getGuestList";
		public static const GET_CHECKOUT_STATE:String = "GetCheckoutState";
		public static const GET_CHECKOUT_STATE_FROM_INVOICE:String = "GetCheckoutStateFromInvoice";
		public static const ADD_NEW_ITEMS:String = "AddNewItems";
		public static const DELETE_ITEM:String = "DeleteItem";
		public static const SPLIT_ITEM:String = "SplitItem";
		public static const ADJUST_ITEM:String = "AdjustItem";
		public static const MERGE_ITEMS:String = "MergeItems";
		public static const UNMERGE_ITEM:String = "unmergeItem";	
		public static const PRINT_DEBIT_REPORT:String = "PrintDebitReport";
		public static const ATTACH_ITEMS_TO_ACCOUNT:String = "AttachItemsToAccount";
		public static const DETACH_ITEM_TO_ACCOUNT:String = "DetachItemFromAccount";
		public static const DETACH_ITEMS_TO_ACCOUNT:String = "DetachItemsFromAccount";
		public static const ATTACH_PACKAGES_TO_ACCOUNT:String = "AttachPackagesToAccount";
		public static const DETACH_PACKAGE_FROM_ACCOUNT:String = "DetachPackageFromAccount";
		public static const ADD_PAYMENT:String = "AddPayment";
		public static const ADD_PAYMENTS:String = "AddPayments";
		public static const DELETE_PAYMENT:String = "DeletePayment";
		public static const GET_ITEMS_ROUTING:String = "GetItemsRouting";
		public static const GET_RESERVATION_SUMMARY:String = "GetReservationSummary";
		public static const GET_CHECK_OUT_STATE_IN_HOUSE:String = "GetCheckoutStateFromInHouse";
		public static const ACCEPT_PAYMENTS:String = "AcceptPayments";
		public static const ADD_DEBITOR_PAYMENT:String = "AddDebitorPayment";
		public static const PRINT_ACTUAL_REPORT:String = "PrintActualReport";
		public static const DETACH_PAYMENTS_FROM_ACCOUNT:String = "DetachPaymentsFromAccount";

		/**
		 *  CheckOutDelegate. Constructor.
		 *
		 *  @param responder:IResponder - contact provider for any service.
		 */
		public function CheckOutDelegate(responder:IResponder)
		{
			super(responder);
		}
		/**
		 *  Remote call to get guest list.
		 *
		 *  @param event:GetGuestListEvent
		 */
		public function getGuestList(event:GetGuestListEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_CHECK_OUT).getOperation(GET_GUEST_LIST);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.checkOutSearch, model.hotelsModule.hotelTotalInfo.iHotelId,  event.currentPage, event.countOnPage, event.searchType);
		}
		/**
		 *  Remote call to get check out state.
		 *
		 *  @param event:GetCheckoutStateEvent
		 */
		public function getCheckoutState(event:GetCheckoutStateEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_CHECK_OUT).getOperation(GET_CHECKOUT_STATE);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.hotelId, event.profileIds);
		}
		/**
		 *  Remote call to get check out state.
		 *
		 *  @param event:GetCheckoutStateFromInvoiceEvent
		 */
		public function getCheckoutStateForInvoice(event:GetCheckoutStateFromInvoiceEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_CHECK_OUT).getOperation(GET_CHECKOUT_STATE_FROM_INVOICE);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.hotelId, event.profileIds);
		}

		/**
		 *  Remote call to get routing items for in house.
		 *
		 *  @param event:GetItemsRoutingEvent
		 */
		public function getItemsRouting(event:GetItemsRoutingEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_CHECK_OUT).getOperation(GET_ITEMS_ROUTING);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.hotelId, event.profileIds);
		}
		/**
		 *  Remote call to get reservation summary for in house.
		 *
		 *  @param event:GetReservationSummaryEvent
		 */
		public function getReservationSummary(event:GetReservationSummaryEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_CHECK_OUT).getOperation(GET_RESERVATION_SUMMARY);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.profileIds);
		}

		/**
		 *  Remote call to add items to check outed guest.
		 *
		 *  @param event:AddNewItemsEvent
		 */
		public function addNewItems(event:AddNewItemsEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_CHECK_OUT).getOperation(ADD_NEW_ITEMS);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.hotelId, event.paymentLineId, event.addedItems,
							event.cashierShiftId);
		}
		/**
		 *  Remote call to delete item from check out guest.
		 *
		 *  @param event:DeleteItemEvent
		 */
		public function deleteItem(event:DeleteItemEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_CHECK_OUT).getOperation(DELETE_ITEM);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.id);
		}

		/**
		 *  Remote call to split item by check outed guest.
		 *
		 *  @param event:SplitItemEvent
		 */
		public function splitItem(event:SplitItemEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_CHECK_OUT).getOperation(SPLIT_ITEM);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.itemId, event.absolute, event.value);
		}

		/**
		 *  Remote call to adjust item by check out guest.
		 *
		 *  @param event:AdjustItemEvent
		 */
		public function adjustItem(event:AdjustItemEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_CHECK_OUT).getOperation(ADJUST_ITEM);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.id, event.absolute, event.value, event.reason);
		}

		/**
		 *  Remote call to merge selected items by arrangements codes for check out guest.
		 *
		 *  @param event:MergeItemsEvent
		 */
		public function mergeItems(event:MergeItemsEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_CHECK_OUT).getOperation(MERGE_ITEMS);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.itemMergeIds, event.argId);
		}

		/**
		 *  Remote call to merge selected items by arrangements codes for check out guest.
		 *
		 *  @param event:UnmergeItemsEvent
		 */
		public function unmergeItem(event:UnmergeItemEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_CHECK_OUT).getOperation(UNMERGE_ITEM);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.itemId);
		}

		/**
		 *  Remote call to prite debit invoice.
		 *
		 *  @param event:PrintDebitReportEvent
		 */
		public function printDebitReport(event:PrintDebitReportEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_CHECK_OUT).getOperation(PRINT_DEBIT_REPORT);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.paymentId, event.hotelId, event.isConference, event.roomId);
		}

		/**
		 *  Remote call to attach items to account.
		 *
		 *  @param event:AttachItemToAccountEvent
		 */
		public function attachItemsToAccount(event:AttachItemToAccountEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_CHECK_OUT).getOperation(ATTACH_ITEMS_TO_ACCOUNT);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.accountId, event.accountType, event.paymentLineId, event.itemIds);
		}

		/**
		 *  Remote call to detach attached items to account from this account.
		 *
		 *  @param event:DetachItemToAccountEvent
		 */
		public function detachItemsToAccount(event:DetachItemsToAccountEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_CHECK_OUT).getOperation(DETACH_ITEMS_TO_ACCOUNT);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.itemIds);
		}
		/**
		 *  Remote call to detach attached item to account from this account.
		 *
		 *  @param event:DetachItemToAccountEvent
		 */
		public function detachItemToAccount(event:DetachItemToAccountEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_CHECK_OUT).getOperation(DETACH_ITEM_TO_ACCOUNT);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.itemId);
		}
		/**
		 *  Remote call to add payment to guest.
		 *
		 *  @param event:AddPaymentEvent
		 */
		public function addPayment(event:AddPaymentEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_CHECK_OUT).getOperation(ADD_PAYMENT);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.payment);
		}

		/**
		 *  Remote call to add payments to guest.
		 *
		 *  @param event:AddPaymentEvent
		 */
		public function addPayments(event:AddPaymentsEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_CHECK_OUT).getOperation(ADD_PAYMENTS);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.payments, event.hotelId, event.isNeedToPrintReport, event.cashierShiftId);
		}

		/**
		 *  Remote call to remove payment to guest.
		 *
		 *  @param event:DeletePaymentEvent
		 */
		public function removePayment(event:DeletePaymentEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_CHECK_OUT).getOperation(DELETE_PAYMENT);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.paymentId);
		}

		/**
		 *  Remote call to check out guset from in house.
		 *
		 *  @param event:GetCheckoutStateFromInHouseEvent
		 */
		public function getCheckoutStateFromInHouse(event:GetCheckoutStateFromInHouseEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_CHECK_OUT).getOperation(GET_CHECK_OUT_STATE_IN_HOUSE);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.hotelId, event.roomId, event.someDate);
		}

		/**
		 *  Remote call to accept payments.
		 *
		 *  @param event:AcceptPaymentsEvent
		 */
		public function acceptPayments(event:AcceptPaymentsEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_CHECK_OUT).getOperation(ACCEPT_PAYMENTS);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.hotelId, event.paymentLineId, event.paymentsIds, event.isTryToCloseLine, event.roomId, event.departureDate, event.bIsConference);
		}

		/**
		 *  Remote call to attach package to account.
		 *
		 *  @param event:AttachPackageToAccountEvent
		 */
		public function attachPackagesToAccount(event:AttachPackageToAccountEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_CHECK_OUT).getOperation(ATTACH_PACKAGES_TO_ACCOUNT);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.packageIds, event.paymentLineId, event.accountId, event.accountType);
		}

		/**
		 *  Remote call to detach attached package from account.
		 *
		 *  @param event:DetachPackageFromAccountEvent
		 */
		public function detachPackageFromAccount(event:DetachPackageFromAccountEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_CHECK_OUT).getOperation(DETACH_PACKAGE_FROM_ACCOUNT);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.packageId, event.paymentLineId, event.accountId);
		}

		/**
		 *  Remote call to add deposit payment by debitor account.
		 *
		 *  @param event:AddDepositPaymentEvent
		 */
		public function addDebitorPayment(event:AddDebitorPaymentEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_CHECK_OUT).getOperation(ADD_DEBITOR_PAYMENT);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.mapPayment, event.hotelId, event.cashierShiftId, event.paymentToAttach);
		}

		/**
		 *  Remote call to print actual reptort.
		 *
		 *  @param event:PrintActualReportEvent
		 */
		public function printActualReport(event:PrintActualReportEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_CHECK_OUT).getOperation(PRINT_ACTUAL_REPORT);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.paymentLineId, event.hotelId, event.isConference, event.roomId, event.aVirtualPayments);
		}

		/**
		 *  Remote call to detach payment from account.
		 *
		 *  @param event:DetachPaymentFromAccountEvent
		 */
		public function detachPaymentFromAccount(event:DetachPaymentsFromAccountEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_CHECK_OUT).getOperation(DETACH_PAYMENTS_FROM_ACCOUNT);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.paymentIds, event.parentPaymentId);
		}
	}
}