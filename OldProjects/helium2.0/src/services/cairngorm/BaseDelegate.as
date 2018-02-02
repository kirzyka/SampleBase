package services.cairngorm
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	
	import framework.model.AppModelLocator;
	
	import h2olib.control.enum.MessageKind;
	import h2olib.control.enum.MessageShowType;
	
	import mx.rpc.AbstractOperation;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.mxml.Operation;
	import mx.rpc.remoting.mxml.RemoteObject;
	
	import services.events.MsgEvent;
	import services.vo.response.ResponseVO;
	
	/**
	 *  The base class for delegates, used in the system.
	 *
	 *  @author Artemyev Dmitriy
	 *  @date 03.06.2009
	 */
	public class BaseDelegate
	{
		public static var callBack:Function = null;
		// ===================================================================== //
		//                         VARIABLES AND CONSTANTS                       //
		// ===================================================================== //
		/**
		 *  This property contain interface variable, which provides the
		 *  contract for any service that needs to respond to remote or
		 *  asynchronous calls.
		 */
		protected var responder:IResponder;
		/**
		 *  This property contain instance of the <code>ServiceLocator</code>,
		 *  allowed service to be located and security credentials to be
		 *  managed. Although credentials are set against a service they apply
		 *  to the channel i.e. the set of services belonging to the channel
		 *  share the same credentials. You must always make sure you call
		 *  logout at the end of the user's session.
		 *
		 *  @see com.adobe.cairngorm.business.ServiceLocator
		 */
		protected var service:ServiceLocator = ServiceLocator.getInstance();
		/**
		 *  This property contain operation for cremote calls.
		 */
		private  var _operation:AbstractOperation;
		/**
		 *  This property contain the model with all data.
		 *
		 *  @see framework.model.AppModelLocator
		 */
		protected var model:AppModelLocator = AppModelLocator.getInstance();
		
		// ===================================================================== //
		//                      COMMON METHODS AND HANDLERS                      //
		// ===================================================================== //
		/**
		 *  BaseDelegate. Constructor.
		 *
		 *  @param responder:IResponder - contact provider for any service
		 */
		public function BaseDelegate(responder:IResponder)
		{
			this.responder = responder;
		}
		/**
		 *  The result handle.
		 *  <p>Check status of response:
		 *    <ul>
		 *      <li><code>RESPOSE_STATUS_OK</code>;</li>
		 *      <li><code>RESPOSE_NOTIFIER</code>;</li>
		 *      <li><code>RESPOSE_ERROR</code>;</li>
		 *      <li><code>RESPONSE_SESSION_EXPIRED</code>;</li>
		 *      etc.
		 *    </ul>
		 *
		 *  @see services.vo.frontend.ResponseVO
		 *
		 *  @param evt:ResultEvent
		 */
		protected function handleResult(evt:ResultEvent):void
		{
			// TODO : debug info (note: don't forget to remove this block)
			var currentDate:Date = new Date();
			trace("[" + currentDate.toTimeString() + "] " +((evt.target as Operation).service as RemoteObject).source + " <- " +  (evt.target as Operation).name);
			trace("count of remote calls = " + model.appEnabled);
			
			if (model.isLogOut) return;
			
			var response:ResponseVO = evt.result as ResponseVO;
			model.lastResponse = response;
			var msgEvent:MsgEvent;
			// check status by remote call
			switch (response.iStatus)
			{
				// remote call is right
				case ResponseVO.RESPONSE_STATUS_OK:
					if (response.aMessageStack.length > 0)
					{
						new MsgEvent(MessageKind.WARNING,
									"Notification",
									response.aMessageStack.toString(),
									MessageShowType.UNKNOWN,
									handleMessageOk).dispatch();
					}
					
					this.responder.result(response.oResponse);
					//model.appEnabled--;
					break;
				// remote call sent user notification
				case ResponseVO.RESPONSE_NOTIFIER:
					new MsgEvent(MessageKind.WARNING,
								"Warning",
								response.aMessageStack.toString(),
								MessageShowType.UNKNOWN).dispatch();
					// update fault state
					this.responder.fault({});
					break;
				// remote call sent system error
				case ResponseVO.RESPONSE_ERROR:
					new MsgEvent(MessageKind.ERROR,
								"Error",
								response.aMessageStack.toString(),
								MessageShowType.UNKNOWN).dispatch();
					// update fault state
					this.responder.fault({});
					break;
				case ResponseVO.RESPONSE_SESSION_EXPIRED:
					model.isLogOut = true;
					new MsgEvent(MessageKind.WARNING,
								"Warning",
								"Some user login by your login. Please try to login again",
								MessageShowType.POPUP,
								handleLogOut).dispatch();
					model.backendIndex = 0;
					// update fault state
					this.responder.fault({});
					break;
				case ResponseVO.RESPONSE_PERMISSION_DENIED:
					model.isLogOut = true;
					new MsgEvent(MessageKind.WARNING,
								"Warning",
								"Permission denied",
								MessageShowType.POPUP,
								handleLogOut).dispatch();
					// update fault state
					this.responder.fault({});
					break;
			}
			
			(evt.target as AbstractOperation).removeEventListener(ResultEvent.RESULT, handleResult);
		}
		
		/**
		 *  Confirmation handle for warning alert by responce message
		 */
		private function handleMessageOk():void
		{
			var event:CairngormEvent = new CairngormEvent("message_ok");
			CairngormEventDispatcher.getInstance().dispatchEvent(event);
		}
		/**
		 *  Confirmation handle for warning alert by responce status
		 *  <code>RESPOSE_NOTIFIER<code>
		 */
		private function handleOk():void
		{
			this.responder.fault({});
		}
		/**
		 *  Confirmation handle for warning alert by responce status
		 *  <code>RESPONSE_SESSION_EXPIRED<code>.
		 *  <p>If any user are logined by current login, logout current
		 *  user.
		 */
		private function handleLogOut():void
		{
			model.mainViewIndex = 0;
			
			model.isLogOut = false;
		}
		
		
		protected function get operation():AbstractOperation
		{
			return _operation;
		}
		/**
		 *  @private
		 */
		protected function set operation(value:AbstractOperation):void
		{
			_operation = value;
		}
	}
}