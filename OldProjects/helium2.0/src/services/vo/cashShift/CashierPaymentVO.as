package services.vo.cashShift
{
	import com.adobe.cairngorm.vo.IValueObject;

	[RemoteClass(alias="MapCashierPayment")]
	[Bindable]
	public class CashierPaymentVO implements IValueObject
	{
      public var iPaymentId:Number;
	  public var sTime:String;
	  public var sPaymentType:String;
	  public var sPaymentName:String;
	  public var sGuestName:String;
	  public var sGuestSurname:String;
	  public var sRoomNumber:String;
	  public var iCashShift:String;
	  public var sCashShiftStatus:String;
	  public var sUser:String;
	  public var fCredit:Number;

	}
}
