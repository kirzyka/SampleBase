package services.command.inHouse
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.inHouse.InHouseDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.inHouse.MarkMessageAsReadEvent;

	public class MarkMessageAsReadCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = MarkMessageAsReadEvent(event);
			var delegate:InHouseDelegate = new InHouseDelegate(this);
			delegate.markMessageAsRead(_event as MarkMessageAsReadEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			model.inHouseModule.deliverDateTime = (data as String);
			
			super.result(data);
		}
	}
}