package model
{
	import flash.net.SharedObject;
	
	import model.modules.ModCollections;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class AppModel
	{
		public static const SPLASH_SCREEN:int = 0;
		public static const MAIN_SCREEN:int = 1;
		public static const HELP_SCREEN:int = 2;
		
		private static var instance:AppModel;
		
		public static function getInstance():AppModel
		{
			if(!instance)
			{
				instance = new AppModel();
			}
			return instance;
		}
		
		public function AppModel()
		{
		}
		
		
		public var wrapper:Object;
		
		public var currentView:int = SPLASH_SCREEN;
		public var currentDate:Number;
		public var productsToday:ArrayCollection = new ArrayCollection(); //ProductTodayVO
		public var sharedObject:SharedObject;
		
		public var adsString:String;
		
		// modules
		public var modCollections:ModCollections = new ModCollections();
	}
}