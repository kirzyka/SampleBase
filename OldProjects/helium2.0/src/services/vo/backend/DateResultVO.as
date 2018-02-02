 package services.vo.backend
{
	[Bindable]
	public class DateResultVO
	{
		public var date:String;
		public var day:int;
		public var month:int;
		public var year:int;
		public var dayIndex:int;
		public var weekIndex:int;
		public var totalDayInMonth:Number;
		
		public function DateResultVO(_date:String, _day:int, _month:int, _year:int, _dayIndex:int, _weekIndex:int, _totalDays:Number)
		{
			date = _date;
			day = _day;
			month = _month;
			year = _year;
			dayIndex = _dayIndex;
			weekIndex = _weekIndex;
			totalDayInMonth = _totalDays;
		}

	}
} 