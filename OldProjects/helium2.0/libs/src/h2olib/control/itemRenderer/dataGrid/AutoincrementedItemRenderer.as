package h2olib.control.itemRenderer.dataGrid 
{
    import mx.controls.DataGrid;
    import mx.controls.dataGridClasses.DataGridItemRenderer;
    import mx.controls.dataGridClasses.DataGridListData;

	/**
	* The AutoincrementedItemRenderer is item renderer for DataGridColumn used
	*  as autoincremented colummn.
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009/06/23 $
	*
	*/
    public class AutoincrementedItemRenderer extends DataGridItemRenderer 
    {

        public function AutoincrementedItemRenderer() 
        {
            super();
        }

        /**
         *  Assigns row index to the text property.
         *
         *  DataGridItemRenderer extends TextField and has a slightly different
         *  validation mechanism than UIComponent-based widgets.  All visuals
         *  are resolved within the validateNow call.
         */
        override public function validateNow():void 
        {
            super.validateNow();
            if (data && listData) {
                text = listData.rowIndex.toString();
            }
        }
    }
}