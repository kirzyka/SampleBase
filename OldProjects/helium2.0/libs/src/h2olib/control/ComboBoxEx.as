package h2olib.control
{
	import mx.collections.ArrayCollection;
	import mx.controls.ComboBox;
	import mx.events.ListEvent;

	/**
	* The ComboBoxEx class is
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009/06/25 $
	*
	*/
	public class ComboBoxEx extends ComboBox
	{
		public function ComboBoxEx()
		{
			super();
		}

		public var filterFunction:Function;

		public function setItemByField(field:String,value:Object):void
		{
			for each(var item:Object in dataProvider)
			{
				if(item != null)
				{
					if(item[field] == value)
					{
						selectedItem = item;
						dispatchEvent(new ListEvent(ListEvent.CHANGE));
						break;
					}
				}
			}

		}

		override public function set dataProvider(value:Object):void
		{
			super.dataProvider = value;
			filterDataProvider();
		}

		private function filterDataProvider():void
		{
			if(filterFunction != null)
			{
				(dataProvider as ArrayCollection).filterFunction = filterFunction;
				(dataProvider as ArrayCollection).refresh();
			}
		}


	}
}