package services.events.inHouse
{
	import services.cairngorm.BaseEvent;

	public class DeleteMessageEvent extends BaseEvent
	{
		// ----------------------------------------------------------- //
		//                          VARIABLES                          //
		// ----------------------------------------------------------- //
		/**
		 *  This property is id of message for person profile.
		 */
		private var _messageId:Number;
		
		// ----------------------------------------------------------- //
		//                    METHODS AND FUNCTIONS                    //
		// ----------------------------------------------------------- //
		/**
		 *  DeleteMessageEvent. Constructor.
		 *  
		 *  @param type:String is the type of the event, accessible
		 *         as Event.type.
		 */
		public function DeleteMessageEvent(type:String)
		{
			super(type);
		}
		
		// ----------------------------------------------------------- //
		//                      GETTER AND SETTER                      //
		// ----------------------------------------------------------- //
		/**
		 *  Id of person profile who received messages.
		 */
		public function get messageId():Number
		{
			return _messageId;
		}
		/**
		 *  @private
		 */
		public function set messageId(value:Number):void
		{
			_messageId = value;
		}
	}
}