package h2olib.control.factory
{
    import h2olib.control.headerRenderer.BaseHeaderRenderer;
    import h2olib.control.headerRenderer.FilterObject;
    
    import mx.core.ClassFactory;

    public class HeaderRendererClassFactory extends ClassFactory 
    {

        private var _property:Object;

        private var _eventChange:Function;

        public function HeaderRendererClassFactory(generator: Class=null,
                                       property: Object=null,
                                       eventChange:Function = null) 
        {
            super(generator);
            this._property = property;
            this._eventChange = eventChange;

        }

        override public function newInstance():* 
        {
            var instance:Object = super.newInstance();

            if (this._property) 
            {
                if(instance && instance is BaseHeaderRenderer && this._property is FilterObject) 
                {
                    (instance as BaseHeaderRenderer).sharedData = this._property as FilterObject;
                }
                else if (instance.hasOwnProperty("dataProvider") && this._property) 
                {
                    instance["dataProvider"] = this._property;
                } 
                else if(instance && instance.hasOwnProperty("fieldName")) 
                {
                    instance["fieldName"] = this._property;
                }
            }

            if ((this._eventChange != null) &&
                instance && instance.hasOwnProperty("eventChangeFunction")) 
            {
                    instance["eventChangeFunction"] = _eventChange;
            }

            return instance;
        }
    }
}
