package h2olib.control.treeGrid 
{
    import flash.display.DisplayObject;
    import flash.display.Graphics;
    import flash.display.Sprite;
    import flash.events.Event;
    
    import mx.collections.IViewCursor;
    import mx.controls.DataGrid;
    import mx.controls.dataGridClasses.DataGridColumn;
    import mx.core.EventPriority;
    import mx.core.FlexSprite;
    import mx.core.mx_internal;
    import mx.events.DataGridEvent;

    use namespace mx_internal;

    [IconFile("assets/treegrid.png")]

    /**
     * A DataGrid that allows rows to have tree-like behavior.
     *
      * @see mx.controls.DataGrid
     */
    public class TreeGrid extends DataGrid
    {

        /**
         * Creates the component and sets up event listeners.
         */
        public function TreeGrid() 
        {
            super();

            addEventListener(TreeGridNodeEvent.NODE_OPEN, treeGridNodeOpened,
                true, EventPriority.DEFAULT_HANDLER);
            addEventListener(TreeGridNodeEvent.NODE_CLOSE, treeGridNodeClosed,
                true, EventPriority.DEFAULT_HANDLER);
        }

        private var treeGridDataProvider: ITreeGridDataProvider;

        /**
         * Overrides dataProvider to set treeGridProvider if value is ITreeGridDataProvider
         */
        override public function set dataProvider(value:Object):void 
        {
            if (value is ITreeGridDataProvider) 
            {
                treeGridDataProvider = value as ITreeGridDataProvider;
                value = treeGridDataProvider.dataProvider;
                treeGridDataProvider.addEventListener(TreeGirdDataProviderEvent.SORT, onSortTreeGridDataProvider);

            }
            super.dataProvider = value;
        }

        // Overrides DataGrid HEADER_RELEASE handler
        override public function dispatchEvent(event: Event):Boolean 
        {
            if (event.type == DataGridEvent.HEADER_RELEASE) 
            {
                this.headerReleaseHandler(event as DataGridEvent);
                return true;
            }
            return super.dispatchEvent(event);
        }

        private function headerReleaseHandler(event:DataGridEvent):void
        {
            sortByColumn(event.columnIndex);
        }

        protected function sortByColumn(columnIndex: int):void 
        {
            var column: DataGridColumn = columns[columnIndex];
            var desc:Boolean = column.sortDescending;

            if (column.sortable && treeGridDataProvider)
            {
                column.sortDescending =! column.sortDescending;
                treeGridDataProvider.sortByField(column.dataField, column.sortDescending);
                var dir:String = (desc) ? "DESC" : "ASC";
                sortDirection = dir;
                lastSortIndex = sortIndex;
                sortIndex = columnIndex;
                sortColumn = column;
                placeSortArrow();
            }
        }


        private var tmpSavedHorizontalScrollPosition: Number;

        private var tmpSelectedItem: Object;

        private function onSortTreeGridDataProvider(evnet: Event):void 
        {
            tmpSelectedItem = selectedItem;
            tmpSavedHorizontalScrollPosition = horizontalScrollPosition;
            dataProvider = treeGridDataProvider.dataProvider;
            addEventListener(Event.ENTER_FRAME, restoreScrollPosition);
        }

        // Workaround to restore horizontalScrollPosition
        private function restoreScrollPosition(event: Event):void 
        {
            removeEventListener(Event.ENTER_FRAME, restoreScrollPosition);
            horizontalScrollPosition = tmpSavedHorizontalScrollPosition;
            if (tmpSelectedItem != null) 
            {
                selectedItem = tmpSelectedItem;
                scrollToIndex(selectedIndex);
            }
        }

        /**
         *  @private
         *  The index of the column being sorted.
         */
        private var sortIndex:int = -1;

        /**
         *  @private
         *  The column being sorted.
         */
        private var sortColumn:DataGridColumn;

        /**
         *  @private
         *  The direction of the sort
         */
        private var sortDirection:String;

        /**
         *  @private
         *  The index of the last column being sorted on.
         */
        private var lastSortIndex:int = -1;

        /**
         *  Draws the sort arrow graphic on the column that is the current sort key.
         *  This implementation creates or reuses an instance of the skin specified
         *  by <code>sortArrowSkin</code> style property and places
         *  it in the appropriate column header.  It
         *  also shrinks the size of the column header if the text in the header
         *  would be obscured by the sort arrow.
         */
        override protected function placeSortArrow():void
        {
            var sortArrowHitArea:Sprite =
                Sprite(listContent.getChildByName("sortArrowHitArea"));

            if (sortIndex == -1 && lastSortIndex == -1)
            {
                if (sortArrow)
                    sortArrow.visible = false;
                if (sortArrowHitArea)
                    sortArrowHitArea.visible = false;
                return;
            }

            if (!headerVisible)
            {
                if (sortArrow)
                    sortArrow.visible = false;
                if (sortArrowHitArea)
                    sortArrowHitArea.visible = false;
                return;
            }
            
            // Property is read-only.
            /*if (!sortArrow)
            {
                var sortArrowClass:Class = getStyle("sortArrowSkin");
                sortArrow = new sortArrowClass();
                DisplayObject(mx_internal::sortArrow).name = "sortArrow";
                listContent.addChild(DisplayObject(sortArrow));
            }*/
            var xx:Number;
            var n:int;
            var i:int;
            if (listItems && listItems.length && listItems[0])
            {
                n = listItems[0].length;
                for (i = 0; i < n; i++)
                {
                    if (visibleColumns[i].colNum == sortIndex)
                    {
                        xx = listItems[0][i].x + visibleColumns[i].width;
                        listItems[0][i].setActualSize(visibleColumns[i].width - sortArrow.measuredWidth - 8, listItems[0][i].height);

                        if (!isNaN(listItems[0][i].explicitWidth))
                            listItems[0][i].explicitWidth = listItems[0][i].width;

                        // Create hit area to capture mouse clicks behind arrow.
                        if (!sortArrowHitArea)
                        {
                            sortArrowHitArea = new FlexSprite();
                            sortArrowHitArea.name = "sortArrowHitArea";
                            listContent.addChild(sortArrowHitArea);
                        }
                        else
                            sortArrowHitArea.visible = true;

                        sortArrowHitArea.x = listItems[0][i].x + listItems[0][i].width;
                        sortArrowHitArea.y = listItems[0][i].y;

                        var g:Graphics = sortArrowHitArea.graphics;
                        g.clear();
                        g.beginFill(0, 0);
                        g.drawRect(0, 0, sortArrow.measuredWidth + 8,
                                listItems[0][i].height);
                        g.endFill();

                        break;
                    }
                }
            }
            if (isNaN(xx))
            {
                sortArrow.visible = false;
                return;
            }
            sortArrow.visible = true;
            if (lastSortIndex >= 0 && lastSortIndex != sortIndex)
                if (visibleColumns[0].colNum <= lastSortIndex && lastSortIndex <= visibleColumns[visibleColumns.length - 1].colNum)
                {
                    n = listItems[0].length;
                    for (var j:int = 0; j < n ; j++)
                    {
                        if (visibleColumns[j].colNum == lastSortIndex)
                        {
                            listItems[0][j].setActualSize(visibleColumns[j].width, listItems[0][j].height);
                            break;
                        }
                    }
                }

            var d:Boolean = (sortDirection == "ASC");
            sortArrow.width = sortArrow.measuredWidth;
            sortArrow.height = sortArrow.measuredHeight;
            DisplayObject(sortArrow).scaleY = (d) ? -1.0 : 1.0;
            sortArrow.x = xx - sortArrow.measuredWidth - 8;
            var hh:Number = rowInfo.length ? rowInfo[0].height : headerHeight
            sortArrow.y = (hh - sortArrow.measuredHeight) / 2 + ((d) ? sortArrow.measuredHeight: 0);

            if (sortArrow.x < listItems[0][i].x)
                sortArrow.visible = false;

            if (!sortArrow.visible && sortArrowHitArea)
                sortArrowHitArea.visible = false;
        }


        /**
         * Called when an event is fired from a node opening.
         */
        protected function treeGridNodeOpened(event:TreeGridNodeEvent):void 
        {
            var cursor:IViewCursor = collection.createCursor();
            var node:ITreeGridNode = event.node;
            while (!cursor.afterLast) 
            {
                if (cursor.current == node) 
                {
                    cursor.moveNext();
                    insertAllChildNodes(cursor, node);
                    return;
                }
                cursor.moveNext();
            }
        }

        /**
         * Expandes all child nodes
         */
        private function insertAllChildNodes(cursor: IViewCursor, rootNode: ITreeGridNode): void 
        {
            for each (var childNode:ITreeGridNode in rootNode.children) 
            {
                cursor.insert(childNode);
                if (childNode.open) 
                {
                    insertAllChildNodes(cursor, childNode);
                }
            }
        }

        /**
         * Called when an event is fired from a node closing.
         */
        protected function treeGridNodeClosed(event:TreeGridNodeEvent):void 
        {
            var cursor:IViewCursor = collection.createCursor();
            var node:ITreeGridNode = event.node;
            while (!cursor.afterLast) 
            {
                if (cursor.current == node) 
                {
                    cursor.moveNext();
                    removeAllChildNodes(cursor, node);
                    return;
                }
                cursor.moveNext();
            }
        }

        /**
         * Collapses all child nodes
         */
        private function removeAllChildNodes(cursor: IViewCursor, rootNode: ITreeGridNode): void 
        {
            for each (var childNode:ITreeGridNode in rootNode.children) 
            {
                cursor.remove();
                if (childNode.open) 
                {
                    removeAllChildNodes(cursor, childNode);
                }
            }
        }
    }
}
