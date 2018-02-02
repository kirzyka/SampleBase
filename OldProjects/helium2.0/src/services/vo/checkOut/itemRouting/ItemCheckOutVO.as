package services.vo.checkOut.itemRouting
{
	import services.vo.MapValueObject;
	
	[Bindable]
	[RemoteClass(alias="MapItemCheckOut")]
	public class ItemCheckOutVO extends MapValueObject
	{
		/**
		 *  This property is id of item.
		 *  
		 *  @default 0
		 */
		public var lId:Number = 0;
		/**
		 *  This property is id of VAT by item.
		 *  
		 *  @default 0
		 */
		public var lVatId:Number = 0;
		/**
		 *  This property is value of VAT by item.
		 *  
		 *  @default 0
		 */
		public var iVatValue:Number = 0;
		/**
		 *  This property is id of item in hotel.
		 *  
		 *  @default 0
		 */
		public var lHotelItemId:Number = 0;
		/**
		 *  This property is date of creation or update time.
		 */
		public var dDate:String;
		/**
		 *  This property is transaction code of item.
		 */
		public var sTransCode:String;
		/**
		 *  This property is transaction name of item.
		 */
		public var sTransName:String;
		/**
		 *  This property is price of item.
		 *  
		 *  @default 0.00
		 */
		public var fPrice:Number = 0.00;
		/**
		 *  This property is <code>true</code> if item is adjusted.
		 *  
		 *  @default false
		 */
		public var bIsAdjusted:Boolean = false;
		/**
		 *  This property is reason of adusting.
		 */
		public var sAdjustedReason:String;
		/**
		 *  This property is list with ids of arrangement codes assigned
		 *  to item.
		 *  
		 *  @default []
		 */
		public var aArrangemetIds:Array = [];
		/**
		 *  This property is list of items by merge.
		 *  
		 *  @default []
		 */
		public var aComponents:/* ItemCheckOutVO */Array = [];
		
		
		[Transient]
		/**
		 *  This property is <code>true</code> if item is selected
		 *  to attach it to check out guest. 
		 *  
		 *  @default false
		 */
		public var bIsSelected:Boolean = false;
		
		[Transient]
		/**
		 *  This property is <code>true</code> if item is attached
		 *  to check out guest.
		 *  
		 *  @default false
		 */
		public var bIsChecked:Boolean = false;
		
		[Transient]
		/**
		 *  This property is <code>true</code> if item is payment.
		 *  
		 *  @default false
		 */
		public var bIsPayment:Boolean = false;
		
		[Transient]
		/**
		 *  This property is type of payment.
		 *  <p><b>Note:</b> if <code>bIsPayment = true</code>, type
		 *  of item must set to item.
		 *  
		 *  @default 0
		 */
		public var iPaymentType:int = 0;
		
		[Transient]
		/**
		 *  This property is id of applied payment.
		 *  
		 *  @default 0
		 */
		public var lAppliedPayment:Number = 0;
		
		[Transient]
		/**
		 *  This property is <code>true</code> if item is package.
		 *  
		 *  @default false
		 */
		public var bIsPackage:Boolean = false;
		
		[Transient]
		/**
		 *  This property is items included to pacakge.
		 *  <p><b>Note:</b> if <code>bIsPackage = true</code>, items in
		 *  pacakge set in the item.
		 *  
		 *  @default null
		 */
		public var aPackageItems:Array = null;
		
		public function get children():Array
		{
			return aPackageItems;
		}
	}
}