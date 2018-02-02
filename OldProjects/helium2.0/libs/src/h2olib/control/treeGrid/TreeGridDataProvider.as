package h2olib.control.treeGrid
{
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ICollectionView;
	import mx.collections.Sort;
	import mx.collections.SortField;
	
	import org.osflex.ITreeGridNode;
	
	public class TreeGridDataProvider extends EventDispatcher implements ITreeGridDataProvider
	{
		private var model: Object;
		
		public function TreeGridDataProvider(model: Object) 
		{
			this.model = model;
		}	
		
		private function insertAllChildNodes(element: ITreeGridNode, collection: ArrayCollection):void 
		{
			if (element.open) 
			{
				for each (var child: ITreeGridNode in element.children) 
				{
					collection.addItem(child);
					insertAllChildNodes(child, collection);
				}
			}
		}

		public function get dataProvider():Object
		{
			var collection: ArrayCollection = new ArrayCollection();
			if (model is ITreeGridNode) {
				collection.addItem(model as ITreeGridNode);
				insertAllChildNodes(model as ITreeGridNode, collection);
			} 
			else 
			{
				for each (var element: ITreeGridNode in ICollectionView(model)) 
				{
					collection.addItem(element);					
					insertAllChildNodes(element, collection);
				}
			}
			return collection;
		}

		private function sortAllChildNodes(element: ITreeGridNode, sort: Sort):void 
		{
			if (element.children != null) 
			{
				element.children.sort = sort;
				element.children.refresh();
				for each(var child: ITreeGridNode in element.children) 
				{
					sortAllChildNodes(child, sort);
				}
			}
		}

		private function sortCollection(collection: ICollectionView, sort: Sort):void 
		{
			collection.sort = sort;
			collection.refresh();
			for each(var element: ITreeGridNode in collection) 
			{
				sortAllChildNodes(element, sort);
			}
		}		

		public function sortByField(fieldName:String, sortDescending:Boolean):void
		{
			var sort: Sort = new Sort();
			var sortField: SortField = new SortField(fieldName);
			sortField.descending = sortDescending;
			sort.fields = [sortField];
			
			if (model is ITreeGridNode) {
				sortAllChildNodes(model as ITreeGridNode, sort);
			} else if (model is ICollectionView) {
				sortCollection(model as ICollectionView, sort);
			}

			var sortEvent: TreeGirdDataProviderEvent = new TreeGirdDataProviderEvent(TreeGirdDataProviderEvent.SORT);
			this.dispatchEvent(sortEvent);
		}
		
	}
}