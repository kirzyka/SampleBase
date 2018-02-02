package services.cairngorm
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.utils.ObjectUtil;
	import mx.utils.StringUtil;
	
	import services.events.IBaseEvent;

	public class BaseEvent extends CairngormEvent implements IBaseEvent
	{
		/**
		 *  This property contain user call back function.
		 */
		protected var _callBack:Function;
		
		/**
		 *  @override
		 *  Collect all properties to string as <i>property</i> = <i>value</i>.
		 */
		override public function toString():String
		{
			var classInfo:Object = ObjectUtil.getClassInfo(this);
			// collect all properties to string
			var values:String = "";
			var props:Array = classInfo["properties"];
			for(var i:int = 0; i < props.length; i++)
			{
				var prop:String = (props[i] as QName).localName;
				values += StringUtil.substitute("{0}: {1}\n", prop, this[prop]);
			}
			
			return StringUtil.substitute("name: {0} ({1})", type, values)
		}
		
		/**
		 *  BaseEvent. Constructor.
		 *  Creates an CairngormEvent object to pass as a parameter to
		 *  event listeners.
		 *
		 *  @param type:String — The type of the event, accessible as BaseEvent
		 */
		public function BaseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		/**
		 *  The user call back function.
		 */
		public function get callBack():Function
		{
			return _callBack;
		}
		/**
		 *  @private
		 */
		public function set callBack(func:Function):void
		{
			_callBack = func;
		}
	}
}