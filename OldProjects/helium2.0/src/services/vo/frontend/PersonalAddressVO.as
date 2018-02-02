package services.vo.frontend
{
	[RemoteClass(alias="MapPersonalAddress")]
	public class PersonalAddressVO
	{
		public var lProfileId:Number = 0;
		public var lAddressId:Number = 0;

    	public var sPhone:String = "";
    	
    	public var sFax:String = "";
    	public var sAddressLine1:String="";
    	public var sAddressLine2:String="";
    	public var sAddressCity:String="";
    	public var lAddressStateId:Number=0;
    	public var sAddressZip:String="";
    	public var lAddressZipId:Number=0;
 	   

	}
}