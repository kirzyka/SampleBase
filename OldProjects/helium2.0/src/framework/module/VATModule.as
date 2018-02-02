package framework.module
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class VATModule
	{
		public var currPage:int = 0;
		
		public var vatDP:ArrayCollection = new ArrayCollection();
		public var vatEnable:Boolean = true;
		 
		public var maxVATItems:int = 0;
	}
}