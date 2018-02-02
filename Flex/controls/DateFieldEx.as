package com.controls
{
	import mx.controls.DateField;
	import mx.core.ClassFactory;
	
	public class DateFieldEx extends DateField
	{
		private var _isClearButtonRequired:Boolean = false;
		
		public function DateFieldEx()
		{
			super();
			height = 19;
		}
		
		[Bindable("change")]
		[Bindable("valueCommit")]
		[Bindable("selectedDateChanged")]
		public function get selectedMilliseconds():Number
		{
			return selectedDate ? selectedDate.getTime() - (selectedDate.timezoneOffset * 60 * 1000) : NaN;
		}
		
		public function set selectedMilliseconds(value:Number):void
		{
			if(value == 0 || isNaN(value))
			{
				selectedDate = null;
				return;
			}
			
			value += new Date(value).timezoneOffset * 60 * 1000;
			selectedDate = value != 0 && !isNaN(value) ? new Date(value) : null;
		}
		
		public function get isClearButtonRequired():Boolean
		{
			return _isClearButtonRequired;
		}

		public function set isClearButtonRequired(value:Boolean):void
		{
			_isClearButtonRequired = value;
			if (value)
			{
				dropdownFactory = new ClassFactory(ClearedDateChooser);
			}
		}
	}
}