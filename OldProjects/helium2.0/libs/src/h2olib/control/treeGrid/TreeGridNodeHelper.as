package h2olib.control.treeGrid 
{

    /**
     * Helper class for ITreeGridNode implementations.
     */
    public class TreeGridNodeHelper 
    {

        /**
         * Constructor.
         */
        public function TreeGridNodeHelper() 
        {
            super();
        }

        /** Indicates if the node is open */
        public var open:Boolean = false;

        /** Number of levels to indent the node */
        public var indentLevel:Number = 0;

        public function toggleOpen():void 
        {
            open = (!open);
        }

        [Inspectable(category="General", enumeration="none,open,open_only", defaultValue="none")]
        public var openPolicy:String = "none";
    }
}
