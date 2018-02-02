package services.command.security
{
	import com.adobe.cairngorm.control.CairngormEvent;

	import services.business.security.SecurityDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.security.GetSystemRoleListEvent;

	import mx.collections.ArrayCollection;

	public class GetSystemRoleListCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = GetSystemRoleListEvent(event);
			var evt:GetSystemRoleListEvent = GetSystemRoleListEvent( event );
			var delegate:SecurityDelegate = new SecurityDelegate( this );
			delegate.getSystemRoleList();
			super.execute(event);

		}

		override public function result(data:Object):void
		{
			super.result(data);
			model.securityModule.systemRoleList = new ArrayCollection(data as Array);
		}

	}
}