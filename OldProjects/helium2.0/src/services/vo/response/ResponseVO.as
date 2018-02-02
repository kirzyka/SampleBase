package services.vo.response
{
	[Bindable]
	[RemoteClass(alias="MapResponse")]
	public class ResponseVO
	{
		public static const RESPONSE_STATUS_OK:int = 1;
		public static const RESPONSE_NOTIFIER:int = 2;
		public static const RESPONSE_ERROR:int = 3;
		public static const RESPONSE_SESSION_EXPIRED:int = 4;
		public static const RESPONSE_PERMISSION_DENIED:int = 5;
		/**
		 *  This property contain object with data from server (Map).
		 */
		public var oResponse:Object;
		/**
		 *  This property contain response status:
		 *   <ul>
		 *     <li>1 - Ok and client return to next screen;</li>
		 *     <li>2 - Info message for user. For example - "Don't 
		 *         possible delete room";</li>
		 *     <li>3..n - Other message. For example - "System error".</li>
		 *   </ul>
		 */
		 public var iStatus:int;
		/**
		 *  This property contain message for user.
		 *  
		 *  @default []
		 */
		public var aMessageStack:Array = [];
		/**
		 *  This property contain additional object. For example - stack trace
		 *  for send to support.
		 *  
		 *  @see framework.vo.frontend.StackTraceVO
		 */
		public var oStackTrace:Object;
		/**
		 *  This property contain array with debug strings.
		 *  
		 *  @default []
		 */
		public var aDebugInfo:Array = [];
		/**
		 *  This property contain production flag.
		 *  
		 *  @default false
		 */
		public var bIsProduction:Boolean = false;
	}
}