package services.command.profiles.individual
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.profiles.ProfileDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.profiles.individual.DeletePersonalProfileEvent;

	public class DeletePersonalProfileCommand extends BaseCommand
	{
		/**
		 *  @override
		 *  
		 *  @see services.command.BaseCommand#execute
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = DeletePersonalProfileEvent(event);
			var delegate:ProfileDelegate = new ProfileDelegate(this);
			delegate.deletePersonalProfile(_event as DeletePersonalProfileEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 *  
		 *  @see services.command.BaseCommand#result
		 */
		override public function result(data:Object):void
		{
			if (Boolean(data))
			{
				model.profilesModule.individualPageList.removeItemAt((_event as DeletePersonalProfileEvent).index);
			}
			
			super.result(data);
		}
	}
}