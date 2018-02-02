package services.vo.backend
{
	[RemoteClass(alias="MapLocationDetail")]
	public class LocationDetailVO
	{
		/**
		 *  This property contain id of location.
		 */
		public var lId:Number;
		/**
		 *  This property contain ifdof zip (postal)
		 *  code for location.
		 */
		public var iZipId:Number;
		/**
		 *  This property contain some info about
		 *  location.
		 */
		public var sInfo:String;
		/**
		 *  This property contain extended info about
		 *  location.
		 */
		public var sInfoExt:String;
	}
}