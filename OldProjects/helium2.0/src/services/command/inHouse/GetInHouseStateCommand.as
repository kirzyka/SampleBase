package services.command.inHouse
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.inHouse.InHouseDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.inHouse.GetInHouseStateEvent;
	import services.vo.common.PagerVO;
	
	import mx.collections.ArrayCollection;

	public class GetInHouseStateCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = GetInHouseStateEvent(event);
			var delegate:InHouseDelegate = new InHouseDelegate(this);
			delegate.getInHouseState(_event as GetInHouseStateEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			var context:PagerVO = data as PagerVO;
			model.inHouseModule.inHouseGuestsCount = context.lCount;
			model.inHouseModule.inHouseGuests = new ArrayCollection(context.aObjects);
			model.inHouseModule.inHouseGuests.refresh();
			
			super.result(data);
		}
	}
}