package services.vo.reports
{
	import com.adobe.cairngorm.vo.IValueObject;
	
	[RemoteClass(alias="MapForecastSearch")]
	public class ForecastSearchVO implements IValueObject
	{		
	  public var sDateFrom:String;
  	  public var sDateTo:String;
  	  public var aRoomType:Array = new Array();
  	  
  	  public var bDeduct:Boolean = false;
  	  public var bNonDeduct:Boolean = false;
  	  public var bOutOfServiceRoom:Boolean = false;
  	  public var bRoomRevenueGross:Boolean = false;
	}
}