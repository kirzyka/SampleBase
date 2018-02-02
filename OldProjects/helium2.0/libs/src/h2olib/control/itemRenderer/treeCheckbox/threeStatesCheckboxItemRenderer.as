package h2olib.control.itemRenderer.treeCheckbox
{
    import flash.display.*;
    import flash.events.*;
    
    import h2olib.control.event.TreeCheckboxEvent;
    import h2olib.control.itemRenderer.treeCheckbox.sepy.ui.CheckBoxExtended;
    
    import mx.controls.*;
    import mx.controls.listClasses.*;
    import mx.controls.treeClasses.*;
    import mx.core.*;
    import mx.events.*;
    
    
    use namespace mx_internal;

	/**
	* The threeStatesCheckboxItemRenderer is item renderer for Tree Check Box used
	*
	* @author Viktor Potapov / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-09-24 12:36:50 +0300 (Thu, 24 Sep 2009) $
	*
	*/
   
    
    public class threeStatesCheckboxItemRenderer extends UIComponent implements IDataRenderer, IDropInListItemRenderer, IListItemRenderer
    {
        private var _data:Object;        
        private var _listData:TreeListData;
        private var listOwner:Tree;
        
        protected var checkBox:CheckBoxExtended;
        protected var label:UITextField;
        protected var disclosureIcon:IFlexDisplayObject;
        
        public function threeStatesCheckboxItemRenderer():void
        {
            super();
            mouseEnabled = false;
        }
        

        public function get listData():BaseListData
        {
            return _listData;
        }
        
        public function set listData(s:BaseListData):void
        {
            _listData = TreeListData(s);
            invalidateProperties();
        }
        
        public function get data():Object
        {
            return _data;
        }
        
        public function set data(o:Object):void
        {
            _data = o;
            invalidateProperties();
            dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
        }
        
        public function getStatus():uint
        {
            var state:uint = 0
            if(checkBox.selected)
                state = 1;
            if(checkBox.middle)
                state = 2;
            return state;
        }
        
        override protected function createChildren():void
        {
            super.createChildren();
            if(!checkBox)
            {
                checkBox = new CheckBoxExtended();
                checkBox.styleName = this
                checkBox.allow3StateForUser = true;
                checkBox.addEventListener(MouseEvent.CLICK, checkBoxClicked);
                addChild(checkBox);
            }
            if(!label)
            {
                label = new UITextField();
                label.styleName = this;
                addChild(label);
            }
        }
        
        override protected function commitProperties():void
        {
            super.commitProperties();
    
            if (disclosureIcon)
            {
                disclosureIcon.removeEventListener(MouseEvent.MOUSE_DOWN, disclosureMouseDownHandler);
                removeChild(DisplayObject(disclosureIcon));
                disclosureIcon = null;
            }
            
            if(_data)
            {
                listOwner = Tree(_listData.owner);
                
                if (_listData.disclosureIcon)
                {
                    var disclosureIconClass:Class = _listData.disclosureIcon;
                    var disclosureInstance:* = new disclosureIconClass();
                    
                    if (!(disclosureInstance is InteractiveObject))
                    {
                        var wrapper:SpriteAsset = new SpriteAsset();
                        wrapper.addChild(disclosureInstance as DisplayObject);
                        disclosureIcon = wrapper as IFlexDisplayObject;
                    }
                    else
                    {
                        disclosureIcon = disclosureInstance;
                    }
    
                    addChild(disclosureIcon as DisplayObject);
                    disclosureIcon.addEventListener(MouseEvent.MOUSE_DOWN, disclosureMouseDownHandler);
                }
                        
                checkBox.label = _listData.label;
                if(int(_data.checked) == 0)
                {
                    checkBox.middle =   false;                    
                    checkBox.selected = false
                } else if(int(_data.checked) == 1)
                {
                    checkBox.middle =   false;                    
                    checkBox.selected = true;
                } else {
                    checkBox.middle =   true;
                }
                checkBox.allow3StateForUser = _data.children().length() > 0
                label.text = _listData.label;
                label.multiline = listOwner.variableRowHeight;
                label.wordWrap = listOwner.wordWrap;
            }
            
            invalidateDisplayList();
        }
        
        override protected function measure():void
        {
            super.measure();
            var w:Number = _data ? _listData.indent : 0;
            if (disclosureIcon)
            {
                w += disclosureIcon.width;
            }
            if (label.width < 4 || label.height < 4)
            {
                label.width = 4;
                label.height = 16;
            }
    
            if (isNaN(explicitWidth))
            {
                w += label.getExplicitOrMeasuredWidth();    
                measuredWidth = w;
                measuredHeight = label.getExplicitOrMeasuredHeight();
            }
            else
            {
                label.width = Math.max(explicitWidth - w, 4);
                measuredHeight = label.getExplicitOrMeasuredHeight();
            }
        }
            
        override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
        {
            super.updateDisplayList(unscaledWidth, unscaledHeight);
    
            var startx:Number = _data ? _listData.indent : 0;
            
            if (disclosureIcon)
            {
                disclosureIcon.x = startx;
                startx = disclosureIcon.x + disclosureIcon.width;
                disclosureIcon.setActualSize(disclosureIcon.width, disclosureIcon.height);
                disclosureIcon.visible = _data ? _listData.hasChildren : false;
            }
            
            checkBox.x = startx + 5;
            label.x = startx + 20;
            label.setActualSize(unscaledWidth - startx, measuredHeight);
    
            var verticalAlign:String = getStyle("verticalAlign");
            if (verticalAlign == "top")
            {
                label.y = 0;
                if (disclosureIcon)
                {
                    disclosureIcon.y = 0;
                }
            }
            else if (verticalAlign == "bottom")
            {
                label.y = unscaledHeight - label.height + 2; // 2 for gutter
                if (disclosureIcon)
                {
                    disclosureIcon.y = unscaledHeight - disclosureIcon.height;
                }
            } else {
                label.y = (unscaledHeight - label.height) / 2;
                if (disclosureIcon)
                {
                    disclosureIcon.y = (unscaledHeight - disclosureIcon.height) / 2;
                }
            }
    
            var labelColor:Number;
    
            if (data && parent)
            {
                if (!enabled)
                {
                    labelColor = getStyle("disabledColor");
                }    
                else if (listOwner.isItemHighlighted(listData.uid))
                {
                    labelColor = getStyle("textRollOverColor");
                }
                else if (listOwner.isItemSelected(listData.uid))
                {
                    labelColor = getStyle("textSelectedColor");
                } else {
                    labelColor = getStyle("color");
                   }
                   label.setColor(labelColor);
            }
        }
        
        private function disclosureMouseDownHandler(event:Event):void
        {
            event.stopPropagation();    
            if (listOwner.isOpening || !listOwner.enabled)
            {
                return;
            }    
            var open:Boolean = _listData.open;
            _listData.open = !open;
            listOwner.dispatchTreeEvent(TreeEvent.ITEM_OPENING, _listData.item, this, event, !open, true, true)
        }
        
        /**
         * checkbox has been clicked by user
         */
        private function checkBoxClicked(e:MouseEvent):void
        {        
            _data.checked = getStatus();
            listOwner.dispatchEvent(new TreeCheckboxEvent(TreeCheckboxEvent.TREE_CHECKBOX_CLICK));            
        }
        
    }

}