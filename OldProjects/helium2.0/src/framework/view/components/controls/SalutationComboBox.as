package framework.view.components.controls
{
	import flash.events.Event;
	
	import h2olib.control.ComboBoxEx;
	
	import mx.events.ListEvent;

	public class SalutationComboBox extends ComboBoxEx
	{
		private var _salutationId:Number = 0;
		
		public function SalutationComboBox()
		{
			super();
		}
		
		/**
		 *  @private
		 */
		override public function set dataProvider(value:Object):void
		{
			super.dataProvider = value;
			if (_salutationId == 0)
			{
				if (dataProvider.length > 0)
				{
					selectedItem = dataProvider.getItemAt(0);
				}
				else 
				{
					salutationId = 0;
					selectedIndex = -1;
					selectedItem = null;
				}
			}
			else
			{
				setItemByField("lId", _salutationId);
			}
		}
		
		[Bindable(event="salutationIdChanged")]
		public function get salutationId():Number
		{
			return _salutationId;
		}
		/**
		 *  @private
		 */
		public function set salutationId(value:Number):void
		{
			_salutationId = value;
			
			dispatchEvent(new Event("salutationIdChanged"));
		}
	}
}