package h2olib.control.headerRenderer
{
    import flash.events.Event;
    
    import mx.controls.ComboBox;
    import mx.controls.dataGridClasses.DataGridColumn;
    

    [Bindable]
    public class HeaderRendererDDL extends BaseHeaderRenderer
    {
        private var _ddl:ComboBox;
        
        public function HeaderRendererDDL() 
        {
        }

        private var _array:Array;

        private static var firstString:String = "All";

        override public function set data(value:Object):void 
        {
            super.data = value;
            if (value is DataGridColumn) 
            {
                this._array = this.createValueList();
            }
        }

        override public function initialize():void 
        {
            super.initialize();

            if (this._ddl && data)
             {
                this._array = this.createValueList();
                this._ddl.dataProvider = this._array;

                	var s:String = getData() as String; 
                	if(!s)
                	{
                		this._ddl.selectedIndex = 0;	
                	}
                	else
                	{
                		this._ddl.selectedItem = s;     
                	}           
                
            }
        }

        override public function validateDisplayList():void 
        {
            super.validateDisplayList();
        }

        override protected function createChildren():void 
        {
            super.createChildren();
            if (!this._ddl) 
            {

                this._ddl = new ComboBox();
                this._ddl.setStyle("cornerRadius","0");
                this._ddl.setStyle("borderThickness","0");

                this._ddl.addEventListener(Event.CHANGE, changeDdlFieldHandler);
                this._ddl.percentWidth = 100;
                this._ddl.minWidth = 0;

                addControlElement(this._ddl);
            }
        }

        private function changeDdlFieldHandler(event:Event):void 
        {
            if (this._ddl.selectedIndex == 0) 
            {
                saveData(null);
            } 
            else 
            {
                saveData(this._ddl.selectedItem);
            }
            refreshDataProvider();
        }

        [Bindable(action="change")]
        public function createValueList():Array 
        {
            var result:Array = new Array();
            result = result.concat(firstString);
            var buf:String;
            if (dataProvider) 
            {
                for (var i:int=0; i<dataProvider.list.length;i++) 
                {
                    buf = (data as DataGridColumn).itemToLabel(dataProvider.list.getItemAt(i));
                    if(result.indexOf(buf) >= 0) continue;
                    result = result.concat(buf);
                }
            }
            return result;
        }
    }
}
