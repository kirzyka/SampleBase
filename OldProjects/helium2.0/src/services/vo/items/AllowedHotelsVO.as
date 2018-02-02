package services.vo.items
{
	[RemoteClass(alias="MapAllowedHotels")]
	public class AllowedHotelsVO
	{
		/**
		 *  This property contain state of possible to work
		 *  with system groups, transactions, etc.
		 *  <code>true</code> is system items is allowed.
		 */
		public var bIsSystemAllowed:Boolean;
		/**
		 *  This property contain list of allowed hotels
		 *  by logined user.
		 *  
		 *  @default []
		 */
		public var aAllowedHotelsId:Array = [];
	}
}