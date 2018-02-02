package services.command.backend
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.backend.AddHotelMainGroupDelegate;
	import services.events.backend.AddHotelMainGroupsEvent;
	import framework.model.AppModelLocator;
	import services.vo.items.ItemsGroupVO;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;

	public class AddHotelMainGroupCommand implements ICommand, IResponder
	{
		/**
		 *  This property contains the model with all data.
		 *  
		 *  @see framework.model.RModel
		 */
		private var model:AppModelLocator = AppModelLocator.getInstance();
		/**
		 *  This property contains the event to make the request to add
		 *  new hotel main groups.
		 *  
		 *  @see services.events.backend.AddHotelMainGroupsEvent
		 */
		private var evt:AddHotelMainGroupsEvent;
		/**
		 *  Interface method. 
		 *  <p>Execute for forwarding the event to the method
		 *  <code>addHotelMainGroups()</code>.
		 * 
		 *  @see com.adobe.cairngorm.commands.ICommand
		 *  @see services.events.backend.AddHotelMainGroupsEvent
		 *  @see services.business.backend.AddHotelMainGroupDelegate
		 *  
		 *  @see services.business.backend.AddHotelMainGroupDelegate.addHotelMainGroups
		 */
		public function execute(event:CairngormEvent):void
		{
			evt = AddHotelMainGroupsEvent(event);
			var delegate:AddHotelMainGroupDelegate = new AddHotelMainGroupDelegate(this);
			
			delegate.addHotelMainGroups(evt);
		}
		/**
		 *  The handler for result of execution of request for
		 *  <code>addHotelMainGroups()</code>.
		 *  <p>This handler can get result for 2 modes:
		 *     <ul>
		 *     <li>add mode - for adding new main group;</li>
		 *     <li>edit mode - for editing selected main group.</li>
		 *     </ul>
		 *  
		 *  @see services.business.backend.AddHotelMainGroupDelegate.addHotelMainGroups
		 */
		public function result(data:Object):void
		{
			var items:Array = data as Array;
			var provider:ArrayCollection = model.itemsModule.hotelItemsGroupProvider;
			for(var i:int = 0; i < items.length; i++)
			{
				if (evt.groupIndex + i != provider.length)
				{
					// edit mode
					provider.removeItemAt(evt.groupIndex + i);
					provider.addItemAt(items[i] as ItemsGroupVO, evt.groupIndex + i);
				}
				else
				{
					// add mode
					provider.addItemAt(items[i] as ItemsGroupVO, evt.groupIndex + i);
				}
			}
			
			if (evt.callBack != null)
				evt.callBack();
			
			model.appEnabled--;
		}
		/**
		 *  The handler for faulting execution of request for
		 *  <code>addHotelMainGroups()</code>.
		 *  
		 *  @see services.business.backend.AddHotelMainGroupDelegate.addHotelMainGroups*/
		public function fault(info:Object):void
		{
			model.appEnabled--;
			
			Alert.show("Hotel main group could not be added");
		}
	}
}