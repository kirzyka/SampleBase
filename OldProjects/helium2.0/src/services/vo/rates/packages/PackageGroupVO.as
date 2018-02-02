package services.vo.rates.packages
{
	import com.adobe.cairngorm.vo.IValueObject;

	[Bindable]
	[RemoteClass(alias="MapPackageGroup")]
	public class PackageGroupVO implements IValueObject
	{
		public var iPackageId:int = 0;
		public var iHotelId:int;
		public var sPackageName:String;
		public var bPriceIsRelative:Boolean;
		public var bPriceIsPerStay:Boolean;
		public var sDateStart:String; //  (Y-m-d)
		public var sDateEnd:String;
		public var aPricesForRoomTypes:Array = []; //include arrays of PackagePricesVO
		public var iMinStay:int=1;
		public var iMaxStay:int=1;
		public var sDescription:String;
		[Transient]
	  	public var bIsSelected:Boolean = false;
	  	
	  	 public var iArgIdIncluded:int;
		 public var iArgIdExcluded:int;

	}
}