package services.events.rates.companyRates
{
	import services.cairngorm.BaseEvent;

	public class DeleteTransactionCompanyRateEvent extends BaseEvent
	{
		public var rcmId:int;
		
		public var transactionToDeleteId:int;
		
	
		
		public function DeleteTransactionCompanyRateEvent(type:String)
		{
			super(type);
		}
		
	}
}