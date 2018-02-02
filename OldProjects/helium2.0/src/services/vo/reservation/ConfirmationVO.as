package services.vo.reservation
{
	import com.adobe.cairngorm.vo.IValueObject;
	
	[RemoteClass(alias="MapConfirmation")]
	[Bindable]
	public class ConfirmationVO implements IValueObject
	{
		public var iId:int;
    	public var sEmail:String;
    	public var sPhone:String;
    	public var sFax:String;
    	public var sSms:String;
    	public var sWhiteMail:String;	
	}
}