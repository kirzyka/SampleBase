package services.vo.frontend
{
	import services.vo.profiles.ProfilePersonalVO;
	
	[RemoteClass(alias="MapProfileCaller")]
	public class CallerVO
	{
		public var oPersonalProfile:ProfilePersonalVO = new ProfilePersonalVO();

    	public var lCallerId:Number;
    	public var eMarketCode:Number;
    	public var eSourceCode:Number;
    	public var eCallerType:Number;

	}
}