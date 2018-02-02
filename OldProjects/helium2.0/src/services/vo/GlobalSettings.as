package services.vo
{
    import mx.collections.ArrayCollection;
    
    [Bindable]
    public class GlobalSettings
    {
        public static const DEFAULT_LOCALE:String = "en_US";
        //for all design
        public static const WIDTH_DATE_FIELD:int = 120; // width of date field
        
        
        //Login
        public static const LOGIN_MIN_LOGIN_LENGTH:int = 5;
        public static const LOGIN_MAX_LOGIN_LENGTH:int = 15;
        public static const LOGIN_MIN_PASSWORD_LEHGTH:int = 5;
        public static const LOGIN_MAX_PASSWORD_LEHGTH:int = 15;
        
        public static const DESCRIPTION_LENGTH:int = 250;
        public static const COMPANY_LENGTH:int = 250;
        public static const SHORT_DESCRIPTION_LENGTH:int = 100;
        public static const BUTTON_WIDTH:Number = 100;
        public static const BUTTON_WIDTH_APPLY:Number = 125;
        
        public static const ROOM_NAME_LENGTH:int = 5;
        public static const ADULTS_FOR_GROUP_RESERVATION:int = 5;
        
        public static const DATE_FORMAT:String = "DD/MM/YYYY";
        public static const DATE_SERVER_FORMAT:String = "YYYY-MM-DD";
        
        //guarantee Type
        public static const COMPANY:int = 1;
        public static const TA:int = 2;
        public static const CREDIT_CARD:int = 3;
        public static const DEPOSIT:int = 4;
        
        public static const DAY_UNIX_TIME:Number = 86400000;
        
        
        
        
        public static const LOGIN_INDEX:int = 0;
        public static const WORKSPACE_INDEX:int = 1;
        
        //PROMT MANAGER
        public static const PROMT_MANAGER_NOTE:String = "Note";
        public static const PROMT_MANAGER_QUEST:String = "Question";
        
        //for dictionary
        public static const DATA_LIST_TYPE_CONTACT:String = 'CONTACT';
        public static const DATA_LIST_TYPE_RHYTHM:String = 'RHYTHM';
        public static const DATA_LIST_TYPE_CREDIT_CARD:String = 'CREDIT_CARD';
        public static const DATA_LIST_TYPE_DEPOSIT_STATUS:String = 'DEPOSIT_STATUS';
        public static const DATA_LIST_TYPE_GUARANTEE:String = 'GUARANTEE';
        public static const DATA_LIST_TYPE_ORDER_STATUS:String = 'ORDER_STATUS';
        public static const DATA_LIST_TYPE_RSV_ROOM_STATUS:String = 'RSV_ROOM_STATUS';
        public static const DATA_LIST_TYPE_HOTEL_ROOM_STATUS:String = 'HOTEL_ROOM_STATUS';
        
        //Mandatory room settings
        /* public static const DISABLED:String = "DISABLED";
         public static const SMOKER:String = "SMOKER"; */
        public static const DS:String = "DS";
        public static const SM:String = "SM";
        public static const NS:String = "NS";
        
        /**
         *  This constant contain count of viewing company rates
         *  in the one page. It need for remote call to get
         *  rates by page.
         */
        public static const RATES_PAGE_COUNT:int = 10;
        
        public static const days:Array = [["Monday"], ["Tuesday"], ["Wednesday"],
                                          ["Thursday"], ["Friday"], ["Saturday"],
                                          ["Sunday"]];
        public static const daysShort:Array = [["SUN"], ["MON"], ["TUE"], ["WED"],
                                               ["THU"], ["FRI"], ["SAT"]];
    }
}