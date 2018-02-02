package services.command.common
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.common.GetVipTotalListDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.common.GetVipTotalListEvent;
	import services.vo.GlobalStorage;
	
	import mx.collections.ArrayCollection;

	public class GetVipTotalListCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			var evt:GetVipTotalListEvent = GetVipTotalListEvent(event);
			var delegate:GetVipTotalListDelegate = new GetVipTotalListDelegate( this );
			delegate.getVIPTotalList(evt as GetVipTotalListEvent);
			
			super.execute(event);
		}
		
		override public function result(data:Object):void
		{
			GlobalStorage.vipTotal = new ArrayCollection(data as Array);
			
			super.result(data);
		}
	}
}