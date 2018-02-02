package services.command.profiles.company
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.profiles.ProfileDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.profiles.company.GetMarketGroupListEvent;
	import services.vo.GlobalStorage;
	
	import mx.collections.ArrayCollection;

	public class GetMarketGroupListCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = GetMarketGroupListEvent(event);
			var delegate:ProfileDelegate = new ProfileDelegate( this );
			delegate.getMarketGroupList(_event as GetMarketGroupListEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			GlobalStorage.marketCodeGroups = new ArrayCollection( data as Array );
			
			super.result(data);
		}
	}
}