package services.command.miscellaneous.countries
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.miscellaneous.countries.CountryDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.miscellaneous.countries.GetCountryEvent;
	import framework.module.CommonModule;
	import services.vo.common.CountryVO;
	
	import mx.collections.ArrayCollection;
	/**
	 *  Command for get list of countries.
	 *  
	 *  TODO :: depricated
	 *  
	 *  @author Artemyev Dmitriy
	 *  @date 08.06.2009
	 */
	public class GetCountryCommand extends BaseCommand
	{	/**
		 *  Interface method. 
		 *  <p>Execute for forwarding the event to the method
		 *  <code>getCountry()</code>.
		 *  
		 *  @param event:CairngormEvent
		 *  
		 *  @see services.events.frontend.GetCountryEvent
		 *  @see services.business.frontend.GetCountryDelegate
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = GetCountryEvent( event );
			var delegate:CountryDelegate = new CountryDelegate(this);
			
			delegate.getCountry( _event as GetCountryEvent );
			super.execute( event );
		}
		/**
		 *  The handler to get result of the execution by remote call for
		 *  <code>getCountry()</code>.
		 *  <p>This method is called by a service when the return value
		 *  has been received.
		 *   
		 *  @param data:Object - result of the remote call.
		 */
		override public function result(data:Object):void
		{
			_storage.countries = new ArrayCollection(data as Array);
			// cashe all city in the address storage
			for(var i:int = 0; i < _storage.countries.length; i++)
			{
				CommonModule.addCountry(data[i] as CountryVO);
			}
			
			super.result(data);
		}
	}
}