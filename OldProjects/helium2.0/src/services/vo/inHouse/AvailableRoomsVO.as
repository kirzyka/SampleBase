package services.vo.inHouse
{
	import services.vo.MapValueObject;
	
	[RemoteClass(alias="MapAvailableRooms")]
	[Bindable]
	public class AvailableRoomsVO extends MapValueObject
	{
		/**
		 *  This proeprty is id of room.
		 *  
		 *  @default 0
		 */
		public var lRoomId:Number = 0;
		public var sRoomName:String;
		public var sRoomType:String;
		public var aRoomSettingIds:Array = [];
		public var sGuestName:String;
		public var sNightsAvail:String;
		public var sStatus:String;
		
		public var lRoomQuality:Number = 0;
	}
}