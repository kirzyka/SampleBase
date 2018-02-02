package services.command.profiles.individual
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.profiles.ProfileDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.profiles.individual.GetProfileByIdEvent;
	import services.vo.profiles.ProfilePersonalVO;

	public class GetProfileByIdCommand extends BaseCommand
	{
		/**
		 *  @override
		 *  
		 *  @see services.command.BaseCommand#execute
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = GetProfileByIdEvent(event);
			var delegate:ProfileDelegate = new ProfileDelegate(this);
			delegate.getProfiles(_event as GetProfileByIdEvent);
			
			super.execute(event);
		}
		
		override public function result(data:Object):void
		{
			model.profilesModule.currentProfile = data as ProfilePersonalVO;
			
			super.result(data);
		}
	}
}