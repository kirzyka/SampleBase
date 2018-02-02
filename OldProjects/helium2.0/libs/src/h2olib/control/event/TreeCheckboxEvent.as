package h2olib.control.event 
{
    import flash.events.Event;

	/**
	* The MessageEvent class used to signal about click to the
	* checkbox in tree.
	* @author Viktor Potapov / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-09-24 12:36:50 +0300 (Thu, 24 Sep 2009) $
	*
	*/

    public class TreeCheckboxEvent extends Event {
        public static const TREE_CHECKBOX_CLICK:String = "onTreeCheckBoxClick";
        
        public function TreeCheckboxEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(type, bubbles, cancelable);
        }
        
        override public function clone():Event
        {
            return new TreeCheckboxEvent(type, bubbles, cancelable);
        }      
    }
}
