package framework.view.pages.reservationCreate.component.dataGrid
{
	import framework.model.AppModelLocator;
	import framework.view.pages.reservationCreate.parts.GroupReservationCalendarViewGroupItemRenderer;
	import framework.view.pages.reservationCreate.parts.GroupReservationCalendarViewItemRenderer;
	
	import mx.collections.ArrayCollection;
	import mx.collections.HierarchicalCollectionView;
	import mx.collections.HierarchicalData;
	import mx.controls.AdvancedDataGrid;
	import mx.controls.advancedDataGridClasses.AdvancedDataGridColumn;
	import mx.core.ClassFactory;
	import mx.formatters.DateFormatter;
	import mx.formatters.NumberBaseRoundType;
	import mx.formatters.NumberFormatter;
	
	import services.vo.frontend.ReservationCalendarCellVO;

	public class GroupReservationCalendar extends AdvancedDataGrid
	{

    	[Bindable]
    	public var model:AppModelLocator = AppModelLocator.getInstance();
    	[Bindable]
    	public var showRowCount:int;

        public static const RCV_NUMBER_OF_SHOWN_DAYS:int = 14;
        private const RCV_DAY_UNIX_TIME:Number = 86400;
      
        protected var _aCalendarData:ArrayCollection;
        protected var _dDateFrom:Date;
        protected var _dDateTo:Date;
        protected var _dDateArrival:Date;
        protected var _dDateDeparture:Date;        
        private var _oDateFormatter:DateFormatter;
        private var _oItemFormatter:NumberFormatter;
        
          	
		public function GroupReservationCalendar()
		{
			super();
			showHeaders = false;
			
            _oDateFormatter = new DateFormatter();
            _oDateFormatter.formatString = "DD / MMM";

            _oItemFormatter = new NumberFormatter();
            _oItemFormatter.rounding = NumberBaseRoundType.NEAREST;
            _oItemFormatter.precision = 2;
            _oItemFormatter.useNegativeSign = false;
            _oItemFormatter.useThousandsSeparator = false;		
            
            
            itemRenderer = new ClassFactory(GroupReservationCalendarViewItemRenderer);
            groupItemRenderer = new ClassFactory(GroupReservationCalendarViewGroupItemRenderer);	
            
            draggableColumns = false;
		}

        override public function expandItem(item:Object, open:Boolean, animate:Boolean=false, dispatchEvent:Boolean=false, cause:Event=null):void
        {
        	super.expandItem(item, open, animate, dispatchEvent, cause);
        	calculateHeight();
        }

		private function calculateHeight():void
		{
            if(super.dataProvider is HierarchicalCollectionView)
            {
            	showRowCount = (super.dataProvider as HierarchicalCollectionView).length;
            	invalidateDisplayList();
            }			
		}
		
		override public function set dataProvider(value:Object):void
        {
            super.dataProvider = new HierarchicalData(value);
            showRowCount = 0;
            if(value != null)
            {
            	if(value is ArrayCollection)
            	{            		
            		showRowCount = (value as ArrayCollection).length;            		
            	}
            }
        }
		
        public function set aCalendarData(value:ArrayCollection):void
        {
        	if(value != null)
        	{	
        		if(value.length > 0)
        		{
		            _aCalendarData = value;
		
		            buildColumns();
		
		            dataProvider = _aCalendarData;
		
		            invalidateList();
		         }
         	}
        }
        

   
		 
        public function set dateArrival(value:Date):void
        {
            _dDateArrival = value;
        }

        public function set dateDeparture(value:Date):void
        {
            _dDateDeparture = value;
        }       

        private function defineDateFrom():void
        {
            if (_dDateArrival == null)
            {
                _dDateFrom = null;
                return;
            }
            _dDateFrom = new Date(_dDateArrival.time);
        }

        private function defineDateTo():void
        {
            if (_dDateFrom == null)
            {
                _dDateTo = null;
                return;
            }
            _dDateTo = new Date(_dDateArrival.time);
            _dDateTo.seconds += RCV_NUMBER_OF_SHOWN_DAYS * RCV_DAY_UNIX_TIME;
        }
        		
		protected function buildColumns():void
        {
           var columnList:Array = [];
            var adgColumn:AdvancedDataGridColumn;

            adgColumn = new AdvancedDataGridColumn();
            adgColumn.dataField = "name";
            adgColumn.width = 150;

            columnList.push(adgColumn);

            defineDateFrom();
            defineDateTo();

            if (_dDateFrom != null && _dDateTo != null)
            {
                var dDateCurrent:Date = new Date(_dDateFrom.time);
                var i:int = 0;

                while(dDateCurrent < _dDateTo)
                {
                    i++;
                    var cell:ReservationCalendarCellVO = _aCalendarData[0]["d"+i];
                   // var eventName:String = cell.sEvent; 
                    
                    //adgColumn = new ReservationCalendarViewColumn(_oDateFormatter.format(dDateCurrent) + "\n" + GlobalSettings.daysShort[dDateCurrent.getDay()],eventName);
                    adgColumn = new AdvancedDataGridColumn();
                    
                    adgColumn.dataField = "d" + i.toString();
                    adgColumn.formatter = _oItemFormatter;
                    //adgColumn.columnDate = new Date(dDateCurrent.time);


                    columnList.push(adgColumn);
                    dDateCurrent.seconds += RCV_DAY_UNIX_TIME;
                }
            }

            columns = columnList;	
 
        }
        
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			height = (showRowCount * rowHeight) + 50;
			trace("Group grid height: " + height.toString());
		}		
	}
}