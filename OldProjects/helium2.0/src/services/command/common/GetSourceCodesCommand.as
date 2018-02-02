package services.command.common
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.common.GetSourceCodesDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.common.GetSourceCodesEvent;
	import services.vo.GlobalStorage;
	
	import mx.collections.ArrayCollection;

	public class GetSourceCodesCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = GetSourceCodesEvent(event);
			var delegate:GetSourceCodesDelegate = new GetSourceCodesDelegate(this);
			delegate.getSourceCode(_event as GetSourceCodesEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			GlobalStorage.sourceCodes = new ArrayCollection(data as Array);
			
			super.result(data);
		}
	}
}