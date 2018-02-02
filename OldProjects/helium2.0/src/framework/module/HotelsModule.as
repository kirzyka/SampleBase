package framework.module
{
	import flash.net.FileReference;
	
	import services.vo.backend.RoomTypesObjectVO;
	import services.vo.hotels.HotelInfoTotalVO;
	import services.vo.hotels.HotelRoomObjectVO;
	import services.vo.hotels.HotelStageObjectVO;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class HotelsModule
	{
		/**
		 *  This property is current active page in module.
		 *  
		 *  @default 0
		 */
		public var currPage:int = 0;
		/**
		 *  This property is name of pages used in module. Generate by
		 *  creation of module.
		 *  
		 *  @default []
		 */
		public var pageNames:/* String */Array = [];
		/**
		 *  This propert is hotels allowed to logged user.
		 *  
		 *  @default new ArrayCollection()
		 *  
		 *  @see services.vo.hotels.HotelInfoTotalVO
		 */
		public var hotels:/* HotelInfoTotalVO */ArrayCollection = new ArrayCollection();
		
		
		
		

		public var isEdit:Boolean = false;
		public var maxHotelRoomTypes:int = 0;

		public var hotelTotalInfo:HotelInfoTotalVO = new HotelInfoTotalVO();

		

		public var imageFile:FileReference;

		public var hotelRoomTypes:ArrayCollection = new ArrayCollection(); //HotelRoomWithBedTypesObjectVO

		public var hotelRoomTypesCopyWithAll:ArrayCollection = new ArrayCollection(); //when need All room types item

		public var hotelRoomSettings:ArrayCollection = new ArrayCollection();

		public var stageDP:ArrayCollection = new ArrayCollection();
		public var roomDP:ArrayCollection = new ArrayCollection(); // RoomWithStatusVO
		public var realRoomTypeList:ArrayCollection = new ArrayCollection();

		public var currStage:HotelStageObjectVO = new HotelStageObjectVO();
		public var currRoom:HotelRoomObjectVO = new HotelRoomObjectVO();
		public var currStageRoomsDP:ArrayCollection = new ArrayCollection(); // list of HotelRoomObjectVO
		public var currRoomType:RoomTypesObjectVO = new RoomTypesObjectVO();
	}
}