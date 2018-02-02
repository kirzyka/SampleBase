package framework.module
{
	import flash.utils.Dictionary;
	
	import framework.view.components.address.data.AddressStorage;
	
	import mx.collections.ArrayCollection;
	import mx.utils.ObjectUtil;
	
	import services.vo.common.CityVO;
	import services.vo.common.CountryVO;
	import services.vo.common.LanguageVO;
	import services.vo.common.RegionVO;
	import services.vo.common.SalutationVO;
	import services.vo.frontend.UserOptionsVO;
	
	[Bindable]
	public class CommonModule
	{
		// ===================================================================== //
		//                         VARIABLES AND CONSTANTS                       //
		// ===================================================================== //
		public static const EMPTY_COLLECTION:ArrayCollection = new ArrayCollection();
		
		/**
		 *  This property is options of user logined in system.
		 *  
		 *  @default new UserOptionsVO()
		 *  
		 *  @see framework.vo.frontend.UserOptionsVO
		 */
		public static var userOptions:UserOptionsVO = new UserOptionsVO();
		
		/**
		 *  This property is all viewed cities.
		 *  	
		 *  @default new AddressStorage()
		 *  
		 *  @see framework.vo.AddressStorage
		 */
		private static var _addressStorage:AddressStorage = new AddressStorage();
		/**
		 *  This property is all viewed countries.
		 * This method is for data storing which lastest received from DB.
		 *  
		 *  @default new ArrayCollection()
		 *  
		 *  @see framework.vo.common.CountryVO
		 */
		private var _countries:/* CountryVO */ArrayCollection = new ArrayCollection();
		/**
		 *  This property is all viewed regions.
		 *  This method is for data storing which lastets received from DB.
		 *  
		 *  @default new ArrayCollection()
		 *  
		 *  @see framework.vo.common.RegionVO
		 */
		private var _regions:/* RegionVO */ArrayCollection = new ArrayCollection();
		/**
		 *  This property is all viewed cities.
		 *  This method is for data storing which lastest received from DB. 
		 * 
		 *  @default new ArrayCollection()
		 *  
		 *  @see framework.vo.common.CityVO
		 */
		private var _cities:/* CityVO */ArrayCollection = new ArrayCollection();
		/**		 * 
		 *  This property is dictionary with salutations by language.
		 *  The key for dictionay is id of language.
		 *  
		 *  @default new Dictionary(true)
		 */
		private var _salutation:Dictionary = new Dictionary(true);
		
		//public static var language:ArrayCollection = new ArrayCollection();
		
		public function CommonModule()
		{
		}
		
		/**
		 *  Get salutation by language.
		 *  
		 *  @param languageId:Number - id of language.
		 *  @param validate:Boolean - state of validation of salutation.
		 *         Validation is adding item "none" to salutation
		 *  
		 *  @return collection of salutations by language.
		 */
		public function salutationByLanguage(languageId:Number, validate:Boolean = false):ArrayCollection
		{
			var salutations:ArrayCollection = (_salutation[languageId]) ? _salutation[languageId] : EMPTY_COLLECTION;
			if (validate)
			{
				salutations = validateSalutation(salutations);
			}
			return salutations;
		}
		
		/**
		 *  Create and add none item for SALUTATION collection.
		 *  
		 *  @param salutation:ArrayCollection - collection of salutation
		 *         for which have to add item "none".
		 *  
		 *  @return salutation collection as ArrayCollection with "none"
		 *          item by language.
		 */
		public static function validateSalutation(salutation:ArrayCollection):ArrayCollection
		{
			// create "none" item
			var noneItem:SalutationVO = new SalutationVO();
			noneItem.lId = 0;
			noneItem.sDescription = "none";
			noneItem.sName = "none";
			// add "none" item to salutation
			var salutations:ArrayCollection = ObjectUtil.copy(salutation) as ArrayCollection;
			salutations.addItemAt(noneItem, 0);
			
			return salutations;
		}
		
		/**
		 *  Create and add none item for LANGUAGE collection.
		 *  
		 *  @param salutation:ArrayCollection - collection of language
		 *         for which have to add item "none".
		 *  
		 *  @return language collection as ArrayCollection with "none"
		 *          item.
		 */
		public static function validateLanguage(language:ArrayCollection):ArrayCollection
		{
			// create "none" item
			var noneItem:LanguageVO = new LanguageVO();
			noneItem.lId = 0;
			noneItem.sCode = "none";
			noneItem.sName = "none";
			// add "none" item to language
			var languages:ArrayCollection = ObjectUtil.copy(language) as ArrayCollection;
			languages.addItemAt(noneItem, 0);
			
			return languages;
		}
		
		/**
		 *  Compare two typed object such as Classes, Interfaces, etc.
		 *  
		 *  @param a:Object - first typed object for compare.
		 *  @param b:Object - second typed object for compare.
		 *  
		 *  @return result of compare.
		 */
		public static function compareObject(a:Object, b:Object):Boolean
		{
			var classInfo1:Object = ObjectUtil.getClassInfo(a);
			var classInfo2:Object = ObjectUtil.getClassInfo(b);
			
			if (classInfo1["name"] != classInfo2["name"]) return false;
			
			var props:Array = classInfo1["properties"];
			for(var i:int = 0; i < props.length; i++)
			{
				var prop:String = props[i]["localName"];
				if (a[prop] != b[prop]) return true;
			}
			
			return false;
		}
		
		/**
		 *  Add new country into the cashe for address's information.
		 *  
		 *  @param country:CountryVO - data for new adding country.
		 */
		public static function addCountry(country:CountryVO):void
		{
			_addressStorage.addCountry(country);
		}
		/**
		 *  Add region into the cashe for address's information by
		 *  owner country.
		 *  
		 *  @param region:RegionVO - data for new adding region.
		 */
		public static function addRegion(region:RegionVO):void
		{
			_addressStorage.addRegion(region);
		}
		/**
		 *  Add new city into the cashe for address's information by
		 *  owner region.
		 *  
		 *  @param city:CityVO - data for new adding city.
		 */
		public static function addCity(city:CityVO):void
		{
			_addressStorage.addCity(city);
		}
		/**
		 *  Get all regions by id of owner country.
		 *  <p>Check exist country by his id. If country is active - get 
		 *  all gis regions for view as ArrayCollection.
		 *  
		 *  @param countryId:Number - id of owner country for region which 
		 *  we have to get for view for active country.
		 *  
		 *  @return view as ArrayCollection for active country.
		 */
		public static function getRegions(countryId:Number):ArrayCollection
		{
			return _addressStorage.getRegions(countryId);
		}
		
		/**
		 * Return true if regions list present in the country with given id.
		 * And return false in other case.		 
		 *  
		 *  @param countryId:Number - id of owner country.
		 *  
		 *  @return Boolean.
		 */	
		public function isRegionsPresent(countryId:Number):Boolean
		{
			return _addressStorage.isPresentRegions(countryId);
		}	
		
		/**
		 *  Get region by id.
		 *  
		 *  @param regionId:Number - id of region.
		 *  
		 *  @return data of region.
		 */
		public static function getRegion(regionId:Number):RegionVO
		{
			return _addressStorage.getRegion(regionId);
		}
		/**
		 *  Get all cities by id of owner region.
		 *  <p>Check exist region by his id. If region is existed - get 
		 *  all his cities for view as ArrayCollection.
		 *  
		 *  @param regionId:Number - id of owner region by have to get
		 *  for view for active region.
		 *  
		 *  @return view as ArrayCollection for active region.
		 */
		public static function getCities(regionId:Number):ArrayCollection
		{
			return _addressStorage.getCities(regionId);
		}
		
		/**
		 * Return true if cities list present in the region with given id.
		 * And return false in other case.		 
		 *  
		 *  @param regionId:Number - id of owner region.
		 *  
		 *  @return Boolean.
		 */		
		public function isCitiesPresent(regionId:Number):Boolean
		{
			return _addressStorage.isCitiesPresent(regionId);			
		}
		
		/**
		 *  Get city by id.
		 *  
		 *  @param cityId:Number - id of city.
		 *  
		 *  @return data of city.
		 */
		public static function getCity(cityId:Number):CityVO
		{
			return _addressStorage.getCity(cityId);
		}
		// ===================================================================== //
		//                       GETTER AND SETTER HANDLERS                      //
		// ===================================================================== //
		/**
		 *  All viewed countries.
		 */
		public function get countries():ArrayCollection
		{
			return _countries;
		}
		/**
		 *  @private
		 */
		public function set countries(value:ArrayCollection):void
		{
			_countries = value;
		}
		
		/**
		 *  All viewed regions.
		 */
		public function get regions():ArrayCollection
		{
			return _regions;
		}
		/**
		 *  @private
		 */
		public function set regions(value:ArrayCollection):void
		{
			_regions = value;
		}
		
		/**
		 *  All viewed cities.
		 */
		public function get cities():ArrayCollection
		{
			return _cities;
		}
		/**
		 *  @private
		 */
		public function set cities(value:ArrayCollection):void
		{
			_cities = value;
		}
		
		/**
		 *  The dictionary with salutations by language.
		 *  The key for dictionay is id of language.
		 */
		public function get salutation():Dictionary
		{
			return _salutation;
		}
		/**
		 *  @private
		 */
		public function set salutation(value:Dictionary):void
		{
			_salutation = value;
		}
	}
}