package services.command.BDC
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.BDC.BDCDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.BDC.GetAnnomalyPersonEvent;
	
	import mx.collections.ArrayCollection;

	public class GetAnnomalyPersonCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = GetAnnomalyPersonEvent(event);
			var delegate:BDCDelegate= new BDCDelegate(this);
			delegate.getAnnomalyPerson(_event as GetAnnomalyPersonEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			var persons:ArrayCollection = data as ArrayCollection;
			persons = new ArrayCollection(data as Array);
			model.BDCModule.listPerson = new ArrayCollection(data as Array);
			super.result(data);
		}
	}
}