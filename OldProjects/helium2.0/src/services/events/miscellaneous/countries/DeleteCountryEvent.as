package services.events.miscellaneous.countries
{
	import services.cairngorm.BaseEvent;
	import services.vo.common.CountryVO;
	
	import mx.collections.ArrayCollection;

	public class DeleteCountryEvent extends BaseEvent
	{
		public var country:CountryVO = new CountryVO();
		public var index:int = 0;
		public var listCountry:ArrayCollection = new ArrayCollection();
		
		public function DeleteCountryEvent(type:String)
		{
			super(type);
		}
		
	}
}