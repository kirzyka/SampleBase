package framework.core.utils
{
	/**
	* The UtilsMXML class is 
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/	
	public class UtilsMXML
	{
		public static function and(a:Boolean, b:Boolean, ... args):Boolean 
		{
			var result:Boolean = a && b;
			if (result) 
			{
				for each (var arg:Object in args) 
				{
					if (!arg) 
					{
						result = false;
						break;
					}
				}
			}
			return result;
		}

		public static function or(a:Boolean, b:Boolean, ... args):Boolean 
		{
			var result:Boolean = a || b;
			if (!result) 
			{
				for each (var arg:Object in args) 
				{
					if (arg) 
					{
						result = true;
						break;
					}
				}
			}
			return result;
		}
		
		public static function multiline(label:String):String 
		{
			var result:String;
			var pattern:RegExp = /\\n/g;
			result = label.replace(pattern,"\n");
			return result;
		}
	}
}