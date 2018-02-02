package services.business.rates.companyRates
{
	import services.cairngorm.BaseDelegate;
	import services.events.rates.companyRates.DeleteCompanyRateEvent;
	import services.events.rates.companyRates.DeleteTransactionCompanyRateEvent;
	import services.events.rates.companyRates.GetCompanyRatesCountEvent;
	import services.events.rates.companyRates.GetCompanyRatesPageEvent;
	import services.events.rates.companyRates.GetGroupListCompanyRatesEvent;
	import services.events.rates.companyRates.GetItemCountCompanyRatesEvent;
	import services.events.rates.companyRates.GetItemPageCompanyRatesEvent;
	import services.events.rates.companyRates.GetTransactionListCompanyRateEvent;
	import services.events.rates.companyRates.SaveCompanyRateEvent;
	import services.events.rates.companyRates.SaveTransactionCompanyRateEvent;
	import framework.module.CommonModule;
	import services.Services;
	import services.vo.GlobalStorage;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	/**
	* The CompanyRatesDelegate class is
	*
	* @author Viktor Potapov / Ramada
	*
	* @version $Revision 2.0 $ $Date: 2009-10-05 11:28:29 +0300 (Mon, 05 Oct 2009) $
	*
	*/
	public class CompanyRatesDelegate extends BaseDelegate
	{
		public function CompanyRatesDelegate(responder:IResponder)
		{
			super(responder);
		}


		public function deleteCompanyRate(evt:DeleteCompanyRateEvent):void
		{
			service.getRemoteObject(Services.SERVICE_COMPANY_RATES).getOperation("deleteCompanyRate").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_COMPANY_RATES).getOperation("deleteCompanyRate").send(CommonModule.userOptions, evt.idCompanyRate);
		}

		public function deleteTransactionCompanyRate(evt:DeleteTransactionCompanyRateEvent):void
		{
			service.getRemoteObject(Services.SERVICE_COMPANY_RATES).getOperation("deleteTransaction").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_COMPANY_RATES).getOperation("deleteTransaction").send(CommonModule.userOptions, evt.rcmId, evt.transactionToDeleteId);
		}

		public function getCompanyRatesCount(evt:GetCompanyRatesCountEvent):void
		{
			service.getRemoteObject(Services.SERVICE_COMPANY_RATES).getOperation("getCompanyRatesCount").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_COMPANY_RATES).getOperation("getCompanyRatesCount").send(CommonModule.userOptions, evt.requestCompany);
		}

		public function getCompanyRatesPage(evt:GetCompanyRatesPageEvent):void
		{
			service.getRemoteObject(Services.SERVICE_COMPANY_RATES).getOperation("getCompanyRatesPage").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_COMPANY_RATES).getOperation("getCompanyRatesPage").send(CommonModule.userOptions, evt.requestCompany, evt.page, evt.count);
		}

		public function getGroupListCompanyRates(evt:GetGroupListCompanyRatesEvent):void
		{
			service.getRemoteObject(Services.SERVICE_COMPANY_RATES).getOperation("getGroupList").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_COMPANY_RATES).getOperation("getGroupList").send(CommonModule.userOptions, evt.groupName, evt.rateId);
		}

		public function getItemCountCompanyRates(evt:GetItemCountCompanyRatesEvent):void
		{
			service.getRemoteObject(Services.SERVICE_COMPANY_RATES).getOperation("getItemCount").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_COMPANY_RATES).getOperation("getItemCount").send(CommonModule.userOptions, evt.groupId, evt.itemName, evt.rateId);
		}

		public function getItemPageCompanyRates(evt:GetItemPageCompanyRatesEvent):void
		{
			service.getRemoteObject(Services.SERVICE_COMPANY_RATES).getOperation("getItemPage").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_COMPANY_RATES).getOperation("getItemPage").send(CommonModule.userOptions, evt.groupId , evt.itemName, evt.rateId, evt.page, evt.count);
		}

		public function getTransactionList(evt:GetTransactionListCompanyRateEvent):void
		{
			service.getRemoteObject(Services.SERVICE_COMPANY_RATES).getOperation("getTransactionList").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_COMPANY_RATES).getOperation("getTransactionList").send(CommonModule.userOptions, evt.rateId);
		}

		public function saveCompanyRate(evt:SaveCompanyRateEvent):void
		{
			service.getRemoteObject(Services.SERVICE_COMPANY_RATES).getOperation("saveCompanyRate").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_COMPANY_RATES).getOperation("saveCompanyRate").send(CommonModule.userOptions, evt.companyRate);
		}

		public function saveTransaction(evt:SaveTransactionCompanyRateEvent):void
		{
			service.getRemoteObject(Services.SERVICE_COMPANY_RATES).getOperation("saveTransaction").addEventListener(ResultEvent.RESULT, handleResult);
			service.getRemoteObject(Services.SERVICE_COMPANY_RATES).getOperation("saveTransaction").send(CommonModule.userOptions, evt.remId ,evt.newItem);
		}
		
	}
}