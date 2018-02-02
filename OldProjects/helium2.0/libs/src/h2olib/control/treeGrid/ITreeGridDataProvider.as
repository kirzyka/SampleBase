package h2olib.control.treeGrid
{
	import flash.events.IEventDispatcher;
	
	public interface ITreeGridDataProvider extends IEventDispatcher
	{
		function get dataProvider(): Object;
		
		function sortByField(fieldName: String, sortDescending: Boolean):void;		
	}
}