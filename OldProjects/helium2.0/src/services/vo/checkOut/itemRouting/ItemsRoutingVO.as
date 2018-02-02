package services.vo.checkOut.itemRouting
{
	[RemoteClass(alias="MapItemsRouting")]
	public class ItemsRoutingVO
	{
		public var lPaymentLineId:Number = 0;
		/**
		 *  This property is list of account's addresses.
		 *  
		 *  @default []
		 *  
		 *  @see framework.vo.checkOut.itemRouting.AccountAddressVO
		 */
		public var aMapAccounts:/* AccountAddressVO */Array = [];
		/**
		 *  This property is list of not routed items.
		 *  
		 *  @default []
		 *  
		 *  @see framework.vo.checkOut.itemRouting.ItemCheckOutVO
		 */
		public var aNotRoutedItems:/* ItemCheckOutVO */Array = []; 
		/**
		 *  This property is list of applied items to accounts.
		 *  
		 *  @default []
		 *  
		 *  @see framework.vo.checkOut.itemRouting.AppliedItemsVO
		 */
		public var aAppliedItems:/* AppliedItemsVO */Array = [];
		/**
		 *  This property is list of payments, added by guest.
		 *  
		 *  @default []
		 *  
		 *  @see framework.vo.checkOut.itemRouting.CheckoutPaymentVO
		 */
		public var aPayments:/* CheckoutPaymentVO */Array = [];
		/**
		 *  This property is list of payments, added by accounts.
		 *  
		 *  @default []
		 *  
		 *  @see framework.vo.checkOut.itemRouting.CheckoutPaymentVO
		 */
		public var aRoutedPayments:/* CheckoutPaymentVO */Array = [];
		/**
		 *  This property is list of pacakes.
		 *  
		 *  @default []
		 *  
		 *  @see framework.vo.checkOut.itemRouting.PackageItemsVO
		 */
		public var aPackages:/* PackageItemsVO */Array = [];
	}
}