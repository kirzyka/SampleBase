package services.vo.reservation
{
	import com.adobe.cairngorm.vo.IValueObject;
	
	[RemoteClass(alias="MapRoomPersons")]
	[Bindable]
	public class RoomPersonsVO implements IValueObject
	{
		public var iAdults:int;            
  		public var iChildAbove:int;          
  		public var iChildMiddle:int;           
  		public var iChildBefore:int;         
  		public var aProfiles:Array = new Array();    
	}
}