package services.command.profiles.company
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.profiles.GetTAListDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.profiles.company.GetTravelAgencyListEvent;
	import services.vo.profiles.CompanyProfileViewVO;
	import services.vo.profiles.ProfilesPagerVO;
	
	import mx.collections.ArrayCollection;

	public class GetTAListCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = GetTravelAgencyListEvent(event);
			var delegate:GetTAListDelegate = new GetTAListDelegate(this);
			delegate.getTravelAgencyList(_event as GetTravelAgencyListEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			var company:CompanyProfileViewVO;
			var context:ProfilesPagerVO = data as ProfilesPagerVO;
			
			model.profilesModule.travelAgencyProfileCount = context.lCount;
			model.profilesModule.travelAgencyList = new ArrayCollection(context.aProfiles as Array);;
			
			super.result(data);
		}
	}
}