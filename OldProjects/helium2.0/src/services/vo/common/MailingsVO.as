package services.vo.common
{
	[RemoteClass(alias="MapMailings")]
	public class MailingsVO
	{
		/**
		 *  This property contain id.
		 *  
		 *  @default 0
		 */
		public var lId:Number = 0;
		/**
		 *  This property contain name.
		 */
		public var sName:String;
		
		[Transient]
		/**
		 *  This property is <code>true</code> if mailing action
		 *  is selected.
		 *  
		 *  @default false
		 */
		public var bIsSelected:Boolean = false;
	}
}