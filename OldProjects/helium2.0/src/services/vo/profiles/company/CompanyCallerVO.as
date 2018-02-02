package services.vo.profiles.company
{
	import services.vo.profiles.ProfilePersonalVO;
	
	[RemoteClass(alias="MapCompanyCaller")]
	public class CompanyCallerVO
	{
		/**
		 *  This property contain default state of caller.
		 *  
		 *  @default false
		 */
		public var bIsPrimary:Boolean = false;
		/**
		 *  This property contain info about caller.
		 *  
		 *  @default new ProfilePersonalVO()
		 *  
		 *  @see services.vo.profiles.ProfilePersonalVO;
		 */
		public var oMapProfilePersonal:ProfilePersonalVO = new ProfilePersonalVO();
	}
}