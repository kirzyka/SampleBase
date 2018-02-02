package services.vo.frontend
{
	import services.vo.frontend.UserProfileVO;

	[RemoteClass(alias="MapLoggedInUser")]
	[Bindable]
	public class LoggedInUserVO
	{
		 /// <summary>
        /// First time loging in to the system
        /// </summary>
        public var bIsFirstTimeLogin:Boolean;

        /// <summary>
        /// User profile
        /// </summary>
        public var cLogInUser:UserProfileVO;

        /*/// <summary>
        /// Allowed hotels
        /// </summary>
        public var cUHotels:Object;*/
        
        public var sUserCode:String;
        public var lCurrentDate:Number;
		
		public var oRole:RoleVO;
		public var cUHotels:Array;

	}
}