package services.command.backend
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import services.business.backend.GetReportDelegate;
	import services.events.backend.GetReportEvent;
	import framework.model.AppModelLocator;
	
	import mx.controls.Alert;
	import mx.core.Application;
	import mx.rpc.IResponder;
	import mx.utils.URLUtil;

	public class GetReportCommand implements ICommand, IResponder
	{
		private var model:AppModelLocator = AppModelLocator.getInstance();
		
		private var file:FileReference;
		private var fileName:String;
		
		private var evt:GetReportEvent;
		private var delegate:GetReportDelegate;
		
		public function execute(event:CairngormEvent):void
		{
			evt = GetReportEvent( event );
			delegate = new GetReportDelegate( this );
			delegate.getArrivalReport( evt );
			
		}
		
		public function result(data:Object):void
		{
			//"http://dev.ramada.ameria.de/H2O_WEB.html";//			
			fileName = data.oResponse as String;
			
			var fullURL:String = Application.application.url;
			var url:String = URLUtil.getProtocol(fullURL) + "://" + URLUtil.getServerName(fullURL) + "/" + fileName;
			//var downloadURL:URLRequest = new URLRequest(url);			
			 var downloadURL:URLRequest = new URLRequest(url);
			navigateToURL(downloadURL, "_blank" ); //"_blank"
			
			
			if (evt.callBack != null)
			evt.callBack();
			
			/* if (evt.reports.length != 0)			
			{
				evt.report = evt.reports.shift();
				delegate.getArrivalReport( evt );
			} */
			
			model.appEnabled--;
		}
		
		public function fault(info:Object):void
		{
			Alert.show("Get Arrival Report failed");
			
			model.appEnabled--;
		}
		
	}
}