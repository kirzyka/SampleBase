package services.vo
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class TestVO extends MapValueObject
	{
		public var id: int;
		public var parentG: Object = null;
        public var children: Array = [];
        public var label: String;
        
        public var selected:Boolean = false;
        public var middle:Boolean = false;
        /* public function get children():ArrayCollection
        {
        	return new ArrayCollection(children); 
        } */
	}
}