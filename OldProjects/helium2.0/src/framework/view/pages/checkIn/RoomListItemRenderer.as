package framework.view.pages.checkIn
{
	import framework.model.AppModelLocator;
	
	import mx.controls.advancedDataGridClasses.AdvancedDataGridItemRenderer;

	public class RoomListItemRenderer extends AdvancedDataGridItemRenderer 
	{
		private const SELECTED_ROW_COLOR:uint = 16777215;//0x00CC00;
		private const NON_SELECTED_ROW_COLOR:uint = 16777215;
		
		private var model:AppModelLocator = AppModelLocator.getInstance();
		
		public function RoomListItemRenderer()
		{
			super();			
			//background = true;
		}
		
		override public function set data(value:Object):void
		{
			super.data = value;
		}
		
		override public function validateProperties():void
		{
			super.validateProperties();
		 	if(listData == null) return;		 	
		 	var currColor:uint = NON_SELECTED_ROW_COLOR;
		 	
		 	if(data.isAssigned)
		 	{
		 		var assignedPersons:Array = data.assignedPersons;
		 		//assignedPersons	Array (@1b43e431)	

		 		for(var i:int = 0;i<assignedPersons.length;i++)
		 			if(assignedPersons[i] == model.checkInModule.currentProfileId)
		 			{
		 				currColor = SELECTED_ROW_COLOR;
		 				model.checkInModule.currentCheckInProfileId = assignedPersons[i];
		 				break;
		 			}
		 	} 
		 	
			backgroundColor = currColor;
		}
		
	}
}