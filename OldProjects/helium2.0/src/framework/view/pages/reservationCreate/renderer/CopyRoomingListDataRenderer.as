package framework.view.pages.reservationCreate.renderer
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.controls.CheckBox;

	public class CopyRoomingListDataRenderer extends CheckBox
	{
		public function CopyRoomingListDataRenderer()
		{
			super();
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		override public function set data(value:Object):void
		{
			super.data = value;
			if(data != null)
			{
				label = data.label;
				selected = data.bIsSelected;
			}			
		}
		
		private function onClick(event:Event):void
		{
			data.bIsSelected = selected;
		}
	}
}