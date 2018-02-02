package services.command.checkOut
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.checkOut.CheckOutDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.checkOut.DetachPackageFromAccountEvent;

	public class DetachPackageFromAccountCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = DetachPackageFromAccountEvent(event);
			var delegate:CheckOutDelegate = new CheckOutDelegate(this);
			delegate.detachPackageFromAccount(_event as DetachPackageFromAccountEvent);
			
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