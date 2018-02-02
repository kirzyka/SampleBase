package services.vo.reservation
{
	import com.adobe.cairngorm.vo.IValueObject;

	import services.vo.GlobalSettings;

	import mx.collections.ArrayCollection;
	import mx.controls.DateField;

	[RemoteClass(alias="MapOrder")]
	[Bindable]
	public class OrderVO implements IValueObject
	{
		public var iOrderId:int;
  		public var sStartDate:String;
 		public var sEndDate:String;
  		public var iRateType:int;
  		public var aClientsPerRoom:Array = new Array();
  		public var iRoomTypeId:int;
  		public var bIsDefinite:Boolean;
		public var iCompanyRateId:int;
		public var iPackageRateId:int;
		public var iRateId:int;
		public var iBarId:int;
        public var sOrderStatus:String;
        public var bCanCanceled:Boolean = false;

  		[Transient]
  		private var _iTotalAdults:int;

  		public function get iTotalAdults():int
  		{
  			var result:int = 0;
  			for each(var room:RoomPersonsVO in aClientsPerRoom)
  			{
  				result += room.iAdults;
  			}
  			/* HACK!!! */
  			if(result==0)
  			{
  				result = _iTotalAdults;
  			}
  			return result;
  		}

    	public function  set iTotalAdults(value:int):void
    	{
			_iTotalAdults = value;
    	}


  		[Transient]
  		private var _iTotalChildAbove:int;

   		public function get iTotalChildAbove():int
  		{
  			var result:int = 0;
  			for each(var room:RoomPersonsVO in aClientsPerRoom)
  			{
  				result += room.iChildAbove;
  			}
  			/* HACK!!! */
  			if(result==0)
  			{
  				result = _iTotalChildAbove;
  			}
  			return result;
  		}

    	public function  set iTotalChildAbove(value:int):void
    	{
			_iTotalChildAbove = value;
    	}

  		[Transient]
  		private var _iTotalChildMiddle:int;

   		public function get iTotalChildMiddle():int
  		{
  			var result:int = 0;
  			for each(var room:RoomPersonsVO in aClientsPerRoom)
  			{
  				result += room.iChildMiddle;
  			}
  			/* HACK!!! */
  			if(result==0)
  			{
  				result = _iTotalChildMiddle;
  			}
  			return result;
  		}

    	public function  set iTotalChildMiddle(value:int):void
    	{
			_iTotalChildMiddle = value;
    	}

  		[Transient]
  		private var _iTotalChildBefore:int;

   		public function get iTotalChildBefore():int
  		{
  			var result:int = 0;
  			for each(var room:RoomPersonsVO in aClientsPerRoom)
  			{
  				result += room.iChildBefore;
  			}
  			/* HACK!!! */
  			if(result==0)
  			{
  				result = _iTotalChildBefore;
  			}
  			return result;
  		}

    	public function  set iTotalChildBefore(value:int):void
    	{
			_iTotalChildBefore = value;
    	}
  		[Transient]
  		public var sRoomTypeFullName:String;
  		[Transient]
  		public var nPrice:Number;
  		[Transient]
  		private var _iRoomCount:int;

    	public function get iRoomCount():int
  		{
  			var result:int = 0;
  			result = aClientsPerRoom.length;

  			/* HACK!!! */
  			if(result==0)
  			{
  				result = _iRoomCount;
  			}
  			return result;
  		}

    	public function  set iRoomCount(value:int):void
    	{
			_iRoomCount = value;
    	}

  		[Transient]
  		public function get sStartDateUIFormat():String
  		{
			return DateField.dateToString(DateField.stringToDate(sStartDate,GlobalSettings.DATE_SERVER_FORMAT),GlobalSettings.DATE_FORMAT );
  		}
  		[Transient]
  		public function get sEndDateUIFormat():String
  		{
			return DateField.dateToString(DateField.stringToDate(sEndDate,GlobalSettings.DATE_SERVER_FORMAT),GlobalSettings.DATE_FORMAT );
  		}
  		[Transient]
  		public var aRoomPersonsView:ArrayCollection = new ArrayCollection();
  		[Transient]
  		public var iCurrentAdults:int = 0;
  		[Transient]
  		public var guestsPerRooms:ArrayCollection = new ArrayCollection();//RoomPersonVO

	}
}