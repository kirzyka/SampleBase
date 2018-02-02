package h2olib.control
{
    import flash.display.DisplayObject;
    
    import h2olib.control.treeGrid.FooterBorder;
    import h2olib.control.treeGrid.ITreeGridNode;
    import h2olib.control.treeGrid.TreeGrid;
    import h2olib.control.treeGrid.TreeGridNodeEvent;
    
    import mx.collections.ArrayCollection;
    import mx.core.EdgeMetrics;
    import mx.core.IUIComponent;
    import mx.events.ListEvent;
    import mx.styles.ISimpleStyleClient;

    /**
     * The TreeGridEx class is used for ..
     */
    public class TreeGridEx extends TreeGrid 
    {
        /**
         * Constructor.
         */
        public function TreeGridEx() 
        {
            super();

            addEventListener(TreeGridNodeEvent.NODE_OPEN, treeGridNodeOpened);
            addEventListener(TreeGridNodeEvent.NODE_CLOSE, treeGridNodeClosed);
        }

        /**
         * Extends the Datagrid metrics
         */
        override public function get borderMetrics():EdgeMetrics 
        {
            return (border as FooterBorder).borderMetrics;
        }

        /**
         * Creates the footer column
         */
        override protected function createBorder():void 
        {
            if (!border) {
                var borderClass:Class = FooterBorder;

                border = new borderClass();

                if (border is IUIComponent)
                {
                    IUIComponent(border).enabled = enabled;
                }
                if (border is ISimpleStyleClient)
                {
                    ISimpleStyleClient(border).styleName = this;
                }

                // Add the border behind all the children.
                addChildAt(DisplayObject(border), 0);

                invalidateDisplayList();
            }
        }

        /**
         * Redraws border
         */
        override protected function updateDisplayList(w:Number, h:Number):void 
        {
            super.updateDisplayList(w, h);
            (border as FooterBorder).invalidateDisplayList();
        }

        public function openAllChildNodes():void 
        {
            for each (var node:ITreeGridNode in dataProvider) 
            {
                if (!node.open) {
                    node.toggleOpen();
                    dispatchEvent(new TreeGridNodeEvent(TreeGridNodeEvent.NODE_OPEN, node));
                }
            }
        }

        override protected function treeGridNodeClosed(event:TreeGridNodeEvent):void 
        {
            var node:ITreeGridNode = event.node;
            removeChildNodes(node);
        }

        protected function removeNodeAndChangeSelection(item:ITreeGridNode):void 
        {
            var i:int = (dataProvider as ArrayCollection).getItemIndex(item);

            if (isAloneChild(item)) 
            {
                var pnode:ITreeGridNode = parentNode(item);
                if (pnode) pnode.toggleOpen();
            }

            removeNode(item);

            if ((dataProvider as ArrayCollection).length > 0) 
            {
                if ((dataProvider as ArrayCollection).length > i) 
                {
                    selectedIndex = i;
                } else {
                    selectedIndex = i-1;
                }
            } else {
                selectedIndex = -1;
            }
            dispatchEvent(new ListEvent(ListEvent.CHANGE));
        }

        protected function removeNode(item:ITreeGridNode):void 
        {
            var i:int = (dataProvider as ArrayCollection).getItemIndex(item);
            if (i >= 0) 
            {
                for each(var node:ITreeGridNode in item.children) 
                {
                    removeNode(node);
                }
                (dataProvider as ArrayCollection).removeItemAt(i);
            }
            updateList();
        }

        private function isAloneChild(item:ITreeGridNode):Boolean 
        {
            var result:Boolean = true;
            var i:int = dataProvider.getItemIndex(item);
            var node:ITreeGridNode;

            if ((i >= 0) && (item.indentLevel != 0)) 
            {
                var j:int = i;
                while (j >= 0) 
                {
                    j--;
                    node = (dataProvider as ArrayCollection).getItemAt(j) as ITreeGridNode;
                    //if child elements or the same indent level exists
                    if (node.indentLevel >= item.indentLevel) 
                    {
                        result = false;
                        break;
                    }

                    //if parent elements exists
                    if (node.indentLevel < item.indentLevel) 
                    {
                        break;
                    }
                }

                j = i;
                while (j < ((dataProvider as ArrayCollection).length-2)) 
                {
                    j++;
                    node = (dataProvider as ArrayCollection).getItemAt(j) as ITreeGridNode;
                    //if child elements or the same indent level exists
                    if (node.indentLevel > item.indentLevel) 
                    {
                        continue;
                    }

                    //if parent elements exists
                    if (node.indentLevel < item.indentLevel) 
                    {
                        break;
                    }

                    if (node.indentLevel == item.indentLevel) 
                    {
                        result = false;
                        break;
                    }
                }
            }
            return result;
        }

        private function parentNode(item:ITreeGridNode):ITreeGridNode 
        {
            var result:ITreeGridNode;

            if (item.indentLevel != 0) {
                var i:int = dataProvider.getItemIndex(item);
                var node:ITreeGridNode;

                if (i > 0) 
                {
                    while (i >= 0) 
                    {
                        i--;
                        node = (dataProvider as ArrayCollection).getItemAt(i) as ITreeGridNode;
                        //if parent elements exists
                        if (node.indentLevel < item.indentLevel) 
                        {
                            result = node;
                            break;
                        }
                    }
                }
            }

            return result;
        }

        protected function refreshChildNodes(node:ITreeGridNode):void 
        {
            removeChildNodes(node);
            insertChildNodes(node);
        }

        protected function removeChildNodes(node:ITreeGridNode):void 
        {
            for each(var item:ITreeGridNode in node.children) 
            {
                removeNode(item);
            }
        }

        private var cursor:int;

        protected function insertChildNodes(node:ITreeGridNode):void 
        {
            cursor = dataProvider.getItemIndex(node) + 1;

            for each(var item:ITreeGridNode in node.children) 
            {
                insertNode(item);
            }
        }

        protected function insertNode(node:ITreeGridNode, index:int = -1):void 
        {
            cursor = index < 0 ? cursor : index;

            (dataProvider as ArrayCollection).addItemAt(node, cursor);
            cursor++;
            if (node.open) 
            {
                var lastItem:ITreeGridNode = node;
                for each (var item:ITreeGridNode in node.children) 
                {
                    insertNode(item);
                }
            }
        }
    }
}
