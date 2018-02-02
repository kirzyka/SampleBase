package services.vo.frontend
{
	import com.adobe.cairngorm.vo.IValueObject;
	
	/**
	* The UserVO class is 
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/
	[RemoteClass(alias="MapUser")]
	[Bindable]
	public class UserVO implements IValueObject
	{
		public var oHotelRole:RoleVO;
		public var oSysRole:RoleVO;
		public var oUser:UserProfileVO;
	}
}