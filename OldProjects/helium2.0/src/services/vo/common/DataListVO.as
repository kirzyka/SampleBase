package services.vo.common
{
	import com.adobe.cairngorm.vo.IValueObject;

	[RemoteClass(alias="MapDataList")]
	[Bindable]
	public class DataListVO implements IValueObject
	{
		public var iId:int;
  		public var sCode:String;
  		public var sName:String;
  		
  		[Transient]
  		public var bIsSelected:Boolean = false;
	}
}