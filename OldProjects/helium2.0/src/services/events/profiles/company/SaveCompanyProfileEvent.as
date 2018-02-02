package services.events.profiles.company
{
	import services.cairngorm.BaseEvent;
	import services.vo.profiles.CompanyProfileVO;

	public class SaveCompanyProfileEvent extends BaseEvent
	{
		public var profile:CompanyProfileVO;
		public var index:int;
		
		public function SaveCompanyProfileEvent(type:String)
		{
			super(type);
		}
		
	}
}