package framework.view.pages.reservationCreate.data
{
	[Bindable]
	public class OccupancyItem
	{
		public var iAdultsPerRoom:int;
		public var iRoomCount:int;
		
		public function OccupancyItem(iAdultsPerRoom:int, iRoomCount:int)
		{
			this.iAdultsPerRoom = iAdultsPerRoom;
			this.iRoomCount = iRoomCount;
		}

	}
}