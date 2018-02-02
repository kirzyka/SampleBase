package framework.core.utils
{
	import flash.utils.ByteArray;
	import flash.utils.describeType;
	
	import mx.collections.ArrayCollection;


	public class UtilsGolobal
	{
		public function UtilsGolobal()
		{
		}

		public static function clone(value:Object):Object
		{
			var ba:ByteArray = new ByteArray();
			ba.writeObject(value);
			ba.position = 0;
			return ba.readObject();
		}

		public static function round(number:Number, n:Number):Number
		{
			var kof:Number = Math.pow(10, n);
			return Math.round(number * kof) / kof;
		}
		
		public static function convertTo2DecimalPlaces(src:String):String
		{
			if(src == "") { return "0.00"; }
			var result:String = "0";
			var numGroups:Array = src.split(".");
			if(numGroups.length == 1)
			{
				result = numGroups[0].toString().length == 0 ? "" : numGroups[0].toString() + ".00";
			}
			else
			{
				if(numGroups[1].toString().length == 0)
				{
					result = numGroups[0].toString().length == 0 ? "" : numGroups[0].toString() + ".00";
				}
				else if(numGroups[1].toString().length == 1)
				{
					result = numGroups[0].toString() + "." + numGroups[1].toString() + "0";
				}
				else
				{
					result = numGroups[0].toString() + "." + numGroups[1].toString().substr(0,2);
				}
			}
			return result;
			
		}

		public static function getClassInfo(value:Class):XML {
	    	var _classInfo:XML = null;
	        if (!_classInfo) {
	            _classInfo = describeType(value);
	        }

	        return _classInfo;
	    }
	    
	    public static function addFirstItem(item:Object,arrayCollection:ArrayCollection):ArrayCollection
	    {
	    	if(!arrayCollection.contains(item))
	    	{
		    	arrayCollection.addItemAt(item,0);
		    	arrayCollection.refresh();
		    }
	    	return arrayCollection;
	    }
   
	}
}