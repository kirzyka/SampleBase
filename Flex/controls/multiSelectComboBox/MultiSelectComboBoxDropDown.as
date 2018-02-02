package com.db.rds.content.ExceptionManagement.view.controls.multiSelectComboBox
{
	import mx.controls.List;
	import mx.events.ListEvent;

	public class MultiSelectComboBoxDropDown extends List
	{
		
		public function MultiSelectComboBoxDropDown()
		{
			super();
			selectable = false;
			addEventListener(ListEvent.ITEM_CLICK, onChanged);
			addEventListener("change", onChanged);
		}

		protected override function createChildren():void
		{
			super.createChildren();
		}
		
		public override function get height():Number
		{
			return Math.min(maxHeight, rowCount * rowHeight);
		}

		private function onChanged(event:ListEvent):void
		{
			event.stopImmediatePropagation();
		}
		
	}
}