package services.events.miscellaneous.countries
{
	import services.cairngorm.BaseEvent;
	import services.vo.common.CountryVO;

	public class AddCountryEvent extends BaseEvent
	{		
		public var country:CountryVO = new CountryVO();
		
		public function AddCountryEvent(type:String)
		{
			super(type);
		}
		
	}
}