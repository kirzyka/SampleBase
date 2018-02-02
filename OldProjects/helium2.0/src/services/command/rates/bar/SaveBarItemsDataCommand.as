package services.command.rates.bar
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.rates.bar.BARDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.rates.bar.SaveBarItemsDataEvent;
	import services.vo.GlobalFunctions;
	import services.vo.GlobalSettings;
	import services.vo.hotels.HotelRoomWithBedTypesObjectVO;
	import services.vo.rates.bar.BARSaveItemVO;
	import services.vo.rates.bar.BarPriceVO;
	
	import mx.collections.ArrayCollection;
	import mx.controls.DateField;

	public class SaveBarItemsDataCommand extends BaseCommand
	{

		override public function execute(event:CairngormEvent):void
		{
			_event = SaveBarItemsDataEvent( event );
			var delegate:BARDelegate = new BARDelegate( this );

			delegate.saveBarItemsData(_event as SaveBarItemsDataEvent);
			super.execute( event );
		}

		override public function result(data:Object):void
		{
			var barItems:Array = data as Array;

			var totalDays:Number = -GlobalFunctions.getDate().getDate() + 1;
			var month:Number = model.currMonthIndex - GlobalFunctions.getDate().getMonth();
			model.ratesModule.barModule.totalCells = barItems.length;
			model.ratesModule.barModule.cellsData.removeAll();
			var cells:ArrayCollection = model.ratesModule.barModule.cellsData as ArrayCollection;

			for(var i:int = 0; i < barItems.length; i++)
			{
				var dateResult:Date = DateField.stringToDate((barItems[i] as BARSaveItemVO).sBarDate,"YYYY-MM-DD");

				if (barItems[i].aBarPrices.length == 0)
				{
					for (var j:int=0; j < model.hotelsModule.hotelRoomTypes.length; j++)
					{
						var tempPrice:BarPriceVO = new BarPriceVO;
						tempPrice.fPriceChildAbove = 0;
						tempPrice.fPriceChildMiddle = 0;
						tempPrice.fPriceChildBefore = 0;
						tempPrice.fPriceExtraAdult = 0;
						tempPrice.fPriceOneAdult = 0;
						tempPrice.fPriceTwoAdults = 0;
						tempPrice.iMarkupDelta = 0;
						tempPrice.iRQualityId = (model.hotelsModule.hotelRoomTypes.getItemAt(j) as HotelRoomWithBedTypesObjectVO).oRoomQuality.lQualityId;
						tempPrice.sRQualityName = (model.hotelsModule.hotelRoomTypes.getItemAt(j) as HotelRoomWithBedTypesObjectVO).oRoomQuality.sQualityName;
						barItems[i].aBarPrices.push(tempPrice);
					}
				}
				else if (barItems[i].aBarPrices.length < model.hotelsModule.hotelRoomTypes.length)
				{
					for (j=0; j < model.hotelsModule.hotelRoomTypes.length; j++)
					{
						if (j > barItems[i].aBarPrices.length - 1 || (model.hotelsModule.hotelRoomTypes.getItemAt(j) as HotelRoomWithBedTypesObjectVO).oRoomQuality.sQualityName != barItems[i].aBarPrices[j].sRQualityName)
						{
							tempPrice = new BarPriceVO;
							tempPrice.fPriceChildAbove = 0;
							tempPrice.fPriceChildMiddle = 0;
							tempPrice.fPriceChildBefore = 0;
							tempPrice.fPriceExtraAdult = 0;
							tempPrice.fPriceOneAdult = 0;
							tempPrice.fPriceTwoAdults = 0;
							tempPrice.iMarkupDelta = 0;
							tempPrice.iRQualityId = (model.hotelsModule.hotelRoomTypes.getItemAt(j) as HotelRoomWithBedTypesObjectVO).oRoomQuality.lQualityId;
							tempPrice.sRQualityName = (model.hotelsModule.hotelRoomTypes.getItemAt(j) as HotelRoomWithBedTypesObjectVO).oRoomQuality.sQualityName;
							barItems[i].aBarPrices.splice(j,0,tempPrice);// deleteCount is 0
						}
					}
				}

				barItems[i].sBarDate = DateField.dateToString(dateResult, GlobalSettings.DATE_FORMAT);
				if (!cells && !cells.getItemAt(i)) cells.setItemAt(barItems[i], i);
				else cells.addItemAt(barItems[i], i);

				totalDays++;
			}

			super.result( data );
		}


	}
}