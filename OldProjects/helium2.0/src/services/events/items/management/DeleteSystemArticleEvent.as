package services.events.items.management
{
	import services.cairngorm.BaseEvent;

	public class DeleteSystemArticleEvent extends BaseEvent
	{
		// ----------------------------------------------------------- //
		//                          VARIABLES                          //
		// ----------------------------------------------------------- //
		/**
		 *  This property contain id of removing article.
		 */
		private var _articleId:Number;
		/**
		 *  This property contain index of transaction into list of transaction
		 *  who have saved article.
		 */
		private var _transactionIndex:int;
		/**
		 *  This property contain index of article into the list of articles for
		 *  transaction who have saved article.
		 */
		private var _articleIndex:int;
		
		// ----------------------------------------------------------- //
		//                    METHODS AND FUNCTIONS                    //
		// ----------------------------------------------------------- //
		/**
		 *  DeleteSystemArticleEvent. Constructor.
		 *  
		 *  @param type:String is the type of the event, accessible
		 *         as Event.type.
		 */
		public function DeleteSystemArticleEvent(type:String)
		{
			super(type);
		}
		
		// ----------------------------------------------------------- //
		//                      GETTER AND SETTER                      //
		// ----------------------------------------------------------- //
		/**
		 *  Id of removing article.
		 */
		public function get articleId():Number
		{
			return _articleId;
		}
		/**
		 *  @private
		 */
		public function set articleId(value:Number):void
		{
			_articleId = value;
		}
		
		/**
		 *  The index of transaction into list of transaction who have
		 *  saved article.
		 */
		public function get transactionIndex():int
		{
			return _transactionIndex;
		}
		/**
		 *  @private
		 */
		public function set transactionIndex(value:int):void
		{
			_transactionIndex = value;
		}
		
		/**
		 *  The index of article into the list of articles for transaction
		 *  who have saved article.
		 */
		public function get articleIndex():int
		{
			return _articleIndex;
		}
		/**
		 *  @private
		 */
		public function set articleIndex(value:int):void
		{
			_articleIndex = value;
		}
	}
}