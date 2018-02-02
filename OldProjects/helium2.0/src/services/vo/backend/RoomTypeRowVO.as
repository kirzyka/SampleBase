package services.vo.backend
{
	public class RoomTypeRowVO
	{
		public var index:int;
		public var roomTypeId:Number;
		public var roomTypeGroup:String;
		public var realIndex:int;
		public var roomType:String;
		public var shortName:String;
		public var description:String;
		public var capacity:int;
		public var bedName:String;
		//for room type Hierarchical Data
		public var children:Array = new Array();
	}
}