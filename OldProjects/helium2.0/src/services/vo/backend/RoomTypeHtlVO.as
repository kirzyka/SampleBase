// Generated by Enterprise IDE Plugin from IDE factory L.L.C.
package services.vo.backend
{

	import com.adobe.cairngorm.vo.IValueObject;
	/**
	* The RoomTypeHtlVO class is 
	*
	* @author  Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/
	 
	[RemoteClass(alias="MapRoomTypeHtl")]
	[Bindable]
	public class RoomTypeHtlVO implements IValueObject 
	{
		public var iId:int;
		public var iHotelId:int;
		public var iRoomTypeId:int;
		public var iRoomCapacity:int;
		public var iLocaleId:int;
		public var sLocale:String;
		public var bDefaultRoomType:Boolean;
	}

}