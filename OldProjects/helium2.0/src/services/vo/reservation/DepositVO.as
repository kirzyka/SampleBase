package services.vo.reservation
{
	import com.adobe.cairngorm.vo.IValueObject;

	[RemoteClass(alias="MapDeposit")]
	[Bindable]
	public class DepositVO implements IValueObject
	{
		public var iId:int;
    	public var rValue:Number;
    	public var iPresentage:int;
    	public var sDue:String;
    	public var iStatus:int;

	}
}