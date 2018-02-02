package framework.view.pages.checkOut.data
{
	public class PaymentData
	{
		public var name:String;
		public var type:int;
		public var state:String;
		
		public function PaymentData(name:String = "", type:int = 0, state:String = "")
		{
			this.name = name;
			this.type = type;
			this.state = state;
		}
	}
}