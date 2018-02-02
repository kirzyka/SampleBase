package services.events.rates.packages
{
	import com.adobe.cairngorm.control.CairngormEvent;
	/**
	* The GetPackagEvent class is 
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/
	public class GetPackageEvent extends CairngormEvent
	{
		public var iPackageId:int = 0;
		
		public function GetPackageEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}