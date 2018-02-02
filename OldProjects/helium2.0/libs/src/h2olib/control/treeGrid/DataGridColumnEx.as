package h2olib.control.treeGrid
{
    import mx.controls.dataGridClasses.DataGridColumn;

    /**
     * The DataGridColumnEx component extends <code>DataGrid</code> class and
     * developed to be used as column type in <code>DataGridEx</code> class.
     *
     * It holds storagName value for a shared object of <code>DataGridEx</code> class.
     */
    [DefaultProperty("footerColumn")]
    public class DataGridColumnEx extends DataGridColumn implements IFooterColumn 
    {
        /**
         *  Constructor.
         */
        public function DataGridColumnEx(columnName:String=null) 
        {
            super(columnName);
        }

        public var filterable:Boolean;

        private var _isAutoincremented:Boolean;

        public function set isAutoincremented(value:Boolean):void 
        {
            _isAutoincremented = value;
            if (_isAutoincremented) 
            {
                sortable = false;
            }
        }

        public function get isAutoincremented():Boolean 
        {
            return _isAutoincremented;
        }

        /**
         * The footer column definition
         */
        private var _footerColumn:DataGridColumn;

        public function set footerColumn(value:DataGridColumn):void 
        {
            _footerColumn = value;
        }

        public function get footerColumn():DataGridColumn 
        {
            return _footerColumn;
        }
    }
}
