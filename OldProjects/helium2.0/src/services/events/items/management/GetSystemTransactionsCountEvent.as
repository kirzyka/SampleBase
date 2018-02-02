package services.events.items.management
{
	import services.cairngorm.BaseEvent;

	public class GetSystemTransactionsCountEvent extends BaseEvent
	{
		// ----------------------------------------------------------- //
		//                          VARIABLES                          //
		// ----------------------------------------------------------- //
		/**
		 *  This property contain id of group, for which get count of
		 *  transaction.
		 */
		private var _sysGroupId:Number;
		
		// ----------------------------------------------------------- //
		//                    METHODS AND FUNCTIONS                    //
		// ----------------------------------------------------------- //
		/**
		 *  GetSystemTransactionsCountEvent. Constructor.
		 *  
		 *  @param type:String is the type of the event, accessible
		 *         as Event.type.
		 */
		public function GetSystemTransactionsCountEvent(type:String)
		{
			super(type);
		}
		
		// ----------------------------------------------------------- //
		//                      GETTER AND SETTER                      //
		// ----------------------------------------------------------- //
		/**
		 *  Id of group, for which get count of transaction.
		 */
		public function get sysGroupId():Number
		{
			return _sysGroupId;
		}
		/**
		 *  @private
		 */
		public function set sysGroupId(value:Number):void
		{
			_sysGroupId = value;
		}
	}
}