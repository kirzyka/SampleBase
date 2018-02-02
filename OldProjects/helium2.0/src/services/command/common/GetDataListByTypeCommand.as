package services.command.common
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.common.GetDataListByTypeDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.common.GetDataListByTypeEvent;
	import services.vo.GlobalSettings;
	import services.vo.GlobalStorage;
	
	import mx.collections.ArrayCollection;

	/**
	* The GetDataListByTypeCommand class is 
	*
	* @author Viktor Potapov / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-10-05 11:28:29 +0300 (Mon, 05 Oct 2009) $
	*
	*/	
	public class GetDataListByTypeCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = GetDataListByTypeEvent(event);
			var delegate:GetDataListByTypeDelegate = new GetDataListByTypeDelegate( this );			
			delegate.getDataListByType(_event as GetDataListByTypeEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			if ((_event as GetDataListByTypeEvent).sDictionaryType == GlobalSettings.DATA_LIST_TYPE_HOTEL_ROOM_STATUS)
				GlobalStorage.housekeepingStatuses = new ArrayCollection(data as Array);
			//model.rhythmsList = new ArrayCollection(data as Array);			
			super.result(data);			
		}
		
		
	}
}