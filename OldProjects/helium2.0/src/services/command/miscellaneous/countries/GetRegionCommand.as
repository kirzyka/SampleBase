package services.command.miscellaneous.countries
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.miscellaneous.countries.CountryDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.miscellaneous.countries.GetRegionEvent;
	import framework.module.CommonModule;
	import services.vo.common.RegionVO;
	
	import mx.collections.ArrayCollection;
	/**
	 *  Command for get list of regions.
	 *  
	 *  @author Artemyev Dmitriy
	 *  @date 08.06.2009
	 */
	public class GetRegionCommand extends BaseCommand
	{
		
		override public function execute(event:CairngormEvent):void
		{
			_event = GetRegionEvent(event);
			var delegate:CountryDelegate = new CountryDelegate(this);
			delegate.getRegion(_event as GetRegionEvent);
			super.execute( event );
		}
		/**
		 *  The handler to get result of the execution by remote call for
		 *  <code>getRegions()</code>.
		 *  <p>This method is called by a service when the return value
		 *  has been received.</p>
		 *  <p><b>Note:</b>all received from server regions are cashed.</p>
		 *   
		 *  @param data:Object - result of the remote call.
		 */
		override public function result(data:Object):void
		{
			_storage.regions = new ArrayCollection(data as Array);
			/// all regions are cashed
			for each(var region:RegionVO in _storage.regions)
			{
				CommonModule.addRegion(region);
			}
			super.result( data );
		}
	}
}