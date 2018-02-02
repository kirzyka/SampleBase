 package services.vo.rates.companyRates
{
	import mx.collections.ArrayCollection;

	[RemoteClass(alias="MapCompanyRateSysItem")]
	[Bindable]
	public class CompanyRateSysItemVO
	{
	  //TODO
	  public var lId:int;
	  public var sName:String;
	  public var sDescription:String;
	  public var sCodeDirect:String;
	  public var sVat:String;
	  public var sCode:String;
	  public var fPrice:Number;
	  public var aArrangementCode:Array;
	  }
	
}
 