package services.vo.reservation
{
	import com.adobe.cairngorm.vo.IValueObject;

	[RemoteClass(alias="MapPersonAssign")]
	[Bindable]	
	public class PersonAssignVO implements IValueObject
	{
   		public var label:String;
   		public var sDateStart:String;
   		public var sDateEnd:String;
	}
}