package services.command.profiles.company
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.profiles.ProfileDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.profiles.company.SaveCompanyProfileEvent;
	import services.vo.profiles.CompanyProfileViewVO;
	
	import mx.collections.ArrayCollection;

	public class SaveCompanyProfileCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = SaveCompanyProfileEvent(event);
			var delegate:ProfileDelegate = new ProfileDelegate(this);
			delegate.saveCompanyProfile(_event as SaveCompanyProfileEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			var index:int = (_event as SaveCompanyProfileEvent).index;
			var item:CompanyProfileViewVO = data as CompanyProfileViewVO;
			var provider:ArrayCollection = model.profilesModule.companyProfileList;
			
			if (index != -1)
			{
				if (index != provider.length)
				{
					// edit mode
					provider.removeItemAt(index);
					provider.addItemAt(item, index);
				}
				else
				{
					// add mode
					provider.addItemAt(item, index);
				}
			}
			
			super.result(data);
		}
	}
}