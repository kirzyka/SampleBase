package services.vo.frontend
{
	import services.vo.MapValueObject;
	
	[RemoteClass(alias="MapUserOptions")]
	public class UserOptionsVO extends MapValueObject
	{
		public var sUserCode:String;
		public var sUserLocale:String;
		
		public function UserOptionsConstructor(code:String, locale:String):void
		{
			sUserCode = code;
			sUserLocale = locale;
		}
	}
}