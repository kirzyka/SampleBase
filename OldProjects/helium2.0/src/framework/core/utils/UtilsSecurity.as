package framework.core.utils
{
	import framework.model.AppModelLocator;
	import services.vo.frontend.RoleVO;


	/**
	* The SecurityUtils class is
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/
	public class UtilsSecurity
	{

	/* ------------------------------------
	 * Permission List
	 * ------------------------------------ */

		public static const FIRST_TIME_LOGIN:int = 0;
		public static const VIEW_VATS:int = 1;
		public static const EDIT_VATS:int = 2;
		public static const VIEW_ROOM_SETTINGS:int = 3;
		public static const EDIT_ROOM_SETTINGS:int = 4;
		public static const VIEW_ROOM_TYPES:int = 5;
		public static const EDIT_ROOM_TYPES:int = 6;
		public static const VIEW_HOTEL_LIST:int = 7;
		public static const EDIT_HOTEL:int = 8;
		public static const VIEW_BARS:int = 9;
		public static const EDIT_BARS:int = 10;
		public static const VIEW_HOTEL_STAGE:int = 11;
		public static const EDIT_HOTEL_STAGE:int = 12;
		public static const VIEW_HOTEL_ROOM:int = 13;
		public static const EDIT_HOTEL_ROOM:int = 14;
		public static const VIEW_HOTEL_CHAIN_LIST:int = 15;
		public static const VIEW_CALENDAR:int = 16;
		public static const EDIT_RESERVATION:int = 17;
		public static const EDIT_RESERVATION_YIELD:int = 18;
		public static const VIEW_PROFILES:int = 19;
		public static const EDIT_PROFILES:int = 20;
		public static const EDIT_CALLER:int = 21;
		public static const GET_ADDITIONAL_CODES:int = 22;
		public static const GET_SYSTEM_DATE:int = 23;
		public static const VIEW_LOCATE:int = 24;
		public static const CARD_LIST:int = 25;
		public static const CARD_CATEGORY_LIST:int = 26;
		public static const DEPOSIT_STATUS_LIST:int = 27;
		public static const VIEW_HOTEL_ITEMS:int = 28;
  		public static const EDIT_HOTEL_ITEMS:int = 29;
		public static const VIEW_ARRIVAL_REPORT:int = 30;
		public static const VIEW_NOSHOW_REPORT:int = 31;
		public static const VIEW_INHOUSE_REPORT:int = 32;
		public static const VIEW_HOUSEKEEPING_REPORT:int = 33;
		public static const VIEW_OPENBALANCE_REPORT:int = 34;
		public static const EDIT_LOCATE:int = 35;
		public static const VIEW_SALUTATION:int = 36;
		public static const EDIT_SALUTATION:int = 37;
		public static const VIEW_LANGUAGE:int = 38;
		public static const EDIT_LANGUAGE:int = 39;
  		public static const VIEW_NATIONALITY:int = 40;
  		public static const EDIT_NATIONALITY:int = 41;
		public static const VIEW_SYS_ITEMS:int = 42;
		public static const EDIT_SYS_ITEMS:int = 43;
		public static const VIEW_COMPANY_RATES:int = 44;
		public static const EDIT_COMPANY_RATES:int = 45;
		public static const VIEW_PACKAGES:int = 46;
		public static const EDIT_PACKAGES:int = 47;

		public static const EDIT_ROLE:int = 48; // Add, save, delete role
		public static const EDIT_HOTEL_ROLE:int = 49; // Add, save, delete role for user in hotel
		public static const EDIT_USER:int = 50; // Add, save, delete user
		public static const GET_USER_IN_HOTEL:int = 51; //
		public static const VIEW_ROLE:int = 52; //

		public static const VIEW_HOUSEKEEP_ROOM:int = 53; // Get list room for Housekeeping
		public static const EDIT_HOUSEKEEP_ROOM:int = 54; // Set room status for Housekeeping
		public static const VIEW_LOYALTY_PROGRAMS:int = 55; // Get list Loyalty Programs
		public static const EDIT_LOYALTY_PROGRAMS:int = 56; // Set room Loyalty Programs
		public static const VIEW_CHECKOUT:int = 57; // Get CheckOut screen
		//public static const EDIT_CHECKOUT:int = 58; // Edit CheckOut
		public static const ITEMS_ROUTING:int = 58; // ITEMS_ROUTING
	  	public static const REVENUE_TRANSACT_CODE_REPORT:int = 59; //
	  	public static const PAYMENT_TRANSACT_CODE_REPORT:int = 60; //
	  	public static const DETAIL_GUEST_ACCOUNT_REPORT:int = 61; //

	  	public static const VIEW_VIP_TOTAL:int = 62; //
 		public static const VIEW_MAILING_LIST:int = 63; //
 		public static const VIEW_IN_HOUSE:int = 64; //
  		public static const EDIT_IN_HOUSE:int = 65; //

  		public static const PAYMENT_JOURNAL_REPORT:int = 66;
  		public static const PAYMENT_OF_DAY_REPORT:int = 67;

		public static const CASH_SHIFT_CLOSURE_REPORT:int = 68;
		public static const CREDIT_CARD_COMPARISON_REPORT:int = 69;
		public static const DETAILED_PAYMENT_REPORT:int = 70;
		public static const GET_BD_INFORMATION:int = 71;
		public static const VIEW_SHIFT_INFORMATION:int = 72;
		public static const OPEN_AND_CLOSE_SHIFT:int = 73;
		public static const VIEW_BUSINESS_DAY:int = 74;
		public static const CLOSE_BUSINESS_DAY:int = 75;
		public static const MANAGER_REPORT:int = 76;

	/* ------------------------------------
	 * Methods
	 * ------------------------------------ */
		public static function isHasPermission(permission:int):Boolean
		{
			var result:Boolean = false;
			var role:RoleVO = AppModelLocator.getInstance().currentUser.oRole;

			result = role.aPermission[permission] == 1;

			return result;
		}

        public static function isHasAllPermissions( ... args):Boolean
        {
            var result:Boolean = true;
			var role:RoleVO = AppModelLocator.getInstance().currentUser.oRole;
            for each (var arg:int in args)
            {
                if (role.aPermission[arg] == 0)
                {
                    result = false;
                    break;
                }
            }
            return result;
        }

        public static function isHasOneFromPermissions( ... args):Boolean
        {
            var result:Boolean = false;
			var role:RoleVO = AppModelLocator.getInstance().currentUser.oRole;
            for each (var arg:int in args)
            {
                if (role.aPermission[arg] == 1)
                {
                    result = true;
                    break;
                }
            }
            return result;
        }
	}
}