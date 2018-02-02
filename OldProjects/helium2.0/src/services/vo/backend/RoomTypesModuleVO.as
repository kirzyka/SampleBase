package services.vo.backend
{
	import framework.view.pages.roomTypes.renderer.RoomTypeCapacityItemRenderer;
	import framework.view.pages.roomTypes.renderer.RoomTypeDescriptionItemRenderer;
	import framework.view.pages.roomTypes.renderer.RoomTypeShortNameItemRenderer;
	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class RoomTypesModuleVO
	{
		public var currPage:int = 0;
		
		public var roomTypesDP:ArrayCollection = new ArrayCollection();
		public var roomTypesForRates:ArrayCollection = new ArrayCollection();	
		public var maxRoomTypesItems:int = 0;
		
		public var roomBedTypes:ArrayCollection = new ArrayCollection(); //RoomWithBedTypesObjectVO
		
		public var currentRoomType:RoomTypesObjectVO;
		public var currentRoomWithBedTypes:RoomWithBedTypesObjectVO;
		public var currentDescriptions:ArrayCollection = new ArrayCollection();
		
		public var currentShortNameIR:RoomTypeShortNameItemRenderer;
		public var currentDescriptionIR:RoomTypeDescriptionItemRenderer;
		public var currentCapacityIR:RoomTypeCapacityItemRenderer;

	}
}