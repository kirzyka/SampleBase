package services.vo.reservation
{
	import com.adobe.cairngorm.vo.IValueObject;

	import services.vo.profiles.ProfileCallerVO;

	[RemoteClass(alias="MapReservation")]
	[Bindable]
	public class ReservationVO implements IValueObject
	{
		public var iId:int;
    	public var iHotelId:int;
    	public var oGuarantee:GuaratneeVO;
    	public var aOrders:Array;
    	public var oConfirmation:ConfirmationVO;
    	public var oCaller:ProfileCallerVO;
    	public var sComment:String;
	}
}