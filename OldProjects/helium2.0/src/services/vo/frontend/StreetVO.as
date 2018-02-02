package services.vo.frontend
{
	[RemoteClass(alias="MapStreet")]
	[Bindable]
	public class StreetVO
	{
		/**
		 *  This property contain id of street.
		 */
		public var lId:Number;
		/**
		 *  This property contain id of owner city.
		 */
		public var lCityId:Number;
		/**
		 *  This property contain name of street.
		 */
		public var sStreetName:String;
	}
}