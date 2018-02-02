package services
{
	import framework.utils.HeliumHelper;
	
	import h2olib.services.HTTPXmlService;
	
	import mx.utils.StringUtil;


	/**
	 * The LocaleService class reads a locale XML files
	 *
	 *  <p>The configuration file could have the following structure:</p>
	 *	<key>value</key>
	 *
	 * @author Anton Kirzyk / Ramada
	 * @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	 */
	public class LocaleService extends HTTPXmlService
	{

		public var localeFileName:String;

		/**
		 *  Constructor.
		 *  
		 *  @param xmlFileName configuration XML file
		 *  @param resultHandler result handler function
		 */
		public function LocaleService(localeFileName:String, resultHandler:Function,
				errorHandler:Function = null) 
		{
			super(resultHandler, errorHandler);

			this.localeFileName = localeFileName;
			showBusyCursor = false;
		}

		override public function get url():String 
		{
			return StringUtil.substitute("assets/locale/{0}", localeFileName);
		}
	}
}

