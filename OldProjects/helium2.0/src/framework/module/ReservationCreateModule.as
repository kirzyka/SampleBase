package framework.module
{
	import mx.collections.ArrayCollection;
	
	import services.vo.backend.PackageVO;
	import services.vo.common.ContactVO;
	import services.vo.profiles.CompanyProfileVO;
	import services.vo.profiles.ProfileCallerVO;
	import services.vo.rates.companyRates.CompanyRateObjectVO;
	import services.vo.reservation.GroupReservationVO;

	[Bindable]
	public class ReservationCreateModule
	{
		public var currPage:int = 0;
		public var pageNames:Array =						["Reservation", "Personal data"];
		public var reservationMode:int;						// 0 - Individual, 1 - Group

		public var aCalendarRoomStatus:ArrayCollection = new ArrayCollection();
		public var aCalendar:ArrayCollection = new ArrayCollection();
		public var aGroupCalendar:ArrayCollection = new ArrayCollection();
		
		public var confirmToList:ArrayCollection = new ArrayCollection();
		public var guaranteeType:Array = 					["none","Company", "Travel Agency", "Guest"];
		public var paidTypeCompany:Array = 					["none","Company", "Guest"];
		public var paidTypeTA:Array = 						["none","Voucher"];
		public var guaranteeGuestType:Array = 				["Deposit", "Credit Card"];
		public var callerIsGuest:Boolean = false;
		public var guestsPerRooms:ArrayCollection = new ArrayCollection();//RoomPersonVO

		public var confirmationCode:String = "";

		public var orders:ArrayCollection = new ArrayCollection();
		public var aGroupBasket:ArrayCollection = new ArrayCollection(); //GroupBasketItem
		
		public var currentGroupReservation:GroupReservationVO;

		public var caller:ProfileCallerVO = new ProfileCallerVO();
		public var callerFirstName:String = "";
		public var callerLastName:String = "";
		public var callerTel:String = "";

		public var callerCompany:CompanyProfileVO = new CompanyProfileVO();
		public var reservationProfiles:ArrayCollection = new ArrayCollection(); //ProfilePersonalVO

		public var companyRates:ArrayCollection = new ArrayCollection();
		public var packagesRates:ArrayCollection = new ArrayCollection();

		public var selectedCompanyRates:ArrayCollection = new ArrayCollection();
		public var selectedPackageRates:ArrayCollection = new ArrayCollection();

		public var rateType:int = 0;
		public var rateTypeLabel:ArrayCollection = new ArrayCollection(['BAR','Company Rate','Package']);

		public var typeOfConfirmation:Array = [{id:ContactVO.CONTACT_WHITE_MAIL,label:'White'}, {id:ContactVO.CONTACT_WORK_PHONE,label:'Phone'}, {id:ContactVO.CONTACT_WORK_EMAIL,label:'Email'}];
		public var typeConfirmationTo:Array = [{label:'none',data:-1},{label:'Caller',data:0},{label:'Individual',data:1},{label:'Manual',data:2}];
		public var typeCompanySearch:Array = [{label:'Company Name',data:0},{label:'Rate Name',data:1}];
		public var typeProfileSearch:Array = [{label:'First Name',data:0},{label:'Name',data:1},{label:'Company Name',data:2}];
		public var typeCompanyAdd:Array = [{label:'Company',data:0},{label:'Travel Agency',data:1}];

		public static const BAR:int = 0;
		public static const COMPANY_RATE:int = 1;
		public static const PACKAGE_RATE:int = 2;

		public var totalPrice:Number = 0;
		public var iRoomCapacity:int = 0;
		public var iCancelationPolicy:int = 0;
		public var iMinStay:int = 0;
		public var bIsGuarantee:Boolean = false;

		public var basketTotalPrice:Number = 0;

		public var newReservationID:int;
		public var guestList:ArrayCollection = new ArrayCollection(); //ProfilePersonalVO
		public var confirmationLetterBody:String;
		public var confirmationLetterURL:String;

		// for InHouse module
		public var companyRate:CompanyRateObjectVO = new CompanyRateObjectVO();
		public var packageRate:PackageVO = new PackageVO();
		public var walkIn:Boolean = false;
	}
}