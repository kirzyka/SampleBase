package services.vo.backend
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class RoomSettingsModuleVO
	{
		public var currPage:int = 0;
		
		public const MAX_NAME_LENGTH:int = 4;	
	
		public var roomSettingsEnabled:Boolean = true;
		
		public var roomSettingsDP:ArrayCollection = new ArrayCollection();
		public var maxRoomSettingsItems:int = 0;
	}
}