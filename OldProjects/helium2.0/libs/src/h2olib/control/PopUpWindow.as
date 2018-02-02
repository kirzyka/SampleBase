package h2olib.control
{
	import mx.containers.TitleWindow;
	import mx.core.Application;
	import mx.events.CloseEvent;
	import mx.events.FlexEvent;
	import mx.managers.PopUpManager;

	[Event(name="isNewStateChange", type="flash.events.Event")]
	public class PopUpWindow extends TitleWindow
	{
		public static const IS_NEW_STATE_CHANGE:String = "isNewStateChange";
		
		private var _isNew:Boolean;
		[Bindable]
		public function get isNew():Boolean
		{
			return _isNew;
		}		
		public function set isNew(value:Boolean):void
		{
			_isNew = value;
			setTitleIcon();
			dispatchEvent(new Event(IS_NEW_STATE_CHANGE));
		}
		
		private function setTitleIcon():void
		{
			if(isNew)
			{
				super.titleIcon = windowNewIcon;
			}
			else
			{
				super.titleIcon = windowEditIcon;
			}		
		}
		
		[Bindable]
		public var isChange:Boolean;	
		[Bindable]
		public var closeAfterSave:Boolean;
			
		private var _windowNewIcon:Class;	
		[Bindable]
		public function get windowNewIcon():Class
		{
			return _windowNewIcon;
		}
		public function set windowNewIcon(value:Class):void
		{
			_windowNewIcon = value;
			setTitleIcon();
		}		
		
		
		private var _windowEditIcon:Class;	
		[Bindable]
		public function get windowEditIcon():Class
		{
			return _windowEditIcon;
		}
		public function set windowEditIcon(value:Class):void
		{
			_windowEditIcon = value;
			setTitleIcon();
		}	
		
		
		public function PopUpWindow()
		{
			super();			
			addEventListener(FlexEvent.CREATION_COMPLETE, centerMe);
			this.horizontalScrollPolicy = "off";
			this.verticalScrollPolicy = "off";						
		}
		
		private function centerMe(event:FlexEvent):void
		{
			this.x = Application.application.width / 2 - this.width / 2;
			this.y = Application.application.height / 2 - this.height / 2;	
					 
		}
		

		public function closeMe():void
		{
			PopUpManager.removePopUp(this);
			dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
		}
	}
}