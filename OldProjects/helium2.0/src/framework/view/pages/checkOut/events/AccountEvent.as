package framework.view.pages.checkOut.events
{
	import flash.events.Event;
	
	import services.vo.checkOut.itemRouting.AccountAddressVO;
	import services.vo.checkOut.itemRouting.PersonAccountsVO;

	public class AccountEvent extends Event
	{
		public static const ACCOUNT_SELECTED:String = "accountSelected";
		
		public var paymentId:Number;
		public var account:PersonAccountsVO;
		public var accountAddress:AccountAddressVO;
		
		public function AccountEvent(type:String)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			var clone:AccountEvent = new AccountEvent(type);
			clone.account = account;
			clone.accountAddress = accountAddress;
			return clone;
		}
	}
}