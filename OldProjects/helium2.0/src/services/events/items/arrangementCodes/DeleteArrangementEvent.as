package services.events.items.arrangementCodes
{
	import services.cairngorm.BaseEvent;

	public class DeleteArrangementEvent extends BaseEvent
	{
		// ----------------------------------------------------------- //
		//                          VARIABLES                          //
		// ----------------------------------------------------------- //
		/**
		 *  This property contain id of code.
		 */
		private var _codeId:Number;
		/**
		 *  This property contain index of removing arrangement code in data
		 *  provider.
		 */
		private var _codeIndex:int;
		
		// ----------------------------------------------------------- //
		//                    METHODS AND FUNCTIONS                    //
		// ----------------------------------------------------------- //
		/**
		 *  DeleteArrangementEvent. Constructor.
		 *  
		 *  @param type:String is the type of the event, accessible
		 *         as Event.type.
		 */
		public function DeleteArrangementEvent(type:String)
		{
			super(type);
		}
		
		// ----------------------------------------------------------- //
		//                      GETTER AND SETTER                      //
		// ----------------------------------------------------------- //
		/**
		 *  Id of code
		 */
		public function get codeId():Number
		{
			return _codeId;
		}
		/**
		 *  @private
		 */
		public function set codeId(value:Number):void
		{
			_codeId = value;
		}
		
		/**
		 *  The index of removing arrangement code in data provider.
		 */
		public function get codeIndex():Number
		{
			return _codeIndex;
		}
		/**
		 *  @private
		 */
		public function set codeIndex(value:Number):void
		{
			_codeIndex = value;
		}
	}
}