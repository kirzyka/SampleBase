package services.vo.checkOut.itemRouting
{
	import services.vo.MapValueObject;
	import services.vo.reservation.CreditCardVO;
	
	[RemoteClass(alias="MapPersonalPayment")]
	public class PersonalPaymentVO extends MapValueObject
	{
		public static const PAYMENT_CASH:int = 1;
		public static const PAYMENT_CARD:int = 3;
		/**
		 *  This property is type of payment. For example,
		 *  PAYMENT_CASH, PAYMENT_CARD, etc.
		 */
		public var iType:int;
		/**
		 *  This property is price of payment.
		 *  
		 *  @default 0.00
		 */
		public var fPrice:Number = 0.00;
		/**
		 *  This property is credit card data.
		 *  
		 *  @default new CreditCardVO()
		 *  
		 *  @see services.vo.reservation.CreditCardVO
		 */
		public var oMapCreditCard:CreditCardVO = new CreditCardVO();
	}
}