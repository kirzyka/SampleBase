package services.events
{
	public interface IBaseEvent
	{
		/**
		 *  This property call back function for executing some functions if
		 *  user get result's handler after call remote function from the server.
		 */
		function get callBack():Function;
		function set callBack(func:Function):void;
		/**
		 *  The data property can be used to hold information to be passed with
		 *  the event in cases where the developer does not want to extend the
		 *  CairngormEvent class.
		 */
		function get data():*;
		function set data(value:*):void;
	}
}