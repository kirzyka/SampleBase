package services.vo
{
    import com.adobe.cairngorm.control.CairngormEventDispatcher;
    
    import mx.collections.ArrayCollection;
    
    import services.business.common.CommonDelegate;
    import services.controller.AppController;
    import services.events.backend.GetCommonDictionariesEvent;
    import services.events.common.GetDataListByTypeEvent;
    import services.events.common.GetMarketCodesEvent;
    import services.events.common.GetSourceCodesEvent;
    import services.events.miscellaneous.langueges.GetLanguageEvent;
    import services.events.miscellaneous.loyaltyPrograms.GetLoyaltyProgramsEvent;
    import services.events.miscellaneous.nationalities.GetNationalityEvent;
    import services.events.miscellaneous.salutation.GetSalutationEvent;
    import services.events.profiles.company.GetMarketGroupListEvent;
    import services.events.profiles.company.GetSourceGroupListEvent;
    import services.vo.profiles.ProfileSpecialWishesVO;
    
    [Bindable]
    public class GlobalStorage
    {
        public static var endpoint:String = "";
        
        
        
        public static var wishes:ProfileSpecialWishesVO = new ProfileSpecialWishesVO();
        
        public static var mailings:ArrayCollection = new ArrayCollection();
        
        public static var salutation:ArrayCollection = new ArrayCollection();
        public static var salutationAll:ArrayCollection = new ArrayCollection();
        public static var language:ArrayCollection = new ArrayCollection();
        //public static var sex:ArrayCollection = new ArrayCollection( ["Male", "Female"] );
        public static var hotelChain:ArrayCollection = new ArrayCollection();
        public static var orderStatus:ArrayCollection = new ArrayCollection(["Tentative",
                                                                             "Definite"]);
        public static var callerTypes:ArrayCollection = new ArrayCollection(["Individual",
                                                                             "Company",
                                                                             "Travel Agent"]);
        
        /* public static var searchFieldRoomSettings:Array=[["All fields"],["Code"],["Description"]];	 */
        public static var searchFieldRoomSetting:Array = [["All fields"], ["Code"],
                                                          ["Description"]];
        public static var searchFieldRoomType:Array = [["All fields"], ["Room type"],
                                                       ["Short name"], ["Description"]];
        
        //public static var tempRoomSetting:ArrayCollection = new ArrayCollection();
        
        public static var vipTotal:ArrayCollection = new ArrayCollection();
        public static var vipHotel:ArrayCollection = new ArrayCollection();
        public static var smokerField:ArrayCollection = new ArrayCollection([{bIsSelected: false, sName: 'none', lId: 0},
                                                                             {bIsSelected: false, sName: 'Smoker', lId: 1},
                                                                             {bIsSelected: false, sName: 'Non-Smoking', lId: 2}]);
        public static var nationality:ArrayCollection = new ArrayCollection();
        public static var loyaltyPrograms:ArrayCollection = new ArrayCollection();
        public static var sourceCodes:ArrayCollection = new ArrayCollection(); //SourceCodesVO
        public static var sourceCodesGroups:ArrayCollection = new ArrayCollection(); //SourceCodesGroupVO
        public static var marketCodes:ArrayCollection = new ArrayCollection(); //MarketCodesVO
        public static var marketCodeGroups:ArrayCollection = new ArrayCollection(); //MarketCodeGroupVO
        
        public static var housekeepingStatuses:ArrayCollection = new ArrayCollection(); // HouseKeeping Status
        
        public static var creditType:ArrayCollection = new ArrayCollection();
        public static var cardOf:ArrayCollection = new ArrayCollection();
        
        public static var countriesId:int = 0;
        
        public static var flagShift:Boolean = false;
        public static var flagPopUp:Boolean = false;
        
        //public static var addressStorage:AddressStorage = new AddressStorage();
        
        public static var test:Boolean = true; //now test without database
        
        public static var selectStageIndex:int = 0; // for room and stage
        
        // functions for callBack
        //public static var editCompanyRate: Function;
        public static var changeEnabledHotelTubs:Function;
        
        public static function checkCache():void
        {
            var event:GetCommonDictionariesEvent = new GetCommonDictionariesEvent(CommonDelegate.GET_COMMON_DICTIONARY);
            CairngormEventDispatcher.getInstance().dispatchEvent(event);
        }
        
        /**
         *  Check availiable to get languages from server.
         */
        public static function getLanguage():void
        {
            if (language.length == 0)
            {
                var event:GetLanguageEvent = new GetLanguageEvent(AppController.GET_LANGUAGE_EVENT);
                CairngormEventDispatcher.getInstance().dispatchEvent(event);
            }
        }
        
        /**
         *  Check availiable to get salutations from server.
         */
        public static function getSalutation():void
        {
            if (salutation.length == 0)
            {
                var event:GetSalutationEvent = new GetSalutationEvent(AppController.GET_SALUTATION_EVENT);
                CairngormEventDispatcher.getInstance().dispatchEvent(event);
            }
        }
        
        /**
         *  Check availiable to get nationalitys from server.
         */
        public static function getNationality():void
        {
            if (nationality.length == 0)
            {
                var event:GetNationalityEvent = new GetNationalityEvent(AppController.GET_NATIONALITY_EVENT);
                CairngormEventDispatcher.getInstance().dispatchEvent(event);
            }
        }
        
        /**
         *  Check availiable to get loyalty programs from server.
         */
        public static function getProgram():void
        {
            if (loyaltyPrograms.length == 0)
            {
                var programEvt:GetLoyaltyProgramsEvent = new GetLoyaltyProgramsEvent(AppController.GET_LOYALTY_PROGRAMS_EVENT);
                CairngormEventDispatcher.getInstance().dispatchEvent(programEvt);
            }
        }
        
        /**
         *  Check availiable to get sourceCodesGroup from server.
         */
        public static function getSourceCodesGroup():void
        {
            if (sourceCodesGroups.length == 0)
            {
                var sourceEvt:GetSourceGroupListEvent = new GetSourceGroupListEvent(AppController.GET_SOURCE_GROUP_LIST);
                CairngormEventDispatcher.getInstance().dispatchEvent(sourceEvt);
            }
        }
        
        /**
         *  Check availiable to get sourceCodes from server.
         */
        public static function getSourceCodes():void
        {
            if (sourceCodes.length == 0)
            {
                var sourceEvt:GetSourceCodesEvent = new GetSourceCodesEvent(AppController.GET_SOURCE_CODES);
                CairngormEventDispatcher.getInstance().dispatchEvent(sourceEvt);
            }
        }
        
        /**
         *  Check availiable to get HousekeepingStatus from server.
         */
        public static function getHousekeepingStatus():void
        {
            if (housekeepingStatuses.length == 0)
            {
                var sourceEvt:GetDataListByTypeEvent = new GetDataListByTypeEvent(AppController.GET_DATA_LIST);
                sourceEvt.sDictionaryType = GlobalSettings.DATA_LIST_TYPE_HOTEL_ROOM_STATUS;
                CairngormEventDispatcher.getInstance().dispatchEvent(sourceEvt);
            }
        }
        
        /**
         *  Check availiable to get MarketCodesGroup from server.
         */
        public static function getMarketCodesGroup():void
        {
            if (GlobalStorage.marketCodeGroups.length == 0)
            {
                var marketEvt:GetMarketGroupListEvent = new GetMarketGroupListEvent(AppController.GET_MARKET_GROUP_LIST);
                CairngormEventDispatcher.getInstance().dispatchEvent(marketEvt);
            }
        }
        
        /**
         *  Check availiable to get MarketCodes from server.
         */
        public static function getMarketCodes():void
        {
            if (GlobalStorage.marketCodes.length == 0)
            {
                var marketEvt:GetMarketCodesEvent = new GetMarketCodesEvent(AppController.GET_MARKET_CODES);
                CairngormEventDispatcher.getInstance().dispatchEvent(marketEvt);
            }
        }
    }
}