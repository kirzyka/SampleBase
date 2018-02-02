package flexUnit.model.data
{
	import services.vo.items.ArrangementCodeVO;
	import services.vo.items.ItemsGroupVO;
	
	public class TestTransactionsData
	{
		public var code:ArrangementCodeVO = new ArrangementCodeVO();
		public var item:ItemsGroupVO = new ItemsGroupVO();
		public var subitem:ItemsGroupVO = new ItemsGroupVO();
		
		public var codeEditCode:String;
		public var codeEditName:String;
		public var itemEditName:String;
		public var subitemEditName:String;
		
		public function TestTransactionsData()
		{
			code.sCode = "Test Code";
			code.sName = "Test Name";
			codeEditCode = code.sCode + "[Edit]";
			codeEditName = code.sName + "[Edit]";
			
			item.sName = "Test System Group";
			itemEditName = item.sName + "[Edit]";
			subitem.sName = "Test System SubGroup 1";
			subitemEditName = subitem.sName + "[Edit]";
		}
	}
}