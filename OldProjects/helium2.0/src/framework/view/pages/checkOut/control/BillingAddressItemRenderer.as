package framework.view.pages.checkOut.control
{
	import framework.model.AppModelLocator;
	import framework.view.pages.checkOut.data.AccountTreeItem;
	
	import mx.controls.advancedDataGridClasses.AdvancedDataGridItemRenderer;
	import mx.events.DragEvent;
	import mx.managers.DragManager;
	
	import services.events.checkOut.MoveToAccountEvent;
	import services.vo.checkOut.AccountVO;
	import services.vo.checkOut.itemRouting.ItemCheckOutVO;

	public class BillingAddressItemRenderer extends AdvancedDataGridItemRenderer
	{
		public function BillingAddressItemRenderer()
		{
			super();
			addEventListener(DragEvent.DRAG_ENTER, onDragEnter);
			addEventListener(DragEvent.DRAG_OVER, onDragOver);
			addEventListener(DragEvent.DRAG_DROP, onDragDrop);
		}

		private function onDragEnter(event:DragEvent):void
		{
			var dropTarget:AdvancedDataGridItemRenderer = event.currentTarget as AdvancedDataGridItemRenderer;
			DragManager.acceptDragDrop(dropTarget);
		}
		
		private function onDragOver(event:DragEvent):void
		{
			// Explpicitly handle the dragOver event.            
            event.preventDefault();
			var dropTarget:AdvancedDataGridItemRenderer = event.currentTarget as AdvancedDataGridItemRenderer;
			if (event.dragSource.hasFormat("items"))
            {	     
            	if(dropTarget.data is AccountTreeItem)
            	{
            		// Drag not allowed.
            	}
            	else if(dropTarget.data is AccountVO)
            	{
            		if((dropTarget.data as AccountVO) == AppModelLocator.getInstance().checkOutModule.currentBillingAddress)
            		{
            			// Drag not allowed.
            		}
            		else
            		{	            		
						DragManager.showFeedback(DragManager.MOVE);
						return;            		
            		}
            	}  	
            }
            // Drag not allowed.
            DragManager.showFeedback(DragManager.NONE);           
		}	
		
        private function onDragDrop( event:DragEvent ):void
        {
        	var dropTarget:AdvancedDataGridItemRenderer = event.currentTarget as AdvancedDataGridItemRenderer;
        	var targetAccount:AccountVO = dropTarget.data as AccountVO;
           if( event.dragSource.hasFormat( "items" ) )
            {
                var sourceObject:Array = event.dragSource.dataForFormat( "items" ) as Array // ItemCheckOutVO;
                
                var e:MoveToAccountEvent = new MoveToAccountEvent();
                e.lAccountId = targetAccount.lId;                
                
                for each(var item:ItemCheckOutVO in sourceObject)
                {
                	if(item.bIsPayment)
                	{
                		e.aPaymentIdList.push(item.lId);
                	}
                	else
                	{
                		e.aTransactionIdList.push(item.lId);
                	}
                }
                e.dispatch();                
            }
        }		
		
			
			
			
        override public function set data(value:Object):void
        {
            if(value != null)
            { 
                super.data = value;
                if(value is AccountTreeItem)
                {
                	
                }
                else
                {
	                if((value as AccountVO).bIsPrimary)
	                {
	                    setStyle("color", 0x000000);
	                    setStyle("fontWeight", 'bold');
					}
					else if((value as AccountVO).bIsOpen)
					{
					    setStyle("color", 0x000000);
					    setStyle("fontWeight", 'normal');
					}
					else
					{
					    setStyle("color", 0x999999);
					    setStyle("fontWeight", 'normal');
					}
                }
            }
         }		
	}
}