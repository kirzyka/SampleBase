package services.vo.reports
{
	import com.adobe.cairngorm.vo.IValueObject;
	
	[RemoteClass(alias="MapPaymentJournal")]
	public class PaymentJournalVO implements IValueObject
	{		
	  public var sDateFrom:String;
  	  public var sDateTo:String;
//  public $aTransaction;
  	  public var aCashier:Array = new Array(); // HotelCashierShift 1,2,3
  	  public var aRoomType:Array = new Array();
  	  public var aRoom:Array = new Array(); // ???
  	  public var aTransactionGroup:Array = new Array();
  	  public var aTransactionSubGroup:Array = new Array();// ???
	}
}
