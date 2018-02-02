package com.db.rds.content.ExceptionManagement.view.controls.renderers
{
	import com.db.rds.content.ExceptionManagement.view.controls.ThreeStateCheckBox;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.collections.HierarchicalData;
	import mx.controls.AdvancedDataGrid;
	import mx.controls.CheckBox;
	import mx.controls.DataGrid;
	import mx.controls.advancedDataGridClasses.AdvancedDataGridColumn;
	import mx.controls.listClasses.AdvancedListBase;
	import mx.controls.listClasses.ListBase;
	
	public class CheckBoxRenderer extends ThreeStateCheckBox
	{	
		public function CheckBoxRenderer()
		{
			super();
			addEventListener(MouseEvent.CLICK, onClick);
			setStyle("paddingLeft", 5);
	  	}
	  
	  	override public function set data(value:Object):void
	  	{
	   		super.data =  value;
			
			var item:Object;
			var allSelected:Boolean = true;
			var allNotSelected:Boolean = true;
		
	   		if(value != null && value.hasOwnProperty("selected"))
	   		{
				if(value.hasOwnProperty("children"))
				{
					for each(item in data.children)
					{
						if(item.hasOwnProperty("selected"))
						{
							if(item.selected)
							{
								allNotSelected = false;
							}
							else
							{
								allSelected = false;
							}
						}
					}
					
					if(allSelected)
					{
						middle = false;
						selected = true;
						value.selected = 1;
					}
					else if(allNotSelected)
					{
						middle = false;
						selected = false;
						value.selected = 0;
					}
					else
					{
						middle = true;
						selected = true;
						value.selected = -1;
					}	
					dispatchCustomEvent(new Event("calculateMainCheckBoxState"));
				}
				else
	    		{   
	    			selected = value.selected;
	    		}
	   		}   
	  	}
	  
	  	private function onClick(event:Event):void
	  	{			
			if(data.hasOwnProperty("children"))
			{
				middle = false;
				selected = !selected;
				for each(var item:Object in data.children)
				{
					if(item.hasOwnProperty("selected"))
					{
						item.selected = selected ? 0 : 1;
					}
				}				
			}	
			if(data.hasOwnProperty("selected"))
			{
	   			data.selected = selected ? 1 : 0;
			}
			
			dispatchCustomEvent(new Event("checkBoxClick"));
	  	}  
		
		private function dispatchCustomEvent(event:Event):void
		{
			if(this.owner is AdvancedDataGrid || this.owner is DataGrid)
			{
				this.owner.dispatchEvent(event);
			}
			else if(Object(this.owner).hasOwnProperty("owner"))
			{				
				Object(this.owner).owner.dispatchEvent(event);
			}
			else
			{
				throw new Error("Invalid CheckBoxItemRenderer owner!");
			}
		}
	 }
}