package services.vo
{
	public class GlobalImageAssets
	{
		private static var instance:GlobalImageAssets;
		
		public static function getInstance():GlobalImageAssets
		{
			if( instance == null ) instance = new GlobalImageAssets();
			
			return instance;
		}
		
		// Logo
		[Bindable]
		[Embed(source='/assets/logo/helium.svg')]
		public var baseLogo:Class;
		
		[Bindable]
		[Embed(source='/assets/logo/helium_logo.svg')]
		public var smallLogo:Class;
		
		
		[Bindable]
		[Embed(source="/assets/image/worldwide.png")]
		public var worldWide:Class;
		
		[Bindable]
		[Embed(source='/assets/image/transactionIcon.png')]
		public var transactionIcon:Class;
		
		[Bindable]
		[Embed(source='/assets/image/barNextMonthIcon.png')]
		public var barNextMonthIcon:Class;
		
		[Bindable]
		[Embed(source='/assets/image/barPrevMonthIcon.png')]
		public var barPrevMonthIcon:Class;
		
		
		/*			ICONS (ASSETS.SWF)			*/
		
		// A
		[Bindable]
		[Embed(source='/assets/assets.swf', symbol='AcceptIcon')]
		public var acceptIcon:Class;
		[Bindable]
		[Embed(source='/assets/assets.swf', symbol='AddIcon')]
		public var addIcon:Class;
		[Bindable]
		[Embed(source='/assets/assets.swf', symbol='ArrivalDateIcon')]
		public var arrivalDateIcon:Class;
		[Bindable]
		[Embed(source='/assets/assets.swf', symbol='ArrowRightIcon')]
		public var arrowRightIcon:Class;
		[Bindable]
		[Embed(source='/assets/assets.swf', symbol='ArrowLeftIcon')]
		public var arrowLeftIcon:Class;		
				
		// B				
		[Bindable]
		[Embed(source='/assets/assets.swf', symbol='BellIcon')]
		public var bellIcon:Class;
		[Bindable]
		[Embed(source='/assets/assets.swf', symbol='BinClosedIcon')]
		public var binClosedIcon:Class;


		// C
		[Bindable]
		[Embed(source='/assets/assets.swf', symbol='CalendarIcon')]
		public var calendarIcon:Class;		
		[Bindable]
		[Embed(source='/assets/assets.swf', symbol='CancelIcon')]
		public var cancelIcon:Class;
								
		[Bindable]
		[Embed(source='/assets/assets.swf', symbol='CartAddIcon')]
		public var cartAddIcon:Class;


		[Bindable]
		[Embed(source='/assets/assets.swf', symbol='CartGoIcon')]
		public var cartGoIcon:Class;		
					
					
		// D			
						
		
		// E		
		[Bindable]
		[Embed(source='/assets/assets.swf', symbol='EditIcon')]
		public var editIcon:Class;
		
		//G
		[Bindable]
		[Embed(source='/assets/assets.swf', symbol='GroupGoIcon')]
		public var groupGoIcon:Class;
		
		// R
		[Bindable]
		[Embed(source='/assets/assets.swf', symbol='RemoveIcon')]
		public var removeIcon:Class;

		
	}
}