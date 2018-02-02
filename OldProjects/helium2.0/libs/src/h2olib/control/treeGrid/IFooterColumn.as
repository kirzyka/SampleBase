package h2olib.control.treeGrid
{
    import mx.controls.dataGridClasses.DataGridColumn;

    /**
     * Mark your column class with [DefaultProperty("footerColumn")] metadata tag.
     */
    public interface IFooterColumn 
    {
        /**
         * The footer column definition
         */
        function set footerColumn(value:DataGridColumn):void;

        function get footerColumn():DataGridColumn;
    }
}
