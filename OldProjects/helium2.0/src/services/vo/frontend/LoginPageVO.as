package services.vo.frontend
{
	import framework.module.FirstLoginModule;
	import framework.module.ForgotPasswordModule;
	
	[Bindable]
	public class LoginPageVO
	{
		public var currentPage:int = 0;
		public var firstLoginModule:FirstLoginModule = new FirstLoginModule();
		public var forgotPasswordModule:ForgotPasswordModule = new ForgotPasswordModule();
	}
}