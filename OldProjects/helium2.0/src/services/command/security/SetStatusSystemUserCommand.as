package services.command.security
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.security.SecurityDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.security.SetStatusSystemUserEvent;
	/**
	* The SetStatusSystemUserCommand class is
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-09-04 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/
	public class SetStatusSystemUserCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = event as SetStatusSystemUserEvent;
			var delegate:SecurityDelegate = new SecurityDelegate( this );
			delegate.setStatusSystemUser(event as SetStatusSystemUserEvent);
			super.execute(event);
		}

		override public function result(data:Object):void
		{
			//model.barModule.currentPackage.iPackageId = data as int;
			super.result(data);
		}
		
	}
}