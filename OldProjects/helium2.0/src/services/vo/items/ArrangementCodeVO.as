package services.vo.items
{
	import services.vo.MapValueObject;
	
	[Bindable]
	[RemoteClass(alias="MapArrangmentCode")]
	public class ArrangementCodeVO extends MapValueObject
	{
		/**
		 *  This proeprty contain id of arragement code.
		 *  
		 *  @default 0
		 */
		public var lId:Number = 0;
		/**
		 *  This property contain name of arragement code.
		 *  
		 *  @param ""
		 */
		public var sName:String = "";
		/**
		 *  This property contain code name of arragement code.
		 *  
		 *  @param ""
		 */
		public var sCode:String = "";
		/**
		 *  This property is <code>true</code> if item's state is check and
		 *  <code>false</code> - if not.
		 *  <p><b>Note:</b>it needs for check state of item by update.
		 *  <p><b>Note:</b>this info doesn't receive from server.
		 *  
		 *  @default false
		 */
		public var bIsSelected:Boolean = false;
	}
}