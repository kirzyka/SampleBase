package framework.module
{
	import framework.view.pages.rates.bar.subview.BARCalendarItemView;
	import services.vo.backend.PackageItemVO;
	import services.vo.rates.bar.BARGetterObjectVO;
	import services.vo.rates.bar.BARSaveItemVO;
	import services.vo.rates.packages.PackageGroupVO;
	
	import mx.collections.ArrayCollection;
	import mx.containers.Canvas;

	[Bindable]
	public class BARModule
	{
		public var currPage:int = 0;

		public var creationForm:int = 0;

		public var isBarEnabled:Boolean = true;

		public var totalCells:int = 0;
		public var cellsData:ArrayCollection = new ArrayCollection();
		public var barGetter:BARGetterObjectVO = new BARGetterObjectVO();
		public var listOfDate:Array = [];

		public var currentRoomTypeIndex:int = 0;
		public var basePrice:Canvas = new Canvas();

		public var firstDayItem:BARCalendarItemView = null;
		
		public var pricesOfStartDate:BARSaveItemVO = new BARSaveItemVO();

	//	public var currentBedTypes:ArrayCollection = new ArrayCollection();

		// packages
		public var pckagesCount:int = 0;
		public var packages:ArrayCollection = new ArrayCollection(); //PackageVO
		public var currentPackage:PackageGroupVO;

		public var currentPackageItem:PackageItemVO;
		public var packageTransactionList:ArrayCollection = new ArrayCollection(); //PackageItemVO

		public var itemGroupList:ArrayCollection = new ArrayCollection(); //ItemsGroupVO
		public var groupItemCount:int = 0;
		public var hotelItemList:ArrayCollection = new ArrayCollection(); //HotelItemVO
		public var barsForPackage:Object;

	}
}