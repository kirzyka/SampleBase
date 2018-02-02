package services.command.security
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.security.SecurityDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.security.DeleteUserHotelRoleEvent;
	import services.vo.frontend.UserVO;

	/**
	* The DeleteUserHotelRoleCommand class is 
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/
	public class DeleteUserHotelRoleCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = DeleteUserHotelRoleEvent( event );
			var delegate:SecurityDelegate = new SecurityDelegate( this );
			delegate.deleteUserHotelRole(event as DeleteUserHotelRoleEvent);
			super.execute(event);
		}
		
		override public function result(data:Object):void
		{
			if(data)
			{
				for each(var user:UserVO in model.securityModule.userListInHotel)
				{
					if(user.oUser.lId == (_event as DeleteUserHotelRoleEvent).iUserId)
					{
						model.securityModule.userListInHotel.removeItemAt(model.securityModule.userListInHotel.getItemIndex(user));
						model.securityModule.userListInHotel.refresh();
						
					}
				}
			}
			super.result(data);			
		}

		
	}
}