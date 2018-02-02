package services.command.cashShift
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.cashShift.CashShiftDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.cashShift.GetLastOpenShiftEvent;
	import services.vo.cashShift.CashierVO;

	public class GetLastOpenShiftCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		 
		override public function execute(event:CairngormEvent):void
		{
			_event = GetLastOpenShiftEvent(event);
			var delegate:CashShiftDelegate= new CashShiftDelegate(this);
			delegate.getLastOpenShift(_event as GetLastOpenShiftEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{						
			
			model.cashShiftModule.currOpenShift = data as CashierVO;
			
			super.result(data);
		}
	}
}