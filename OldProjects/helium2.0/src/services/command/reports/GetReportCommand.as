package services.command.reports
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import services.business.reports.GetReportDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.reports.GetReportEvent;
	
	import mx.core.Application;

	public class GetReportCommand extends BaseCommand/* implements ICommand, IResponder */
	{
		/* private var model:AppModelLocator = AppModelLocator.getInstance(); */
		
		private var file:FileReference;
		private var fileName:String;
		
		/* private var evt:GetReportEvent; */
		private var delegate:GetReportDelegate;
		
		override public function execute(event:CairngormEvent):void
		{
			_event = GetReportEvent( event );
			delegate = new GetReportDelegate( this );
			delegate.getArrivalReport( _event as GetReportEvent );
			super.execute(event);
			
			
		}
		
		override public function result(data:Object):void
		{
			//"http://dev.ramada.ameria.de/H2O_WEB.html";//			
			fileName = data/* .oResponse */ as String;
			
			var fullURL:String = Application.application.url;
			
			var lastIndexOfSlash:int = fullURL.lastIndexOf("/", fullURL.length-1);
			var firstPart:String = fullURL.substring(0, lastIndexOfSlash);
			var url:String = firstPart + "/" + fileName;
			//var url:String = URLUtil.getProtocol(fullURL) + "://" + URLUtil.getServerName(fullURL) + "/" + fileName;
			//var downloadURL:URLRequest = new URLRequest(url);			
			 var downloadURL:URLRequest = new URLRequest(url);
			navigateToURL(downloadURL, "_blank" ); 
			super.result(data);
		}		
		
		
	}
}