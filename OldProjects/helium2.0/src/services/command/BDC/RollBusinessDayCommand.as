package services.command.BDC
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.BDC.BDCDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.BDC.RollBusinessDayEvent;

	public class RollBusinessDayCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = RollBusinessDayEvent(event);
			var delegate:BDCDelegate= new BDCDelegate(this);
			delegate.rollBusinessDay(_event as RollBusinessDayEvent);			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			super.result(data);
		}
	}
}