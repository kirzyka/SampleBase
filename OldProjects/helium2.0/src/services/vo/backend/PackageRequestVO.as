package services.vo.backend
{
	import com.adobe.cairngorm.vo.IValueObject;

	[RemoteClass(alias="MapPackageRequest")]
	[Bindable]
	public class PackageRequestVO implements IValueObject
	{
		public var iHotelId:int;
		public var sName:String;
		//private var _sDateTo:String = '';
		public var iRoomQualityId:int;
		public var sDateStart:String;
		public var sDateEnd:String;
		
		/* public function set sDateTo(value:String):void
		{
			_sDateTo = value;
		}
		
		public function get sDateTo():String
		{
			return _sDateTo;
		} */
	}
}