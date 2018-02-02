package com.controls.datagrid
{

	import flash.events.Event;
	import flash.events.MouseEvent;

	import mx.collections.ArrayCollection;
	import mx.collections.HierarchicalCollectionView;
	import mx.collections.IList;
	import mx.controls.AdvancedDataGrid;
	import mx.core.mx_internal;
	import mx.events.CollectionEvent;
	import mx.events.CollectionEventKind;

	use namespace mx_internal;

	[Event(name = "checkItemsChange", type = "flash.events.Event")]

	/**
	 * 
	 * @author akharlamov
	 */
	/**
	 * 
	 * @author akharlamov
	 */
	public class CheckDataGrid extends AdvancedDataGrid
	{

		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------

		private var _isHierarchicalData:Boolean = false;
		private var _parentPropertyName:String;

		public function set isHierarchicalData(value:Boolean):void
		{
			_isHierarchicalData = value;
		}

		public function get isHierarchicalData():Boolean
		{
			return _isHierarchicalData;
		}

		
		/**
		 * length of the dataProvider
		 * @return 
		 */
		public function get dataProviderLength():int
		{
			if (dataProvider is HierarchicalCollectionView)
			{
				return dataProvider.treeData.length;
			}
			else
			{
				return dataProvider.length;
			}
		}

		//----------------------------------
		//  checkedItems
		//----------------------------------

		[Bindable]
		public function get checkedItems():ArrayCollection
		{
			return _checkedItems;
		}

		public function set checkedItems(value:ArrayCollection):void
		{
			if (_checkedItems != value)
			{
				_checkedItems = value;
				if (value)
				{
					value.addEventListener(CollectionEvent.COLLECTION_CHANGE, onCheckedChanged);
				}
			}
		}

		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------

		protected function onCheckedChanged(event:Event):void
		{
			if (!checkedItems.length)
			{
				checkedNoneItems = true;
			}
			else if (checkedItems.length == dataProviderLength)
			{
				checkedAllItems = true;
			}
		}

		protected override function collectionChangeHandler(event:Event):void
		{
			super.collectionChangeHandler(event);

			//init ArrayCollection at collection RESET
			if ((event as CollectionEvent).kind == CollectionEventKind.RESET)
			{
				checkedItems = new ArrayCollection();
				checkedNoneItems = true;
			}
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------

		private var _checkedItems:ArrayCollection = new ArrayCollection();

		private var _checkedAllItems:Boolean = false;

		[Bindable(name = "checkedAllItemsChanged")]
		public function get checkedAllItems():Boolean
		{
			return _checkedAllItems;
		}

		public function set checkedAllItems(value:Boolean):void
		{
			if (_checkedAllItems != value)
			{
				_checkedAllItems = value;
				if (value)
					checkedNoneItems = false;
				dispatchEvent(new Event("checkedAllItemsChanged"));
			}
		}

		private var _checkedNoneItems:Boolean = false;

		[Bindable(name = "checkedNoneItemsChanged")]
		public function get checkedNoneItems():Boolean
		{
			return _checkedNoneItems;
		}

		public function set checkedNoneItems(value:Boolean):void
		{
			if (_checkedNoneItems != value)
			{
				_checkedNoneItems = value;
				if (value)
					checkedAllItems = false;
				dispatchEvent(new Event("checkedNoneItemsChanged"));
			}
		}
		
		//For grids with hierarchical data providers
		public function get parentPropertyName():String
		{
			return _parentPropertyName;
		}
		
		public function set parentPropertyName(value:String):void
		{
			_parentPropertyName = value;
		}

	}

}
