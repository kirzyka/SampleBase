package services.vo.profiles
{
	import services.vo.backend.LocationVO;
	
	[RemoteClass(alias="MapProfileAddressCompany")]
	public class CompanyAddressVO
	{
		public var bIsPrimary:Boolean = false;
		public var bIsBilling:Boolean = false;
		
		public var lId:Number = 0;
		
		public var lCityId:Number = 0;
		public var sCityName:String;
		
		public var lRgnId:Number = 0;
		public var sRgnName:String;
		
		public var lCountryId:Number = 0;
		public var sCountryName:String;
		
		public var sLine:String;
		public var sLineExt:String;
		public var sZipCode:String;
		
		public var aContacts:/* CompanyContactVO */Array = [];
		
		public function get sFullAddress():String {
			var address:String = "";
			address += this.sZipCode + ",";
			address += this.sLineExt + ",";
			address += this.sCityName + ",";
			address += this.sRgnName + ",";
			address += this.sCountryName;
			return address;
		}
	}
}