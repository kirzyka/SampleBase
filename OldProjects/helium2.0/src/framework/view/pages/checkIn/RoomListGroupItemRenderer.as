package framework.view.pages.checkIn
{
	import framework.model.AppModelLocator;
	
	import mx.controls.advancedDataGridClasses.AdvancedDataGridGroupItemRenderer;

	public class RoomListGroupItemRenderer extends AdvancedDataGridGroupItemRenderer
	{
		private var model:AppModelLocator = AppModelLocator.getInstance();
		
		public function RoomListGroupItemRenderer()
		{
			super();
			
			this.setStyle("backgroundAlpha", "0.5");
		}
	}
}