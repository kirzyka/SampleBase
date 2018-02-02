package framework.module
{
	import mx.collections.ArrayCollection;
	import services.vo.common.DataListVO;
	
	[Bindable]
	public class TransactionModule implements IModule
	{
		public static const GROUPS_MANAGMENT:int = 0;
		public static const TRANSACTIONS_MANAGMENT:int = 1;
		public static const ARRANGEMENTS_MANAGMENT:int = 2;
		/**
		 *  This property is type of module.
		 *  
		 *  @default -1
		 */
		private var _type:int = -1;
		
		 
		/**
		 *  Array of VatPeriodVO
		 */ 
		public var vatPeriods:ArrayCollection = new ArrayCollection(); 
				
		
		/**
		 *  This property is index of current viewed page in Items
		 *  Groups module.
		 *  
		 *  @default 0
		 */ 
		private var _currPage:int = 0;
		/**
		 *  This property is all name of pages are existing in Items
		 *  Groups module.
		 *  
		 *  @default []
		 */
		private var _pageNames:/* String */Array = [];
		
		// ----------------------------------------------------------------------- //
		//                           GROUPS MANAGMENT                              //
		// ----------------------------------------------------------------------- //
		/**
		 *  This property contains data provider for receiving data
		 *  from server for system items groups.
		 */
		public var systemGroupsList:ArrayCollection = new ArrayCollection();
		/**
		 *  This property contains data provider for receiving data
		 *  from server for hotel items groups.
		 */
		public var hotelGroupsList:ArrayCollection = new ArrayCollection();
		
		// ----------------------------------------------------------------------- //
		//                        TRANSACTION MANAGMENT                            //
		// ----------------------------------------------------------------------- //
		/**
		 *  This property contain count of transaction by active sub group.
		 *  
		 *  @deault 0
		 */
		public var transactionCount:int = 0;
		/**
		 *  This property contains block with transaction by index of current
		 *  selected page for transaction into the system.
		 *  
		 *  @default new ArrayCollection()
		 *  
		 *  @see services.vo.backend.HotelItemVO
		 */
		public var transactionList:/* HotelItemVO */ArrayCollection =  new ArrayCollection();
		/**
		 *  This property contain allowed hotels by logined user.
		 *  
		 *  @default new ArrayCollection()
		 *  
		 *  @see services.vo.backend.HotelInfoTotalVO
		 */
		public var allowedHotels:/* HotelInfoTotalVO */ArrayCollection = new ArrayCollection();
		
		/**
		 *  This property contain transaction type.
		 *  
		 *  @default new ArrayCollection()
		 *  
		 *  @see services.vo.items.ItemTypesVO
		 */
		public var itemTypes:/*DataListVO*/ArrayCollection = new ArrayCollection();
		
		// ----------------------------------------------------------------------- //
		//                      ARRANGEMENT CODES MANAGMENT                        //
		// ----------------------------------------------------------------------- //
		/**
		 *  This property contains data provider for receiving data
		 *  from server for arragement codes.
		 */
		public var arrangementCodesList:ArrayCollection = new ArrayCollection();
		
		// ----------------------------------------------------------------------- //
		//                             COMMON METHODS                              //
		// ----------------------------------------------------------------------- //
		/**
		 *  TransactionModule. Constructor.
		 */
		public function TransactionModule()
		{
		}
		
		/**
		 *  Clear neccessary data.
		 */
		public function clear():void
		{
			currPage = GROUPS_MANAGMENT;
			// clear groups
			systemGroupsList.removeAll();
			hotelGroupsList.removeAll();
			// clear transacations
			transactionCount = 0;
			transactionList.removeAll();
			allowedHotels.removeAll();
			// clear arrangements code
			arrangementCodesList.removeAll();
		}
		// ----------------------------------------------------------------------- //
		//                           INTERFACE METHODS                             //
		// ----------------------------------------------------------------------- //
		/**
		 *  Index of current viewed page.
		 */
		public function get currPage():int
		{
			return _currPage;
		}
		/**
		 *  @private
		 */
		public function set currPage(value:int):void
		{
			_currPage = value;
		}
		
		/**
		 *  Name of pages are existing in Items Groups module.
		 */
		public function get pageNames():Array
		{
			return _pageNames;
		}
		/**
		 *  @private
		 */
		public function set pageNames(value:Array):void
		{
			_pageNames = value;
		}
		
		/**
		 * utils method 
		 */
		 
		 public function getItemTypeById(id:int):DataListVO
		 {
		 	if(itemTypes.length != 0)
		 	{
		 		for(var i:int = 0; i < itemTypes.length; i++)
		 		{
		 			if((itemTypes.getItemAt(i) as DataListVO).iId == id)
		 			{
		 				return (itemTypes.getItemAt(i) as DataListVO);
		 			}	
		 		}
		 	}
		 	return null;
		 }
		  
	}
}