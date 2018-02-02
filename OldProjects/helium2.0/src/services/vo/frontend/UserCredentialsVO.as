package services.vo.frontend
{
	[RemoteClass(alias="MapUserCredentials")]
	[Bindable]
	public class UserCredentialsVO
	{
		public var sUserLogin:String;
		public var sUserPassword:String;
		
		public function UserCredentialsVO(sULogin:String, sUPassword:String):void
        {
            sUserLogin = sULogin;
            sUserPassword = sUPassword;
        }

	}
}