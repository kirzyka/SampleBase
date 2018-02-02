package services.command.profiles.travelAgency
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.profiles.ProfileDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.profiles.travelAgency.GetTravelAgencyListEvent;
	import services.vo.common.PagerVO;
	import services.vo.profiles.CompanyProfileViewVO;
	
	import mx.collections.ArrayCollection;

	public class GetTravelAgencyListCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = GetTravelAgencyListEvent(event);
			var delegate:ProfileDelegate = new ProfileDelegate(this);
			delegate.getTravelAgencyList(_event as GetTravelAgencyListEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			var company:CompanyProfileViewVO;
			var context:PagerVO = data as PagerVO;
			
			model.profilesModule.travelAgencyProfileCount = context.lCount;
			model.profilesModule.travelAgencyList = new ArrayCollection(context.aObjects);
			
			super.result(data);
		}
	}
}