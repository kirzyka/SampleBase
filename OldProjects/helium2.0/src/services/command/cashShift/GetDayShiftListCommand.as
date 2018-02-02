package services.command.cashShift
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.cashShift.CashShiftDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.cashShift.GetDayShiftListEvent;

	public class GetDayShiftListCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = GetDayShiftListEvent(event);
			var delegate:CashShiftDelegate= new CashShiftDelegate(this);
			delegate.getDayShiftList(_event as GetDayShiftListEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			model.cashShiftModule.cashShiftList = data as Array;
			/* if (model.cashShiftModule.cashShiftList.length != 0)
			{
				model.cashShiftModule.currOpenShift = model.cashShiftModule.cashShiftList[model.cashShiftModule.cashShiftList.length - 1];
			} */
			super.result(data);
		}
	}
}