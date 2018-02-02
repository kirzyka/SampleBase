package services.command.inHouse
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.inHouse.InHouseDelegate;
	import services.business.reservation.GetPackagesRatesForReservationDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.inHouse.GetPackagesEvent;
	
	import mx.collections.ArrayCollection;

	public class GetPackagesCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = GetPackagesEvent(event);
			var delegate:InHouseDelegate = new InHouseDelegate(this);
			delegate.getPackages(_event as GetPackagesEvent); 
			
			super.execute(event);
		}

		override public function result(data:Object):void
		{
			model.reservationCreateModule.packagesRates = new ArrayCollection(data as Array);
			
			super.result(data);
		}
	}
}