package services.command.cashShift
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.cashShift.CashShiftDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.cashShift.StartNewBusinessDayEvent;
	import services.vo.cashShift.BusinessDayVO;

	public class StartNewBusinessDayCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = StartNewBusinessDayEvent(event);
			var delegate:CashShiftDelegate= new CashShiftDelegate(this);
			delegate.startNewBusinessDay(_event as StartNewBusinessDayEvent);			
			super.execute(event);
		}	
			
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			if (data != null)
			model.cashShiftModule.currBusinessDay = data as BusinessDayVO;
						
			super.result(data);
		}
	}
}