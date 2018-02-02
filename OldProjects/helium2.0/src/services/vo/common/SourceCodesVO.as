package services.vo.common
{
	[RemoteClass(alias="MapSourceCode")]
	public class SourceCodesVO
	{
		public var iId:Number;
		public var sName:String;
		public var iSourceGroupId:Number;
		public var iDescription:Number;
		public var sDescription:String;
		
		public var oSourceGroup:SourceCodesGroupVO = new SourceCodesGroupVO();
		
		[Transient] //for interface
		public var bIsSelected:Boolean = false;
	}
}
