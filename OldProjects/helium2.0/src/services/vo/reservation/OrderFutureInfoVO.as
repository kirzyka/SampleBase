package services.vo.reservation
{
	import com.adobe.cairngorm.vo.IValueObject;
	
	[RemoteClass(alias="MapOrderFutureInfo")]
	[Bindable]	
	public class OrderFutureInfoVO implements IValueObject
	{
		public var iOrderId:int;
	  	public var iRoomId:int;
  		public var sDateOutOfService:String;
  		public var aPersonAssign:Array;	//PersonAssignVO

	}
}