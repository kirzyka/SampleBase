package services.events.miscellaneous.vat
{
	import services.cairngorm.BaseEvent;
	import services.vo.backend.VatObjectVO;

	public class AddVATEvent extends BaseEvent
	{
		public var vat:VatObjectVO = new VatObjectVO();
		
		public function AddVATEvent(type:String)
		{
			super(type);
		}
		
	}
}