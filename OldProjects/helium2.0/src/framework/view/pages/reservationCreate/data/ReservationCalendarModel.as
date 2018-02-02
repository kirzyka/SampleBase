package framework.view.pages.reservationCreate.data
{
    import flash.events.EventDispatcher;
    import flash.events.IEventDispatcher;
    
    import mx.collections.ArrayCollection;

    /**
     * @author v.avilov
     * 
     *  singleton class which manages supportable data in reservation calendar
     */
    public class ReservationCalendarModel extends EventDispatcher
    {
        /* implementing singleton pattern - begin*/
        private static var _instance:ReservationCalendarModel;
        
        public static function get instance():ReservationCalendarModel
        {
            if ( _instance == null)
            {
                _instance = new ReservationCalendarModel(new SingletonEnforcer());
            }
            
            return _instance;
        }
        /* implementing singleton pattern - end*/
        
        public var selectedColumnDataFieldList:ArrayCollection;
        public var firstSelectedColumnIndex:int = 0;
        public var lastSelectedColumnIndex:int = 0;
        public var selectedItemDataFieldList:ArrayCollection;
        public var selectedRow:int;
        public var isNotEnoughRooms:Boolean = false;
        
        [Bindable] public var calendarIsUpdated:Boolean;
        [Bindable] public var enableColumnSelection:Boolean;
        
        public function ReservationCalendarModel(singletonEnforcer:SingletonEnforcer, target:IEventDispatcher=null)
        {
            super(target);
            
            selectedColumnDataFieldList = new ArrayCollection();
            selectedItemDataFieldList = new ArrayCollection();
            selectedRow = -1;
            enableColumnSelection = false;
            calendarIsUpdated = true;
        }
    }
}

/**
 * private class to implement singleton pattern.
 * used as param in singleton constructor and hides it because of incapsulating
 *  
 * @author v.avilov
 * 
 */
internal class SingletonEnforcer
{
    public function SingletonEnforcer()
    {
    }
}