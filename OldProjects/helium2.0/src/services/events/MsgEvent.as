package services.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import h2olib.control.enum.MessageShowType;

	public class MsgEvent extends CairngormEvent
	{		
		public var kind:uint;
		public var title:String;
		public var message:String;
		public var showType:uint;
		public var onCloseEventCallback:Function;
			
		public static const NAME:String = "msg_event";
		
		public function MsgEvent(kind:uint, title:String = "", message:String = "", showType:uint = 0, onCloseEventCallback:Function = null)
		{
			super(NAME, false, false);
			this.kind = kind;
			this.title = title;
			this.message = message;
			this.showType = showType;
			this.onCloseEventCallback = onCloseEventCallback;
		}		
	}
}