package services.command.checkOut
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.checkOut.CheckOutDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.checkOut.GetGuestListEvent;
	import services.vo.checkOut.CheckOutGuestListVO;
	import services.vo.checkOut.GridComponentVO;
	
	import mx.collections.ArrayCollection;

	public class GetGuestListCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = GetGuestListEvent(event);
			var delegate:CheckOutDelegate = new CheckOutDelegate( this );
			delegate.getGuestList(_event as GetGuestListEvent );
			
			super.execute(event);
		}
		
		
		override public function result(data:Object):void
		{
			var t:CheckOutGuestListVO;
			var grid:GridComponentVO = data as GridComponentVO;
			var items:ArrayCollection = new ArrayCollection(grid.oGridData as Array);
			model.checkOutModule.guestList.removeAll();
			model.checkOutModule.needGuestListUpdate = false;			
			model.checkOutModule.totalPage = data.iTotalPage;
			for(var i:int = 0; i < items.length; i++)
			{
				for (var j:int = 0; j < (items[i] as CheckOutGuestListVO).aProfilePersonal.length; j++)
				{
					t = new CheckOutGuestListVO();
					
					t.oOrder = (items[i] as CheckOutGuestListVO).oOrder;
					t.sRoomNumber = (items[i] as CheckOutGuestListVO).sRoomNumber;
					t.sTAName = (items[i] as CheckOutGuestListVO).sTAName; 
					t.oProfilePersonal = (items[i] as CheckOutGuestListVO).aProfilePersonal[j];
					t.aProfilePersonal = (items[i] as CheckOutGuestListVO).aProfilePersonal;
					t.fBalance = (items[i] as CheckOutGuestListVO).fBalance;  
					if (j == 0)
						t.bFirst = true
					else
						t.bFirst = false;					
					model.checkOutModule.guestList.addItem( t );
				}
					//model.checkOutModule.listOfGuest.addItem( items[i] );
			}
			super.result(data);
		}
		
		
	}
}