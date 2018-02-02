package services.command.miscellaneous.countries
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import services.business.miscellaneous.countries.CountryDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.miscellaneous.countries.DeleteRegionEvent;
	import services.vo.GlobalStorage;
	import services.vo.common.RegionVO;

	public class DeleteRegionCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = DeleteRegionEvent( event );
			var delegate:CountryDelegate = new CountryDelegate( this );
			
			delegate.deleteRegion(_event as DeleteRegionEvent);
			super.execute(event);
		}
		
		override public function result(data:Object):void
		{
			var realIndex:int;
			
			for(var i:int=0; i < _storage.regions.length; i++)
				if((_storage.regions.getItemAt(i) as RegionVO).lId == (_event as DeleteRegionEvent).region.lId)
				{
					realIndex = i;
					break;
				}
			_storage.regions.removeItemAt(realIndex);
			super.result(data);
		}
	}
}