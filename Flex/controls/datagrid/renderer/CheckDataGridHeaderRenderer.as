package com.controls.datagrid.renderer
{

	import com.controls.datagrid.CheckDataGrid;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	
	import mx.collections.HierarchicalCollectionView;
	import mx.collections.IViewCursor;
	import mx.controls.CheckBox;
	import mx.controls.listClasses.IDropInListItemRenderer;
	import mx.controls.listClasses.IListItemRenderer;
	import mx.core.mx_internal;

	use namespace mx_internal;

	public class CheckDataGridHeaderRenderer extends CheckBox implements IListItemRenderer, IDropInListItemRenderer
	{

		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------

		public function CheckDataGridHeaderRenderer()
		{
			addEventListener(Event.CHANGE, onChange);

			setStyle("paddingLeft", 2);
		}

		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------

		override public function set owner(value:DisplayObjectContainer):void
		{
			super.owner = value;
			var listOwner:CheckDataGrid = value as CheckDataGrid;
			listOwner.addEventListener("checkedAllItemsChanged", onCheckedAllItems);
		}

		private function onChange(event:Event):void
		{
			var listOwner:CheckDataGrid = owner as CheckDataGrid;

			if (selected)
			{
				listOwner.checkedItems.removeAll();
				if ((listOwner.dataProvider is HierarchicalCollectionView))
				{
					for each (var treeItem:Object in listOwner.dataProvider.treeData)
					{
						listOwner.checkedItems.addItem(treeItem);
					}					
				}
				else
				{
					for each (var item:Object in listOwner.dataProvider)
					{
						listOwner.checkedItems.addItem(item);
					}
				}
				listOwner.checkedAllItems = true;
			}
			else
			{
				listOwner.checkedItems.removeAll();
				listOwner.checkedNoneItems = true;
			}

			listOwner.dispatchEvent(new Event("checkItemsChange"));
		}

		private function onCheckedAllItems(event:Event):void
		{
			var listOwner:CheckDataGrid = owner as CheckDataGrid;
			selected = listOwner.checkedAllItems;
		}

	}

}
