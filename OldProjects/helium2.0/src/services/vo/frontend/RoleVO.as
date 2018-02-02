package services.vo.frontend
{
	import com.adobe.cairngorm.vo.IValueObject;
	
	[RemoteClass(alias="MapRole")]
	[Bindable]
	public class RoleVO implements IValueObject
	{
		public var lId:Number = 0;
        public var sName:String = ""; 
        public var sPermission:String = "";                          
        public var aPermission:Array;                            
	}
}