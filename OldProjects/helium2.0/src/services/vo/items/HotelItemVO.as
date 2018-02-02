package services.vo.items
{
	import services.vo.MapValueObject;
	
	[RemoteClass(alias="MapHotelItem")]
	public class HotelItemVO extends MapValueObject
	{
		/**
		 *  This property contain id of hotel item.
		 *  
		 *  @default 0
		 */
		public var lId:Number = 0;
		/**
		 *  This property contain system id of hotel item.
		 *  
		 *  @default 0
		 */
		public var lSysId:Number = 0;
		/**
		 *  This property contain id of group to which have it.
		 *  
		 *  @default 0
		 */
		public var lGroupId:Number = 0;
		/**
		 *  This property contain name of hotel item.
		 */
		public var sName:String;

		public var sParentName:String;
		 
		/**
		 *  This property contain id of description for
		 *  hotel item.
		 *  
		 *  @default 0
		 */
		public var lDescriptionId:Number = 0;
		/**
		 *  This property contain description for hotel item.
		 */
		public var sDescription:String;
		/**
		 *  This property contain state of special wishes.
		 *  
		 *  @default false
		 */
		public var bIsSpWish:Boolean = false;
		/**
		 *  This property contain price.
		 *   
		 *  @default 0.00
		 */
		public var fPrice:Number = 0.00;
		/**
		 *  This property contain transaction code.
		 */
		public var sTransactionCode:String;
		/**
		 *  This property contain id of VAT.
		 *  
		 *  @default 0
		 */
		public var lVatId:Number = 0;
		/**
		 *  This property contain VAT value.
		 *  
		 *  @default 0
		 */
		public var iVat:int = 0;
		/**
		 *  This property contain list of sub hotel items.
		 *  
		 *  @default []
		 */
		public var aSubItems:/* HotelItemVO */Array = [];
		/**
		 *  This property contain list of ids of arrangement
		 *  codes.
		 *  
		 *  @default []
		 */
		public var aArrgCodes:Array = [];
		/**
		 *  If this property is <code>true</code> the transaction
		 *  is a article.
		 *  
		 *  @deailt false
		 */
		public var bIsArticle:Boolean = false;
		
		/**
		 *  This property contains type id of hotel item.
		 *  
		 *  @default 0
		 */
		public var iLSTTypeId:Number = 0;
		
		/**
		 *  This property contains type name of hotel item.
		 *  
		 *  @default ""
		 */
		//public var iLSTType:String = "";
		
	}
}