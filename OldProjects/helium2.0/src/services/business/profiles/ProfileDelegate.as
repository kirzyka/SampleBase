package services.business.profiles
{
	import services.cairngorm.BaseDelegate;
	import services.events.profiles.company.DeleteCompanyEvent;
	import services.events.profiles.company.GetAllListEvent;
	import services.events.profiles.company.GetCompanyByIdEvent;
	import services.events.profiles.company.GetCompanyListEvent;
	import services.events.profiles.company.GetMarketGroupListEvent;
	import services.events.profiles.company.GetSourceGroupListEvent;
	import services.events.profiles.company.SaveCompanyProfileEvent;
	import services.events.profiles.individual.DeletePersonalProfileEvent;
	import services.events.profiles.individual.FindProfileByNameEvent;
	import services.events.profiles.individual.FindProfileByNameForRsvEvent;
	import services.events.profiles.individual.FindProfileBySurnameEvent;
	import services.events.profiles.individual.FindProfileBySurnameForRsvEvent;
	import services.events.profiles.individual.GetProfileByIdEvent;
	import services.events.profiles.individual.GetProfilesPageEvent;
	import services.events.profiles.individual.GetWishesListEvent;
	import services.events.profiles.individual.SaveProfilesEvent;
	import services.events.profiles.travelAgency.GetTravelAgencyListEvent;
	import framework.module.CommonModule;
	import services.Services;
	import services.vo.GlobalStorage;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class ProfileDelegate extends BaseDelegate
	{
		/* Individual profiles method's name */
		public static const DELETE_PERSONAL_PROFILE:String = "DeletePersonalProfile";
		public static const FIND_PROFILE_BY_NAME:String = "FindProfileByName";
		public static const FIND_PROFILE_BY_SURNAME:String = "FindProfileBySurname";
		public static const FIND_PROFILE_BY_NAME_FOR_RESERVATION:String = "FindProfileByNameForRsv";
		public static const FIND_PROFILE_BY_SURNAME_FOR_RESERVATION:String = "FindProfileBySurnameForRsv";		
		public static const GET_PROFILE_BY_ID:String = "GetProfileById";
		public static const GET_PROFILES_PAGE:String = "GetProfilesPage";
		public static const GET_WISHES_LIST:String = "GetWishesList";
		public static const SAVE_PROFILE:String = "SaveProfile";
		/* Company profiles method's name */
		public static const DELETE_COMPANY_PROFILE:String = "DeleteCompanyProfile";
		public static const GET_COMPANY_PROFILE_BY_ID:String = "GetCompanyById";
		public static const GET_COMPANY_LIST:String = "GetCompanyList";
		public static const GET_MARKET_GROUP_LIST:String = "GetMarketGroupList";
		public static const GET_SOURCE_GROUP_LIST:String = "GetSourceGroupList";
		public static const SAVE_COMPANY_PROFILE:String = "SaveCompanyProfile";
		/* Travel agencies method's name */
		public static const DELETE_TRAVEL_AGENCY:String = "DeleteTravelAgency";
		public static const GET_TRAVEL_AGENCY_LIST:String = "GetTAList";
		public static const GET_TRAVEL_AGENCY_BY_ID:String = "GetTravelAgencyById";
		public static const SAVE_TRAVEL_AGENCY:String = "SaveTravelAgency";
		/* Common name */
		public static const GET_ALL_LIST:String = "GetAllList";
		
		/**
		 *  ProfileDelegate. Constructor.
		 *  
		 *  @param responder:IResponder - contact provider for any service.
		 */
		public function ProfileDelegate(responder:IResponder)
		{
			super(responder);
		}
		
		// ================================================================= //
		//                       INDIVIDUAL PROFILES                         //
		// ================================================================= //
		/**
		 *  Remote call to delete profile by id.
		 *  
		 *  @param event:DeletePersonalProfileEvent
		 */
		public function deletePersonalProfile(event:DeletePersonalProfileEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_PROFILE).getOperation(DELETE_PERSONAL_PROFILE);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.id);
		}
		/**
		 *  Remote call to find individaul profiles by name's pattern.
		 *  
		 *  @param event:FindProfileByNameEvent
		 */
		public function findProfileByName(event:FindProfileByNameEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_PROFILE).getOperation(FIND_PROFILE_BY_NAME);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.pattern, event.page, event.count);
		}
		/**
		 *  Remote call to find individaul profiles by surname's pattern.
		 *  
		 *  @param event:FindProfileBySurnameEvent
		 */
		public function findProfileBySurname(event:FindProfileBySurnameEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_PROFILE).getOperation(FIND_PROFILE_BY_SURNAME);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.pattern, event.page, event.count);
		}
		/**
		 *  Remote call to find individaul profiles by name's pattern.
		 *  
		 *  @param event:FindProfileByNameForRsvEvent
		 */
		public function findProfileByNameForRsv(event:FindProfileByNameForRsvEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_PROFILE).getOperation(FIND_PROFILE_BY_NAME_FOR_RESERVATION);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.pattern, event.page, event.count, event.startDate, event.endDate);
		}
		/**
		 *  Remote call to find individaul profiles by surname's pattern.
		 *  
		 *  @param event:FindProfileBySurnameForRsvEvent
		 */
		public function findProfileBySurnameForRsv(event:FindProfileBySurnameForRsvEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_PROFILE).getOperation(FIND_PROFILE_BY_SURNAME_FOR_RESERVATION);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.pattern, event.page, event.count, event.startDate, event.endDate);
		}	
		
		/**
		 *  Remote call to get individaul profile by id.
		 *  
		 *  @param event:FindProfileBySurnameEvent
		 */
		public function getProfiles(event:GetProfileByIdEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_PROFILE).getOperation(GET_PROFILE_BY_ID);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.profileId, event.hotelId);
		}
		/**
		 *  Remote call to get page of individual profiles.
		 *  
		 *  @param event:GetProfilesPageEvent
		 */
		public function getProfilesPage(event:GetProfilesPageEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_PROFILE).getOperation(GET_PROFILES_PAGE);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.page, event.count);
		}
		/**
		 *  Remote call to get list with wishes.
		 *  
		 *  @param event:GetWishesListEvent
		 */
		public function getWishesList(event:GetWishesListEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_PROFILE).getOperation(GET_WISHES_LIST);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions);
		}
		/**
		 *  Remote call to save individual profile.
		 *  
		 *  @param event:SaveProfilesEvent
		 */
		public function saveProfiles(event:SaveProfilesEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_PROFILE).getOperation(SAVE_PROFILE);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.profile, event.hotelId);
		}
		
		// ================================================================= //
		//                         COMPANY PROFILES                          //
		// ================================================================= //
		/**
		 *  Remote call to delete company profile by id.
		 *  
		 *  @param event:DeleteCompanyEvent
		 */
		public function deleteCompanyProfile(event:DeleteCompanyEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_PROFILE).getOperation(DELETE_COMPANY_PROFILE);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.id);
		}
		/**
		 *  Remote call to get company profile by id.
		 *  
		 *  @param event:GetCompanyProfileListEvent
		 */
		public function getCompanyById(event:GetCompanyByIdEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_PROFILE).getOperation(GET_COMPANY_PROFILE_BY_ID);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.id);
		}
		/**
		 *  Remote call to get list with company profiles.
		 *  
		 *  @param event:GetCompanyListEvent
		 */
		public function getCompanyProfileList(event:GetCompanyListEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_PROFILE).getOperation(GET_COMPANY_LIST);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.pattern, event.page, event.count);
		}
		/**
		 *  Remote call to get list with market codes.
		 *  
		 *  @param event:GetMarketGroupListEvent
		 */
		public function getMarketGroupList(event:GetMarketGroupListEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_PROFILE).getOperation(GET_MARKET_GROUP_LIST);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions);
		}
		/**
		 *  Remote call to get list with source codes.
		 *  
		 *  @param event:GetSourceGroupListEvent
		 */
		public function getSourceGroupList(event:GetSourceGroupListEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_PROFILE).getOperation(GET_SOURCE_GROUP_LIST)
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions);
		}
		/**
		 *  Remote call to save company profile.
		 *  
		 *  @param event:SaveCompanyProfileEvent
		 */
		public function saveCompanyProfile(event:SaveCompanyProfileEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_PROFILE).getOperation(SAVE_COMPANY_PROFILE);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.profile);
		}
		
		// ================================================================= //
		//                     TRAVEL AGENCY PROFILES                        //
		// ================================================================= //
		/**
		 *  Remote call for get list of all travel agencies.
		 *  
		 *  @param event:GetTAListEvent
		 */
		public function getTravelAgencyList(event:GetTravelAgencyListEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_PROFILE).getOperation(GET_TRAVEL_AGENCY_LIST);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.pattern, event.page, event.count);
		}
		
		// ================================================================= //
		//                         COMMON PROFILES                           //
		// ================================================================= //
		/**
		 *  Remote call for get list of companys and travel agencies.
		 *  
		 *  @param event:GetAllListEvent
		 */
		public function getAllList(event:GetAllListEvent):void
		{
			operation = service.getRemoteObject(Services.SERVICE_PROFILE).getOperation(GET_ALL_LIST);
			operation.addEventListener(ResultEvent.RESULT, handleResult);
			operation.send(CommonModule.userOptions, event.pattern, event.page, event.count);
		}
	}
}