package services.vo.inHouse
{
	import services.vo.MapValueObject;
	import services.vo.checkOut.itemRouting.ItemsRoutingVO;
	
	[RemoteClass(alias="MapConferenceRoomState")]
	[Bindable]
	public class ConferenceRoomStateVO extends MapValueObject
	{
		public static const TYPE_PERSON:int = 1;
		public static const TYPE_COMPANY:int = 2;
		
		public var oMapItemsRouting:ItemsRoutingVO = new ItemsRoutingVO();;
		/**
		 *  This proeprty is type of profile, which assigned
		 *  conference room by himself.
		 */
		public var iType:int;
		/**
		 *  This property is name of profile by type.
		 */
		public var sName:String;
		/**
		 *  This property is id of profile, which assigned
		 *  conference room by himself.
		 *  
		 *  @default 0
		 */
		public var lProfileId:Number = 0;
		/**
		 *  This property is <code>true</code> if confernce
		 *  room assigned to some profile.
		 *  
		 *  @default false
		 */
		public var bIsAssigned:Boolean = false;
	}
}