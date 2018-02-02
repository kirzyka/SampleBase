package services.vo.checkOut.itemRouting
{
	import services.vo.MapValueObject;
	import services.vo.reservation.CreditCardVO;
	
	[RemoteClass(alias="MapPayment")]
	public class PaymentVO extends MapValueObject
	{
		public static const TYPE_CASH:int = 1;
		public static const TYPE_DEPOSIT:int = 2;
		public static const TYPE_CARD:int = 3;
		//public static const TYPE_DEBITOR:int = 4;
		
		/**
		 *  This property is type of payment. For example,
		 *  PAYMENT_CASH, PAYMENT_CARD, etc.
		 */
		public var iType:int;
		/**
		 *  This property is price of payment.
		 *  
		 *  @default "0.00"
		 */
		public var fValue:String = "0.00";
		/**
		 *  This property is credit card data.
		 *  
		 *  @default new CreditCardVO()
		 *  
		 *  @see framework.vo.reservation.CreditCardVO
		 */
		public var oMapCreditCard:CreditCardVO = new CreditCardVO();
		
		public var lPaymentLineId:Number;
	}
}