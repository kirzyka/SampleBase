package services.vo.backend
{
	import com.adobe.cairngorm.vo.IValueObject;

	[Bindable]
	[RemoteClass(alias="MapPackageItem")]
	public class PackageItemVO implements IValueObject
	{
		public var iId:int = 0;
		public var iItemId:int;
		public var fPrice:Number;
		public var fPricePerStay:Number = 0;
		public var bPerPerson:Boolean;
		public var bPerChildBefore:Boolean;
		public var bPerChildMiddle:Boolean;
		public var bPerChildAfter:Boolean;
		public var fPriceChildBefore:Number;
		public var fPriceChildMiddle:Number;
		public var fPriceChildAfter:Number;
		public var sDescription:String;
		public var sRhythmCode:String;
		public var sRhythm:String;
		public var sCode:String;
		public var sCodeDirect:String;
		public var sName:String;
		public var bPriceExists:Boolean;
		 //list of arrangement code assigned to this item
	 	public var aCodeArrangement:Array;//int	  
	  
	  //included to Logis or not
  	  	public var bPtmIsIncluded:Boolean;

	}
}