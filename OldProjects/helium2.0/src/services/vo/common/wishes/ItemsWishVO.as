package services.vo.common.wishes
{
	[RemoteClass(alias="MapItemsWish")]
	public class ItemsWishVO
	{
		/**
		 *  This property contain id of item's wish.
		 */
		public var lId:Number;
		/**
		 *  This property contain name of item's wish.
		 */
		public var sName:String;
		/**
		 *  This property contain desription of item's wish.
		 */
		public var sDescription:String;
		/**
		 *  This property contain type of item's wish.
		 *  
		 *  @default 1
		 */
		public var iType:int = 1;
		
		[Transient]
		/**
		 *  This property is <code>true</code> if item is selected
		 *  to attach it to check out guest. 
		 *  
		 *  @default false
		 */
		public var bIsSelected:Boolean = false;
	}
}