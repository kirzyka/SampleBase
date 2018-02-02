package services.vo.backend
{
	import services.vo.common.CityVO;
	import services.vo.common.CountryVO;
	import services.vo.common.RegionVO;
	import services.vo.frontend.StreetVO;
	import services.vo.frontend.ZipVO;
	
	[RemoteClass(alias="MapLocation")]
	public class LocationVO
	{
		/**
		 *  This property contain object with info
		 *  about country.
		 *  
		 *  @see framework.vo.frontend.CountryVO
		 */
		public var oCountry:CountryVO;
		/**
		 *  This property contain object with info
		 *  about region.
		 *  
		 *  @see framework.vo.frontend.RegionVO
		 */
		public var oRegion:RegionVO;
		/**
		 *  This property contain object with info
		 *  about city.
		 *  
		 *  @see framework.vo.frontend.CityVO
		 */
		public var oCity:CityVO;
		/**
		 *  This property contain object with info
		 *  about street.
		 *  
		 *  @see framework.vo.frontend.StreetVO
		 */
		public var oStreet:StreetVO;
		/**
		 *  This property contain object with info
		 *  about zip (postal) code.
		 *  
		 *  @see framework.vo.frontend.ZipVO
		 */
		public var oZip:ZipVO;
		/**
		 *  This property contain object with linkage
		 *   of zip (postal) code and street.
		 *  
		 *  @see framework.vo.backend.ZipStreetVO
		 */
		public var oZipStreet:ZipStreetVO;
		/**
		 *  This property contain location detail.
		 *  
		 *  @see framework.vo.backend.LocationDetailVO
		 */
		public var oDetail:LocationDetailVO; 
	}
}