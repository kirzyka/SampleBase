package framework.module
{
	import flash.events.IEventDispatcher;
	
	public interface IModule
	{
		/**
		 *  Getter and setter for index of current viewed page
		 *  in the module.
		 */
		function get currPage():int;
		function set currPage(value:int):void;
		/**
		 *  Getter and setter for name of pages are existing in
		 *  the module.
		 */
		function get pageNames():Array;
		function set pageNames(value:Array):void;
		/**
		 *  Clear neccessary data.
		 */
		function clear():void
	}
}