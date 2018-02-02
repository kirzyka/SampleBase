package services.events.miscellaneous.vat
{
	import services.cairngorm.BaseEvent;
	import services.vo.backend.VatObjectVO;

	public class EditVATEvent extends BaseEvent
	{
		public var index:int;
		public var vat:VatObjectVO = new VatObjectVO();
		
		public function EditVATEvent(type:String)
		{
			super(type);
		}
		
	}
}