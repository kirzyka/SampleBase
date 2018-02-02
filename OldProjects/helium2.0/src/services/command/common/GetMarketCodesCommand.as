package services.command.common
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.common.GetMarketCodesDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.common.GetMarketCodesEvent;
	import services.vo.GlobalStorage;
	
	import mx.collections.ArrayCollection;

	public class GetMarketCodesCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = GetMarketCodesEvent(event);
			var delegate:GetMarketCodesDelegate = new GetMarketCodesDelegate( this );
			delegate.getMarketCodes(_event as GetMarketCodesEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			GlobalStorage.marketCodes = new ArrayCollection( data as Array );
			
			super.result(data);
		}
	}
}