package services.command.items.arrangementCodes
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.collections.ArrayCollection;
	
	import services.business.items.ItemsDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.items.arrangementCodes.SaveArrangementsEvent;
	import services.vo.items.ArrangementCodeVO;

	public class SaveArrangmentsCommand extends BaseCommand
	{
		/**
		 *  @override 
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = SaveArrangementsEvent(event);
			var delegate:ItemsDelegate = new ItemsDelegate(this);
			
			delegate.saveArragements(_event as SaveArrangementsEvent);
			
			super.execute(event);
		}
		/**
		 *  @override 
		 */
		override public function result(data:Object):void
		{
			var item:ArrangementCodeVO = data as ArrangementCodeVO;
			var provider:ArrayCollection = model.transactionModule.arrangementCodesList;
			var isNew:Boolean = true;
			// try search equal item for edit mode
			for each(var code:ArrangementCodeVO in provider)
			{
				if (item.lId == code.lId)
				{
					var index:int = provider.getItemIndex(code);
					provider.setItemAt(item, index);
					isNew = false;
					break;
				}
			}
			// add mode
			if (true == isNew)
			{
				provider.addItem(item);
			}
			
			super.result(data);
		}
	}
}