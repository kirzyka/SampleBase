package services.vo.frontend
{
	import com.adobe.cairngorm.vo.IValueObject;
	
	[RemoteClass(alias="MapUserProfile")]
	[Bindable]
	public class UserProfileVO implements IValueObject
	{
		//public var UserId:Number;
		public var lId:Number;
        public var sUserLogin:String;
        public var sUserPassword:String;
        public var sUserEmail:String;
        public var sDirectPhone:String;
        public var sForgottenQuestion:String;
        public var sForgottenAnswer:String;
        public var sUserName:String;
        public var bIsAdmin:Boolean;
        public var sUserSurname:String;
        public var sPhoneExtention:String;
        public var sLocale:String;   
        public var bIsDisabled:Boolean;    
        
	}
}