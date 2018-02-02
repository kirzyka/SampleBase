package services.vo.checkOut.itemRouting
{
	import services.vo.MapValueObject;
	
	[RemoteClass(alias="MapAppliedItems")]
	public class AppliedItemsVO extends MapValueObject
	{
		public static const TYPE_PERSON_ADDRESS:int = 1;
		public static const TYPE_COMPANY_ADDRESS:int = 2;
		public static const TYPE_PERSON_CREDIT:int = 3;
		public static const TYPE_COMPANY_CREDIT:int = 4;
		
		public var aItems:Array = [];
		public var lAccountId:Number = 0;
		
		public var iType:int;
		public var lPaymentId:Number = 0;
		
		public var dAcceptTime:String;
	}
}