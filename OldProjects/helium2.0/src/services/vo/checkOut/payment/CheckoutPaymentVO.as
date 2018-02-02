package services.vo.checkOut.payment
{
	import services.vo.MapValueObject;
	
	[RemoteClass(alias="MapCheckoutPayment")]
	public class CheckoutPaymentVO extends MapValueObject
	{
		/**
		 *  Types of payments existed into the system.
		 */
		public static const TYPE_CASH:int = 1;
		public static const TYPE_DEPOSIT:int = 2;
		public static const TYPE_CARD:int = 3;
		public static const TYPE_UNKNOWN:int = 4;
		/**
		 *  This property is type of payment.
		 *  
		 *  @default 0
		 */
		public var iType:int = 0;
		/**
		 *  This property is id of payment.
		 *  
		 *  @default 0
		 */
		public var lId:Number = 0;
		/**
		 *  This property is id of applied payment.
		 *  
		 *  @default 0
		 */
		public var lAppliedPayment:Number = 0;
		/**
		 *  This property is date of adding payment by guest.
		 */
		public var dDate:String;
		/**
		 *  This property is name of payment.
		 */
		public var sName:String;
		/**
		 *  This property is extended name of payment.
		 */
		public var sNameExt:String;
		/**
		 *  This property is value of payment.
		 *  
		 *  @default 0.00
		 */
		public var fValue:Number = 0.00;
	}
}