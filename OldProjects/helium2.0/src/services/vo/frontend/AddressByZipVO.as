package services.vo.frontend
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class AddressByZipVO
	{
		/**
		 *  This property contain view of zip code.
		 */
		public var zipCode:String;
		/**
		 *  This property contain addresse by zip code.
		 */
		public var address:ArrayCollection = new ArrayCollection();
	}
}