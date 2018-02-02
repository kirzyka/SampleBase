package services.vo.checkOut.payment
{
	import services.vo.MapValueObject;
	
	[Bindable]
	public class DebitorPaymentVO extends MapValueObject
	{
		/**
		 *  This property is id of debitor payemnt.
		 *  
		 *  @default 0
		 */
		public var lId:Number = 0;
		/**
		 *  This property is date of creation or update time.
		 *  
		 *  @default ""
		 */
		public var dDate:String = "";
		/**
		 *  This property is description of item.
		 *  
		 *  @default ""
		 */
		public var sDescription:String = "";
		/**
		 *  This property is summary of debit by item.
		 *  
		 *  @default 0.00
		 */
		public var lDebit:Number = 0.00;
		/**
		 *  This property is summary of credit by item.
		 *  
		 *  @default 0.00
		 */
		public var lCredit:Number = 0.00;
		/**
		 *  This property is id of VAT included for item.
		 *  
		 *  @default 0
		 */
		public var lVatId:Number = 0;
		/**
		 *  This property is value of VAT included for item.
		 *  
		 *  @default 0
		 */
		public var iVatValue:Number = 0;
		/**
		 *  This property is type of payment.
		 *  <p><b>Note:</b> if <code>ItemCheckOutVO#bIsPayment = true</code>,
		 *  type of item must set to item.
		 *  
		 *  @default 0
		 */
		public var iPaymentType:int = 0;
	}
}