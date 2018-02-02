package services.events.miscellaneous.countries
{
	import services.cairngorm.BaseEvent;
	import services.vo.common.RegionVO;

	public class AddRegionEvent extends BaseEvent
	{		
		public var region:RegionVO = new RegionVO();
		
		public function AddRegionEvent(type:String)
		{
			super(type);
		}
		
	}
}