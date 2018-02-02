package h2olib.control
{
	import mx.controls.Label;
	
	public class MultiLineLabel extends Label
	{
		public function MultiLineLabel()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			textField.wordWrap = true;
			textField.multiline = true;
		}
	}
}