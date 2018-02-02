package services.command.backend
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.common.CommonDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.backend.GetCommonDictionariesEvent;
	import framework.module.CommonModule;
	import services.vo.GlobalStorage;
	import services.vo.common.CountryVO;
	import services.vo.common.SalutationVO;
	
	import mx.collections.ArrayCollection;

	public class GetCommonDictionariesCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = GetCommonDictionariesEvent(event);
			var delegate:CommonDelegate = new CommonDelegate(this);
			delegate.getCommonDictionaries(_event as GetCommonDictionariesEvent);
			
			super.execute( event );
		}
				
 		override public function result(data:Object):void
		{
			var test:Array = data['COUNTRY_LIST'];// it's hack
			
			
		 	var countries:ArrayCollection = new ArrayCollection(data['COUNTRY_LIST'] as Array);
			
			model.commonModule.countries = countries;
			for each(var country:CountryVO in countries)
			{
				CommonModule.addCountry(country);
				//GlobalStorage.addressStorage.addCountry((data['COUNTRY_LIST'] as Array)[i] as CountryVO);
			}
			
			model.roomSettingsModule.roomSettingsDP.removeAll();
			model.roomSettingsModule.roomSettingsDP = new ArrayCollection(data['ROOM_SETTING_LIST'] as Array);//not null			
			model.roomSettingsModule.maxRoomSettingsItems = model.roomSettingsModule.roomSettingsDP.length;
			
			 model.roomTypesModule.roomTypesDP.removeAll();
			 model.roomTypesModule.roomTypesDP = new ArrayCollection(data['ROOM_TYPE_LIST'] as Array);	
			 model.roomTypesModule.maxRoomTypesItems = model.roomTypesModule.roomTypesDP.length;
			
			 
			 GlobalStorage.language = new ArrayCollection( data['LANGUAGE_LIST'] as Array );
			
			 GlobalStorage.salutationAll = new ArrayCollection( data['SALUTATION_LIST'] as Array ); 
			
			 GlobalStorage.nationality = new ArrayCollection( data['NATIONALITY_LIST'] as Array ); 
			
			 GlobalStorage.vipTotal = new ArrayCollection(data['VIP_TOTAL_LIST'] as Array); //not null
			
			 GlobalStorage.mailings = new ArrayCollection(data['MAILING_LIST'] as Array); //not null
			 
			 GlobalStorage.sourceCodes = new ArrayCollection(data['SOURCE_CODE_LIST'] as Array); //not null
			 
			 GlobalStorage.marketCodes = new ArrayCollection(data['MARKET_CODE_LIST'] as Array);//not null			 
			 
			 GlobalStorage.loyaltyPrograms = new ArrayCollection(data['LOYALTY_PROGRAM_LIST'] as Array);
			 
			  GlobalStorage.sourceCodesGroups = new ArrayCollection(data['SOURCE_CODE_GROUP_LIST'] as Array);//not null
			  
			   GlobalStorage.marketCodeGroups = new ArrayCollection(data['MARKET_CODE_GROUP_LIST'] as Array);//not null

			
			
			// collect salutation by language
			var salutationList:Array = data['SALUTATION_LIST'] as Array;
			for each(var salutations:Array in salutationList)
			{
				for each(var salutation:SalutationVO in salutations)
				{
					var collection:ArrayCollection = _storage.salutation[salutation.lLanguageId];
					if (!collection)
					{
						collection = new ArrayCollection();
					}
					collection.addItem(salutation);
					_storage.salutation[salutation.lLanguageId] = collection;
				}
			}
			
			super.result( data );
		}
	}
}