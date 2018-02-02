package services.events.roomTypes
{
	import services.cairngorm.BaseEvent;
	import services.vo.backend.BedTypeObjectVO;

	public class DeleteBedTypeEvent extends BaseEvent
	{
		
		public var bedTypes:BedTypeObjectVO = new BedTypeObjectVO();	
	
		public var numberOfDescription:int;
		
		public function DeleteBedTypeEvent(type:String)
		{
			super(type);
		}
		
	}
}