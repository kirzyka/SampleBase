package services.vo.reports
{
	import com.adobe.cairngorm.vo.IValueObject;
	
	[RemoteClass(alias="MapItemElement")]
	[Bindable]
	public class TreeItemVO implements IValueObject
	{
		public var iId:int = 0;// unique id
	    public var iParentId:int = 0;
	    public var iReturnId:int = 0; // real id
	    public var sLabel:String = null;
	    public var children:Array = []; // TreeItemVO 
		
		//NEW////////////////////////////////////////
  		public var bCheckIn:Boolean=false;            // Show checkin guests
  		/////////////////////////////////////////////
  		[TRANSIENT]
  		public var selected:Boolean = false;
        [TRANSIENT]
        public var middle:Boolean = false;
	}
}
