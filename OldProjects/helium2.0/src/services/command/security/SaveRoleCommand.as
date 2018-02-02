package services.command.security
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.security.SecurityDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.security.SaveRoleEvent;
	import services.vo.frontend.RoleVO;
	
	public class SaveRoleCommand extends BaseCommand
	{
	
		override public function execute(event:CairngormEvent):void
		{		
			_event = SaveRoleEvent( event );
			var delegate:SecurityDelegate = new SecurityDelegate(this);
			delegate.saveRole(event as SaveRoleEvent);
			super.execute(event);
		}

		override public function result(data:Object):void
		{
			model.securityModule.currentRoleID = (data as RoleVO).lId;
			super.result(data);					
		}

	}
}