package h2olib.control.headerRenderer
{
    import flash.events.Event;
    
    import h2olib.control.itemRenderer.dataGrid.BaseHeaderRenderer;
    
    import mx.controls.TextInput;

    public class HeaderRendererEdit extends BaseHeaderRenderer 
    {

        /**
         * Constructor.
         */
        public function HeaderRendererEdit() 
        {
            super();
        }

        private var _edit:TextInput = null;

        override protected function createChildren():void 
        {
            super.createChildren();

            if (!this._edit) 
            {
                this._edit = new TextInput();
                this._edit.addEventListener(Event.CHANGE, changeEditField);
                this._edit.percentWidth = 100;
                this._edit.minWidth = 0;

                this._edit.text = getData() as String;

                addControlElement(this._edit);
            }
        }

        private function changeEditField(event:Event):void 
        {
            saveData(this._edit.text);
            refreshDataProvider();
        }
    }
}
