package services.command.rates.bar
{
	import com.adobe.cairngorm.control.CairngormEvent;

	import services.business.rates.bar.BARDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.rates.bar.GetHotelBarPriceEvent;

	import mx.collections.ArrayCollection;

	public class GetHotelBarPriceCommand extends BaseCommand
	{

		override public function execute(event:CairngormEvent):void
		{
			_event = event as GetHotelBarPriceEvent;
			var delegate:BARDelegate = new BARDelegate( this );
			delegate.getHotelBarPrice(event as GetHotelBarPriceEvent);
			super.execute(event);
		}

		override public function result(data:Object):void
		{
			model.ratesModule.barModule.barsForPackage = data;
			super.result(data);
		}


	}
}