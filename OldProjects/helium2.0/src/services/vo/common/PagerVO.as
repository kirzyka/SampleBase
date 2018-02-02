package services.vo.common
{
	[RemoteClass(alias="MapPager")]
	public class PagerVO
	{
		/**
		 *  This property is count of items.
		 *  
		 *  @default 0
		 */
		public var lCount:int = 0;
		/**
		 *  This property is lis of items for current
		 *  active page.
		 *  
		 *  @default []
		 */
		public var aObjects:/* ValueObject */Array = [];
	}
}