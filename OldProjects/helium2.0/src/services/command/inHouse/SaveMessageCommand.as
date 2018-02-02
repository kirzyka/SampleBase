package services.command.inHouse
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.inHouse.InHouseDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.inHouse.SaveMessageEvent;
	import services.vo.inHouse.InHouseViewVO;
	import services.vo.inHouse.PersonMessageVO;

	public class SaveMessageCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = SaveMessageEvent(event);
			var delegate:InHouseDelegate = new InHouseDelegate(this);
			delegate.saveMessage(_event as SaveMessageEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			var message:PersonMessageVO = (data as PersonMessageVO);
			for each(var guest:InHouseViewVO in model.inHouseModule.inHouseGuests)
			{
				if (guest.lProfileId == message.lProfileId)
				{
					guest.aUnreadMessages.push(message);
					break;
				}
			}
			
			super.result(data);
		}
	}
}