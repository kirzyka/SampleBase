package services.vo.cashShift
{
	import com.adobe.cairngorm.vo.IValueObject;

	[RemoteClass(alias="BusinessDayMap")]
	[Bindable]
	public class BusinessDayVO implements IValueObject
	{
		  public var iBusinessDayId:Number;
		  public var iHotelId:Number;
		  public var sDate:String;
		  public var sStart:String;    // Start time
		  public var sEnd:String;      // End time
		  public var iStatusId:String; // Shift state ID
		  public var sStatus:String;
	}
}
