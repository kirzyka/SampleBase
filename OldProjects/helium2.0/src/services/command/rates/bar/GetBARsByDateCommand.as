package services.command.rates.bar
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.rates.bar.BARDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.rates.bar.GetBARsByDateEvent;
	import services.vo.rates.bar.BARSaveItemVO;

	public class GetBARsByDateCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = GetBARsByDateEvent(event);
			var delegate:BARDelegate = new BARDelegate(this);

			delegate.getBARsByDate(_event as GetBARsByDateEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{			
			model.ratesModule.barModule.pricesOfStartDate = data as BARSaveItemVO;
			super.result(data);
		}

	}
}