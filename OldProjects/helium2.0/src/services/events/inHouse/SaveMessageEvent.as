package services.events.inHouse
{
	import services.cairngorm.BaseEvent;
	import services.vo.inHouse.PersonMessageVO; 

	public class SaveMessageEvent extends BaseEvent
	{
		// ----------------------------------------------------------- //
		//                          VARIABLES                          //
		// ----------------------------------------------------------- //
		/**
		 *  This property is send message.
		 *  
		 *  @see services.vo.inHouse.PersonMessageVO
		 */
		private var _message:PersonMessageVO;
		/**
		 *  This property is id of person profile who received messages.
		 */
		private var _profileId:Number;
		
		// ----------------------------------------------------------- //
		//                    METHODS AND FUNCTIONS                    //
		// ----------------------------------------------------------- //
		/**
		 *  SaveMessageEvent. Constructor.
		 *  
		 *  @param type:String is the type of the event, accessible
		 *         as Event.type.
		 */
		public function SaveMessageEvent(type:String)
		{
			super(type);
		}
		
		// ----------------------------------------------------------- //
		//                      GETTER AND SETTER                      //
		// ----------------------------------------------------------- //
		/**
		 *  Id of person profile who received messages.
		 */
		public function get profileId():Number
		{
			return _profileId;
		}
		/**
		 *  @private
		 */
		public function set profileId(value:Number):void
		{
			_profileId = value;
		}
		
		/**
		 *  Send message.
		 */
		public function get message():PersonMessageVO
		{
			return _message;
		}
		/**
		 *  @private
		 */
		public function set message(value:PersonMessageVO):void
		{
			_message = value;
		}
	}
}