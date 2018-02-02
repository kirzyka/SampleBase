package services.command.checkIn
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import services.business.checkIn.SaveCheckInDataDelegate;
	import services.events.checkIn.SaveCheckInDataEvent;
	import framework.model.AppModelLocator;
	
	import mx.core.Application;
	import mx.rpc.IResponder;

	public class SaveCheckInDataCommand implements ICommand, IResponder
	{
		private var model:AppModelLocator = AppModelLocator.getInstance();
		private var fileName:String;
		private var _event:SaveCheckInDataEvent
		
		public function execute(event:CairngormEvent):void
		{
			_event = SaveCheckInDataEvent( event );
			var delegate:SaveCheckInDataDelegate = new SaveCheckInDataDelegate( this );
			 
			delegate.saveCheckInData( _event as SaveCheckInDataEvent );
			model.appEnabled--;
		}
		
		public function result(data:Object):void
		{
			//Alert.show("Check-in has been successfully completed.");
			/* if (data != "")
			{
			fileName = data as String;
			
			var fullURL:String = Application.application.url;
			var url:String = URLUtil.getProtocol(fullURL) + "://" + URLUtil.getServerName(fullURL) + "/" + fileName;
			var downloadURL:URLRequest = new URLRequest(url);
			navigateToURL(downloadURL, "_blank" );
			}
			_event.callBack();						
			model.appEnabled--; */
			
			
			
			fileName = data/* .oResponse */ as String;
			
			var fullURL:String = Application.application.url;
			
			var lastIndexOfSlash:int = fullURL.lastIndexOf("/", fullURL.length-1);
			var firstPart:String = fullURL.substring(0, lastIndexOfSlash);
			var url:String = firstPart + "/" + fileName;
			//var url:String = URLUtil.getProtocol(fullURL) + "://" + URLUtil.getServerName(fullURL) + "/" + fileName;
			//var downloadURL:URLRequest = new URLRequest(url);			
			 var downloadURL:URLRequest = new URLRequest(url);
			navigateToURL(downloadURL, "_blank" ); 
			_event.callBack();						
			model.appEnabled--;
		}
		
		public function fault(info:Object):void
		{			
			model.appEnabled--;
		}
		
	}
}