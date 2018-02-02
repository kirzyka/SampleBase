package com.controls.datagrid.renderer
{

	import com.controls.datagrid.CheckDataGrid;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	
	import mx.collections.HierarchicalCollectionView;
	import mx.controls.advancedDataGridClasses.AdvancedDataGridListData;
	import mx.controls.listClasses.BaseListData;
	import mx.controls.listClasses.IDropInListItemRenderer;
	import mx.controls.listClasses.IListItemRenderer;
	
	import spark.components.CheckBox;
	import spark.components.VGroup;
	import spark.layouts.HorizontalAlign;
	import spark.layouts.VerticalAlign;

	public class CheckDataGridItemRenderer extends VGroup implements IListItemRenderer, IDropInListItemRenderer
	{

		private var checkBox:CheckBox;
		private var _listData:AdvancedDataGridListData;

		public function CheckDataGridItemRenderer()
		{
			super();
			percentWidth = 100;
			percentHeight = 100;

			verticalAlign = VerticalAlign.MIDDLE;
			horizontalAlign = HorizontalAlign.CENTER;

			checkBox = new CheckBox();
			addElement(checkBox);
			checkBox.addEventListener(Event.CHANGE, onChange);
		}


		//----------------------------------
		//  owner
		//----------------------------------

		override public function set owner(value:DisplayObjectContainer):void
		{
			super.owner = value;
			var listOwner:CheckDataGrid = value as CheckDataGrid;
			listOwner.addEventListener("checkedAllItemsChanged", onCheckedAllItems);
			listOwner.addEventListener("checkedNoneItemsChanged", onCheckedNoneItems);
		}

		protected override function commitProperties():void
		{
			super.commitProperties();

			toolTip = null;
		}

		private function get isCheckboxRequired():Boolean
		{
			var result:Boolean;

			if (_listData && (owner as CheckDataGrid).isHierarchicalData)
			{
				var collection:HierarchicalCollectionView = (owner as CheckDataGrid).dataProvider as HierarchicalCollectionView;

				if (collection)
				{
					var parentPropertyName:String = (owner as CheckDataGrid).parentPropertyName;
					var parentObject:Object = collection.getParentItem(_listData.item);
						
				}
				result = (parentObject == null && !(_listData.item.hasOwnProperty(parentPropertyName)
					&& _listData.item[parentPropertyName]));
			}
			else
			{
				result = (_listData != null);
			}

			return result;
		}


		private function onChange(event:Event):void
		{
			var listOwner:CheckDataGrid = owner as CheckDataGrid;

			var i:int = listOwner.checkedItems.getItemIndex(_listData.item);

			if (checkBox.selected)
			{
				if (i == -1)
				{
					if (listOwner.dataProvider is HierarchicalCollectionView)
					{
						var parentObject:Object = listOwner.dataProvider.getParentItem(_listData.item);
						if (!parentObject)
						{
							listOwner.checkedItems.addItem(_listData.item);
							listOwner.checkedNoneItems = false;
							if (listOwner.checkedItems.length == listOwner.dataProviderLength)
							{
								listOwner.checkedAllItems = true;
							}
						}
					}
					else
					{
						listOwner.checkedItems.addItem(_listData.item);
						listOwner.checkedNoneItems = false;
						if (listOwner.checkedItems.length == listOwner.dataProviderLength)
						{
							listOwner.checkedAllItems = true;
						}
					}

				}
			}
			else
			{
				if (i != -1)
				{
					listOwner.checkedItems.removeItemAt(i);
					listOwner.checkedAllItems = false;
					if (!listOwner.checkedItems.length)
					{
						listOwner.checkedNoneItems = true;
					}
				}
			}

			listOwner.dispatchEvent(new Event("checkItemsChange"));
		}		

		private function onCheckedAllItems(event:Event):void
		{
			var listOwner:CheckDataGrid = owner as CheckDataGrid;
			if (listOwner.checkedAllItems)
			{
				checkBox.selected = true;
			}
		}

		private function onCheckedNoneItems(event:Event):void
		{
			var listOwner:CheckDataGrid = owner as CheckDataGrid;
			if (listOwner.checkedNoneItems)
			{
				checkBox.selected = false;
			}
		}


		public function get listData():BaseListData
		{
			return _listData;
		}

		/**
		 *  @private
		 */
		public function set listData(value:BaseListData):void
		{
			_listData = value as AdvancedDataGridListData;

			if (_listData)
			{
				var listOwner:CheckDataGrid = owner as CheckDataGrid;
				checkBox.selected = listOwner.checkedItems.getItemIndex(_listData.item) != -1;
				checkBox.visible = isCheckboxRequired;
			}
		}

		private var _data:Object;

		public function get data():Object
		{
			return _data;
		}

		/**
		 *  @private
		 */
		public function set data(value:Object):void
		{
			_data = value;
		}


	}

}
