package h2olib.utils
{
	import mx.controls.Alert;
	
	public class Deserializer
	{
		public function Deserializer()
		{
		}
		
		public static function deserialize(className:Class, targetObj:Object):Object
		{
			var result:Object = new className();
			
			for(var i:String in targetObj)
			{
				result[i] = targetObj[i];
			}
			
			return result;
		}

	}
}