package services.events.items.management
{
	import services.events.PageBaseEvent;

	public class GetSystemTransactionsEvent extends PageBaseEvent
	{
		// ----------------------------------------------------------- //
		//                          VARIABLES                          //
		// ----------------------------------------------------------- //
		/**
		 *  This property contain id of group, for which get block of
		 *  transaction.
		 */
		private var _sysGroupId:Number;
		
		// ----------------------------------------------------------- //
		//                    METHODS AND FUNCTIONS                    //
		// ----------------------------------------------------------- //
		/**
		 *  GetSystemTransactionsEvent. Constructor.
		 *  
		 *  @param type:String is the type of the event, accessible
		 *         as Event.type.
		 */
		public function GetSystemTransactionsEvent(type:String)
		{
			super(type);
		}
		
		// ----------------------------------------------------------- //
		//                      GETTER AND SETTER                      //
		// ----------------------------------------------------------- //
		/**
		 *  Id of group, for which get block of transaction.
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