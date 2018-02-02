package services.command.search
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.search.SearchDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.search.ExecuteSearchEvent;
	import services.vo.checkOut.GridComponentVO;
	
	import mx.collections.ArrayCollection;

	/**
	* The ExecuteSearchCommand class is
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/
	public class ExecuteSearchCommand extends BaseCommand
	{

		override public function execute(event:CairngormEvent):void
		{
			_event = event as ExecuteSearchEvent;
			var delegate:SearchDelegate = new SearchDelegate( this );
			delegate.executeSearch(event as ExecuteSearchEvent);
			super.execute(event);
		}

		override public function result(data:Object):void
		{
			var context:GridComponentVO = data as GridComponentVO;
			
			if(model.reservationEditModule.reservationSearchMode == 1)
			{
				model.reservationEditModule.groupReservationsCount = context.iTotalPage;
				model.reservationEditModule.groupReservationList = new ArrayCollection(context.oGridData);//ReservationViewVO
			}
			else
			{
				model.reservationEditModule.individualReservationsCount = context.iTotalPage;
				model.reservationEditModule.individualReservationList = new ArrayCollection(context.oGridData);//GroupReservationViewVO
			}			
			
			super.result(data);
		}

	}
}