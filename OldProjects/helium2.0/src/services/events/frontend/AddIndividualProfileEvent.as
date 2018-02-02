package services.events.frontend
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class AddIndividualProfileEvent extends CairngormEvent
	{		
		public var profileList:Array = new Array();
		public var callBack:Function;
		//public var profile:ProfileVO=new ProfileVO();
		
		public function AddIndividualProfileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}