package services.command.reservation
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.utils.ByteArray;
	
	import services.business.reservation.GetComfLetterDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.reservation.GetComfLetterEvent;
	
	import h2olib.utils.StringUtils;
	
	import mx.utils.Base64Decoder;

	public class GetComfLetterCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = GetComfLetterEvent(event);
			var evt:GetComfLetterEvent = GetComfLetterEvent( event );
			var delegate:GetComfLetterDelegate = new GetComfLetterDelegate( this );

			delegate.getComfLetter(evt);
			super.execute(event);
		}

		override public function result(data:Object):void
		{
			if(data != null)
			{
				var decoder:Base64Decoder = new Base64Decoder();
				var byteArr:ByteArray;
				
				decoder.decode(data.toString());	
				byteArr = decoder.toByteArray();							
				model.reservationCreateModule.confirmationLetterBody = byteArr.readUTFBytes(byteArr.length);
			}
			super.result(data);
		}
		
	}
}