package services.command.inHouse
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.inHouse.InHouseDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.inHouse.GetAvailableRoomsListEvent;
	import services.vo.inHouse.AvailableRoomsVO;
	
	import mx.collections.ArrayCollection;

	public class GetAvailableRoomsListCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = GetAvailableRoomsListEvent(event);
			var delegate:InHouseDelegate = new InHouseDelegate(this);
			delegate.getAvailableRoomsList(_event as GetAvailableRoomsListEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			var i:AvailableRoomsVO;
			model.inHouseModule.availableRooms = new ArrayCollection(data as Array);
			
			super.result(data);
		}
	}
}