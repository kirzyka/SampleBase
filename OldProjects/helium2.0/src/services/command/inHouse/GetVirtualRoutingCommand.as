package services.command.inHouse
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.inHouse.InHouseDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.inHouse.GetVirtualRoutingEvent;
	import services.vo.checkOut.itemRouting.ItemsRoutingVO;

	public class GetVirtualRoutingCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = GetVirtualRoutingEvent(event);
			var delegate:InHouseDelegate = new InHouseDelegate(this);
			delegate.getVirtualRouting(_event as GetVirtualRoutingEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			model.checkOutModule.updateCheckOutState(data as ItemsRoutingVO);
			
			super.result(data);
		}
	}
}