package services.vo.checkOut.itemRouting
{
	[Bindable]
	[RemoteClass(alias="MapPersonAccounts")]
	public class PersonAccountsVO
	{
		public static const TYPE_PRIVATE:int = 1;
		public static const TYPE_COMPANY:int = 2;
		
		public var iType:int;
		
		public var sAccountType:String;
		public var sCompanyName:String;
		public var sGuestName:String;
		
		public var aAddresses:Array = [];
	}
}