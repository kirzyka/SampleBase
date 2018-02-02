package framework.module
{
	import mx.collections.ArrayCollection;

	[Bindable]
	public class SecurityModule
	{
		public var currPage:int = 0;
		public var pageNames:Array = ["Roles","Users"];

		//---------
		public var roleList:ArrayCollection = new ArrayCollection(); //RoleVO
		public var systemRoleList:ArrayCollection = new ArrayCollection(); //RoleVO
		public var currentRoleID:int;
		public var userList:ArrayCollection = new ArrayCollection(); //UserProfileVO
		public var userListInHotel:ArrayCollection = new ArrayCollection(); //UserVO
	}
}