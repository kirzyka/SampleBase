package services.vo.backend
{
	[RemoteClass(alias="MapRoomSetting")]
	[Bindable]
	public class RoomSettingObjectVO
	{
		public var iRsettingId:Number = 0;
		public var iParentId:Number = 0;

        public var sRsettingCode:String;
        public var sRsettingDesctiptionLocale:String;

	    public var iHotelId:Number = 0;
	    public var bIsSpwish:Boolean;

	    public var iRsettingCode:Number = 0;
	    public var iRsettingDescription:Number = 0;
	    
	    public var sCodeDirect:String;

	    public var bIsMantadory:Boolean = false;

		/**
         *  This property is true if item's state is check and
         *  false  - if not.
         *  Note: it needs for check state of item by update.
         *  Note: this info doesn't receive from server.
         */
		[Transient]
		public var bIsSelected:Boolean = false;
	}
}