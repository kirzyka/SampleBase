package h2olib.control.treeGrid 
{
    import flash.display.DisplayObject;
    import flash.display.Shape;
    
    import mx.controls.DataGrid;
    import mx.controls.dataGridClasses.DataGridColumn;
    import mx.controls.dataGridClasses.DataGridListData;
    import mx.controls.listClasses.IDropInListItemRenderer;
    import mx.controls.listClasses.IListItemRenderer;
    import mx.core.EdgeMetrics;
    import mx.core.IFlexDisplayObject;
    import mx.core.UIComponent;
    import mx.core.mx_internal;
    import mx.skins.Border;

    use namespace mx_internal;

    /**
     * This class draws the bottom colum into DataGridEx
     */
    public class FooterBorder extends UIComponent 
    {

        public function FooterBorder() 
        {
            super();
        }

        protected var border:IFlexDisplayObject;

        protected var overlay:Shape;

        protected var dataGrid:DataGrid;

        /**
         * Creates the actual border here
         */
        override protected function createChildren():void  
        {
            var borderClass:Class = (parent as DataGrid).getStyle("borderSkin");
            border = new borderClass() as IFlexDisplayObject;
            (border as Border).styleName = styleName;       // delegate styles
            addChild(DisplayObject(border));

            dataGrid = parent as DataGrid;

            overlay = new Shape();
            addChild(overlay);
         }

        private function getEdgeMetrics(w:Number, h:Number):EdgeMetrics
        {
            overlay.graphics.clear();

            border.setActualSize(w, h);
            var bm:EdgeMetrics = (border as Border).borderMetrics;

            // destroy the old children
            while (numChildren > 2) 
            {
                removeChildAt(2);
            }
            return bm;
        }

        private function getColsAndIndex():Object 
        {
            // make new ones
            var cols:Array = dataGrid.columns;
            var firstCol:int = dataGrid.horizontalScrollPosition;

            var colIndex:int = 0;
            var n:int = cols.length;
            var index:int = 0;
            while (colIndex < firstCol) 
            {
                // find first visible column;
                if (cols[index].visible) 
                {
                    colIndex += 1;
                }
                index += 1;
            }
            return {cols: cols, index: index};
        }

        /**
         * Paints footer in the DataGrid
         * @param w DataGrid's width
         * @param h DataGrid's height
         * @param vm EdgeMetrics
         * @param xx calculated value
         * @param yy calculated value
         * @param cols DataGrid's columns
         * @param index first element index
         * @param vlines verticalGridLines style
         * @param bm border's metrics
         */
        private function paintComponent(w:Number, h:Number, vm:EdgeMetrics, xx:Number, yy:Number,
            cols:Array, index:int, vlines:Boolean, bm:EdgeMetrics):void 
        {
            var visibleIndex:int = index;
            while(xx < w - vm.right) 
            {
                var col:DataGridColumn = cols[index];
                index += 1;

                if (!col) 
                {
                    break;
                }

                if (!col.visible) 
                {
                    // skip invisible column
                    continue;
                }

                if (col is IFooterColumn) 
                {
                    var fc:IFooterColumn = col as IFooterColumn;
                    if (!fc.footerColumn) 
                    {
                        fc.footerColumn = new DataGridColumnEx();
                    }

                    visibleIndex += 1;

                    fc.footerColumn.owner = col.owner;
                    var renderer:IListItemRenderer = (fc.footerColumn.itemRenderer)
                        ?  fc.footerColumn.itemRenderer.newInstance()
                        : dataGrid.itemRenderer.newInstance();
                    renderer.styleName = fc.footerColumn;
                    if (renderer is IDropInListItemRenderer) 
                    {
                        IDropInListItemRenderer(renderer).listData =
                            new DataGridListData(
                            (fc.footerColumn.labelFunction != null)
                                ? fc.footerColumn.labelFunction(col)
                                : fc.footerColumn.headerText,
                            col.dataField, visibleIndex - 1, null, dataGrid, -1);
                    }
                    renderer.data = col;
                    addChild(DisplayObject(renderer));
                    renderer.x = xx;
                    renderer.y = yy;
                    renderer.setActualSize(col.width - 1, dataGrid.rowHeight);
                    if (vlines) 
                    {
                        overlay.graphics.moveTo(xx + col.width, yy);
                        overlay.graphics.lineTo(xx + col.width, h - bm.bottom);
                    }
                } 
                else if (col is DataGridColumn) 
                {
                    if (vlines) 
                    {
                        overlay.graphics.moveTo(xx + col.width, yy);
                        overlay.graphics.lineTo(xx + col.width, h - bm.bottom);
                    }
                }
                if (col == null) 
                {
                    break;
                }
                xx += col.width;
            }
        }

        /**
         * Updates data into display
         * @param w DataGrid's width
         * @param h DataGrid's height
         */
        override protected function updateDisplayList(w:Number, h:Number):void 
        {
            var bm:EdgeMetrics = getEdgeMetrics(w, h);
            var result:Object = getColsAndIndex();
            var cols:Array = result.cols;
            var index:int = result.index;

            var vm:EdgeMetrics = dataGrid.viewMetrics;
            var lineCol:uint = dataGrid.getStyle("verticalGridLineColor");
            var vlines:Boolean = dataGrid.getStyle("verticalGridLines");
            overlay.graphics.lineStyle(1, lineCol);

            var xx:Number = vm.left;
            var yy:Number = h - bm.bottom - dataGrid.rowHeight;
            paintComponent(w, h, vm, xx, yy, cols, index, vlines, bm);
            lineCol = dataGrid.getStyle("horizontalGridLineColor");
            if (dataGrid.getStyle("horizontalGridLines")) 
            {
                overlay.graphics.lineStyle(1, lineCol);
                overlay.graphics.moveTo(vm.left, yy);
                overlay.graphics.lineTo(w - vm.right, yy);
            }
        }

        /**
         * factor in the footer
         */
        public function get borderMetrics():EdgeMetrics 
        {
            var em:EdgeMetrics = (border as Border).borderMetrics.clone();
            for each (var column:DataGridColumn in dataGrid.columns) 
            {
                if (column is DataGridColumnEx &&
                    !((column as DataGridColumnEx).footerColumn is DataGridColumnEx)) 
                {
                    em.bottom += dataGrid.rowHeight;
                    break;
                }
            }
            return em;
        }
    }
}
