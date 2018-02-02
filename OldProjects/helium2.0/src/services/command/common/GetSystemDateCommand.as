package services.command.common
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.common.CommonDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.common.GetSystemDateEvent;
	import services.vo.GlobalSettings;
	
	import mx.controls.DateField;

	public class GetSystemDateCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = GetSystemDateEvent(event);
			var delegate:CommonDelegate = new CommonDelegate(this);
			delegate.getSystemDate(_event as GetSystemDateEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			model.businessDate = DateField.stringToDate(data.toString(), GlobalSettings.DATE_SERVER_FORMAT);
			//model.isBusinessDayOpen = (model.lastResponse.iStatus == ResponseVO.RESPONSE_STATUS_OK);
			model.isBusinessDayOpen = true;
			
			super.result(data);
		}
	}
}