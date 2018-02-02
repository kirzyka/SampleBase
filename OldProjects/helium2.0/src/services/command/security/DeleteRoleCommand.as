package services.command.security
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.security.SecurityDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.security.DeleteRoleEvent;
	import framework.model.AppModelLocator;
	
	public class DeleteRoleCommand extends BaseCommand
	{
		
		override public function execute(event:CairngormEvent):void
		{
			_event = DeleteRoleEvent( event );		
			var delegate:SecurityDelegate = new SecurityDelegate(this);			
			delegate.deleteRole(event as DeleteRoleEvent);
			super.execute(event);
		}
	}
}