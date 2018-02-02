package services.command.profiles.travelAgency
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.profiles.ProfileDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.profiles.company.DeleteCompanyEvent;

	public class DeleteTravelAgencyCommand extends BaseCommand
	{
		/**
		 *  @override
		 *  
		 *  @see services.command.BaseCommand#execute
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = DeleteCompanyEvent(event);
			var delegate:ProfileDelegate = new ProfileDelegate(this);
			delegate.deleteCompanyProfile(_event as DeleteCompanyEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 *  
		 *  @see services.command.BaseCommand#result
		 */
		override public function result(data:Object):void
		{
			model.profilesModule.travelAgencyList.removeItemAt((_event as DeleteCompanyEvent).index);
			
			super.result(data);
		}
	}
}