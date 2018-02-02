package flexUnit.tests
{
	import flexUnit.BaseTestCase;
	
	import mx.collections.ArrayCollection;
	
	import services.business.items.ItemsDelegate;
	import services.cairngorm.BaseEvent;
	import services.events.items.arrangementCodes.DeleteArrangementEvent;
	import services.events.items.arrangementCodes.GetArrangementsEvent;
	import services.events.items.arrangementCodes.SaveArrangementsEvent;
	import services.events.items.itemGroups.GetSystemGroupsListEvent;
	import services.events.items.itemGroups.SaveSystemGroupEvent;
	import services.events.items.itemGroups.SaveSystemSubGroupEvent;
	import services.vo.items.ArrangementCodeVO;
	import services.vo.items.ItemsGroupVO;

	public class ItemsGroupTest extends BaseTestCase
	{
		private var arrangements:Array = [];
		/**
		 *  
		 */
		private var indexCode:int = 0;
		private var newCode:ArrangementCodeVO;
		
		private var indexItem:int = 0;
		private var indexSubItem:int = 0;
		private var newGroup:ItemsGroupVO;
		private var newSubGroup:ItemsGroupVO;
		
		// --------------------------------------------------------------- //
		//                    ARRANGEMENTS CODE UNIT TEST                  //
		// --------------------------------------------------------------- //
		/**
		 *  Start test of use arrangement codes with server side.
		 */
		public function testArrangements():void
		{
			// simple get arrangements list
			addCallBack(ItemsDelegate.GET_ARRANGEMENTS_LIST, getArrangementCodeCallback);
			var event:GetArrangementsEvent = new GetArrangementsEvent(ItemsDelegate.GET_ARRANGEMENTS_LIST);
			event.dispatch();
		}
		/**
		 *  The callback function by get arrangements list.
		 *  Try save new arrangement code for make test for it.
		 *  
		 *  @param e:BaseEvent - not used.
		 */
		private function getArrangementCodeCallback(e:BaseEvent):void
		{
			// complete for get arrangement code list
			assertTrue(true);
			// update data for tests
			indexCode = model.transactionModule.arrangementCodesList.length;
			
			// try add test arrangement code
			addCallBack(ItemsDelegate.SAVE_ARRANGEMENTS, addArrangementCodeCallback);
			var event:SaveArrangementsEvent = new SaveArrangementsEvent(ItemsDelegate.SAVE_ARRANGEMENTS);
			event.code = modelTest.testTransactionsData.code;
			event.dispatch();
		}
		/**
		 *  The callback function by save new arrangement code. Check properties
		 *  after save for correct values.
		 *  Try edit saved arrangement code for make test for it.
		 *  
		 *  @param e:BaseEvent - not used.
		 */
		private function addArrangementCodeCallback(e:BaseEvent):void
		{
			// update saved arrangement code
			var testCodeData:ArrangementCodeVO = modelTest.testTransactionsData.code;
			var codeList:ArrayCollection = model.transactionModule.arrangementCodesList;
			var code:ArrangementCodeVO = codeList.getItemAt(indexCode) as ArrangementCodeVO;
			// store for checking added item
			newCode = code;
			// check add new arrangemet code in list
			var len:int = model.transactionModule.arrangementCodesList.length;
			assertTrue("Check changes of count of arrangemgent codes: ", len == (indexCode + 1));
			// check properties for saved arrangement code
			assertTrue("Code->lId  : ", code.lId != 0);
			assertTrue("Code->sCode: ", code.sCode == testCodeData.sCode);
			assertTrue("Code->sName: ", code.sName == testCodeData.sName);
			
			// make changes into code
			code.sCode = modelTest.testTransactionsData.codeEditCode;
			code.sName = modelTest.testTransactionsData.codeEditName;
			// try edit test arrangement code
			addCallBack(ItemsDelegate.SAVE_ARRANGEMENTS, editArrangementCodeCallback);
			var event:SaveArrangementsEvent = new SaveArrangementsEvent(ItemsDelegate.SAVE_ARRANGEMENTS);
			event.code = code;
			event.dispatch();
		}
		/**
		 *  The callback function by edit arrangement code. Check properties
		 *  after save for correct values.
		 *  Try remove tested arrangement code for make test for it.
		 *  
		 *  @param e:BaseEvent - not used.
		 */
		private function editArrangementCodeCallback(e:BaseEvent):void
		{
			// update saved arrangement code
			var codeList:ArrayCollection = model.transactionModule.arrangementCodesList;
			var code:ArrangementCodeVO = codeList.getItemAt(indexCode) as ArrangementCodeVO;
			// check properties for saved arrangement code
			assertTrue("Code->lId  : ", code.lId == newCode.lId);
			assertTrue("Code->sCode: ", code.sCode == modelTest.testTransactionsData.codeEditCode);
			assertTrue("Code->sName: ", code.sName == modelTest.testTransactionsData.codeEditName);
			
			// update length of codes list
			indexCode = model.transactionModule.arrangementCodesList.length;
			
			// try remove test arrangement code
			addCallBack(ItemsDelegate.DELETE_ARRANGEMENT, removeArrangementCodeCallback);
			var event:DeleteArrangementEvent = new DeleteArrangementEvent(ItemsDelegate.DELETE_ARRANGEMENT);
			event.codeId = code.lId;
			event.dispatch();
		}
		/**
		 *  The callback function by remove arrangement code. Check correct
		 *  removing arrangement code.
		 *  
		 *  @param e:BaseEvent - not used.
		 */
		private function removeArrangementCodeCallback(e:BaseEvent):void
		{
			// check add new arrangemet code in list
			var len:int = model.transactionModule.arrangementCodesList.length;
			assertTrue("Check changes of count of arrangemgent codes: ", len == (indexCode - 1));
			
			addCallBack(ItemsDelegate.GET_ARRANGEMENTS_LIST, checkAfterRemoveCallback);
			var event:GetArrangementsEvent = new GetArrangementsEvent(ItemsDelegate.GET_ARRANGEMENTS_LIST);
			event.dispatch();
		}
		/**
		 *  The callback function for complete test by arrangements.
		 *  
		 *  @param e:BaseEvent - not used.
		 */
		private function checkAfterRemoveCallback(e:BaseEvent):void
		{
			// check add new arrangemet code in list
			var len:int = model.transactionModule.arrangementCodesList.length;
			assertTrue("Check changes of count of arrangemgent codes: ", len == (indexCode - 1));
		}
		
		// --------------------------------------------------------------- //
		//                    ITEMS GROUPS CODE UNIT TEST                  //
		// --------------------------------------------------------------- //
		/**
		 *  Start test of use items groups and applying them to hotel.
		 */
		public function testItemsGroups():void
		{
			// simple get arrangements list
			addCallBack(ItemsDelegate.GET_SYSTEM_GROUPS, getSystemGroups);
			var event:GetSystemGroupsListEvent = new GetSystemGroupsListEvent(ItemsDelegate.GET_SYSTEM_GROUPS);
			event.dispatch();
		}
		/**
		 *  The callback function for complete test by system groups.
		 *  
		 *  @param e:BaseEvent - not used.
		 */
		private function getSystemGroups(e:BaseEvent):void
		{
			// complete for get system groups list
			assertTrue(true);
			// update data for tests
			indexItem = model.transactionModule.systemGroupsList.length;
			
			// try add test system group
			addCallBack(ItemsDelegate.SAVE_SYSTEM_GROUP, addSystemGroupItemCallback);
			var event:SaveSystemGroupEvent = new SaveSystemGroupEvent(ItemsDelegate.SAVE_SYSTEM_GROUP);
			event.group = modelTest.testTransactionsData.item;
			event.dispatch();
		}
		/**
		 *  The callback function by save new system group. Check properties
		 *  after save for correct values.
		 *  Try edit saved system item for make test for it.
		 *  
		 *  @param e:BaseEvent - not used.
		 */
		private function addSystemGroupItemCallback(e:BaseEvent):void
		{
			// update saved system group
			var testItemData:ItemsGroupVO = modelTest.testTransactionsData.item;
			var systemItemsList:ArrayCollection = model.transactionModule.systemGroupsList;
			var item:ItemsGroupVO = systemItemsList.getItemAt(indexItem) as ItemsGroupVO;
			// store for checking added item
			newGroup = item;
			// check add new system group in list
			var len:int = systemItemsList.length;
			assertTrue("Check changes of count of system items: ", len == (indexItem + 1));
			// check properties for saved system group
			assertTrue("ItemsGroup->lId      : ", newGroup.lId != 0);
			assertTrue("ItemsGroup->bIsGroup : ", newGroup.bIsGroup == true);
			assertTrue("ItemsGroup->sName    : ", newGroup.sName == testItemData.sName);
			
			// make changes into system group
			item.sName = modelTest.testTransactionsData.itemEditName;
			// try edit test system group
			addCallBack(ItemsDelegate.SAVE_SYSTEM_GROUP, editSystemGroupItemCallback);
			var event:SaveSystemGroupEvent = new SaveSystemGroupEvent(ItemsDelegate.SAVE_SYSTEM_GROUP);
			event.group = item;
			event.dispatch();
		}
		/**
		 *  The callback function by edit system item in group. Check properties
		 *  after save for correct values.
		 *  Try add subgroup into edited item for make test for it.
		 *  
		 *  @param e:BaseEvent - not used.
		 */
		private function editSystemGroupItemCallback(e:BaseEvent):void
		{
			// update saved system group
			var systemItemsList:ArrayCollection = model.transactionModule.systemGroupsList;
			var item:ItemsGroupVO = systemItemsList.getItemAt(indexItem) as ItemsGroupVO;
			// check properties for saved system group
			assertTrue("ItemsGroup->lId      : ", item.lId != newGroup.lId);
			assertTrue("ItemsGroup->bIsGroup : ", item.bIsGroup == true);
			assertTrue("ItemsGroup->sName    : ", item.sName == modelTest.testTransactionsData.itemEditName);
			// update local copy of group
			newGroup = item.clone() as ItemsGroupVO;
			// 
			indexSubItem = newGroup.aSubGroups.length;
			// try add test sub group into main group
			addCallBack(ItemsDelegate.SAVE_SYSTEM_SUB_GROUP, addSystemSubGroupItemCallback);
			var event:SaveSystemSubGroupEvent = new SaveSystemSubGroupEvent(ItemsDelegate.SAVE_SYSTEM_SUB_GROUP);
			event.groupId = item.lId;
			event.subGroups = modelTest.testTransactionsData.subitem
			event.dispatch();
		}
		/**
		 *  The callback function by save new system subgroup. Check properties
		 *  after save for correct values.
		 *  Try edit saved system subitem for make test for it.
		 *  
		 *  @param e:BaseEvent - not used.
		 */
		private function addSystemSubGroupItemCallback(e:BaseEvent):void
		{
			// update saved system subgroup
			var testItemData:ItemsGroupVO = modelTest.testTransactionsData.subitem;
			var item:ItemsGroupVO = newGroup.aSubGroups[indexSubItem] as ItemsGroupVO;
			// store for checking added item
			newSubGroup = item.clone() as ItemsGroupVO;
			// check add new system subgroup in list
			var len:int = newSubGroup.aSubGroups.length;
			assertTrue("Check count of sub items :", newGroup.aSubGroups.length > 0);
			assertTrue("Check changes of count of sub items in item : ", len == (indexSubItem + 1));
			// check properties for saved system subgroup
			assertTrue("ItemsSubGroup->lId      : ", newSubGroup.lId != 0);
			assertTrue("ItemsSubGroup->bIsGroup : ", newSubGroup.bIsGroup == false);
			assertTrue("ItemsSubGroup->sName    : ", newSubGroup.sName == testItemData.sName);
			
			// make changes into code
//			item.sName = modelTest.testTransactionsData.itemEditName;
			// try edit test arrangement code
//			addCallBack(ItemsDelegate.SAVE_SYSTEM_GROUP, editSystemGroupItemCallback);
//			var event:SaveSystemGroupEvent = new SaveSystemGroupEvent(ItemsDelegate.SAVE_SYSTEM_GROUP);
//			event.group = item;
//			event.dispatch();
		}
		
		
		
		
		
		private function addTestArrangements():void
		{
			
		}
		
		private function addArrangement(code:ArrangementCodeVO, callback:Function):void
		{
			var event:SaveArrangementsEvent = new SaveArrangementsEvent(ItemsDelegate.SAVE_ARRANGEMENTS);
			event.code = code;
			event.callBack = callback;
			event.dispatch();
		}
	}
}