package services.vo.reservation
{
	import com.adobe.cairngorm.vo.IValueObject;

	[RemoteClass(alias="MapCreditCardType")]
	[Bindable]
	public class CreditCardTypeVO implements IValueObject
	{
		public var lId:int;
    	public var sCode:String;
    	public var sName:String;
	}
}