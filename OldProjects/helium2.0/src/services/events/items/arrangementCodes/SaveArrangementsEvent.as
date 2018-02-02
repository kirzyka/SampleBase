package services.events.items.arrangementCodes
{
	import services.cairngorm.BaseEvent;
	import services.vo.items.ArrangementCodeVO;
	
	public class SaveArrangementsEvent extends BaseEvent
	{
		// ----------------------------------------------------------- //
		//                          VARIABLES                          //
		// ----------------------------------------------------------- //
		/**
		 *  This property contain saving item as ArrangmentCodeVO.
		 *  
		 *  @default new ArrangmentCodeVO()
		 *  
		 *  @see services.vo.backend.ArrangmentCodeVO
		 */
		private var _code:ArrangementCodeVO = new ArrangementCodeVO();
		
		// ----------------------------------------------------------- //
		//                    METHODS AND FUNCTIONS                    //
		// ----------------------------------------------------------- //
		/**
		 *  DeleteArrangementEvent. Constructor.
		 *  
		 *  @param type:String is the type of the event, accessible
		 *         as Event.type.
		 */
		public function SaveArrangementsEvent(type:String)
		{
			super(type);
		}
		
		// ----------------------------------------------------------- //
		//                      GETTER AND SETTER                      //
		// ----------------------------------------------------------- //
		/**
		 *  Item for save as ArrangmentCodeVO to arrangement codes list.
		 */
		public function get code():ArrangementCodeVO
		{
			return _code;
		}
		/**
		 *  @private
		 */
		public function set code(value:ArrangementCodeVO):void
		{
			_code = value;
		}
	}
}