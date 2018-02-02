package com.controls.tabNavigator
{
    import com.controls.tabNavigator.TabBarExtended;
    
    import mx.containers.TabNavigator;
    import mx.events.ChildExistenceChangedEvent;

    public class TabNavigatorExtended extends TabNavigator
    {
		private var _closeEnabled:Boolean = false;
		
        public function TabNavigatorExtended()
        {
            super();
        }

        public function get closeEnabled():Boolean
        {
            return this._closeEnabled;
        }

        public function set closeEnabled(value:Boolean):void
        {
            this._closeEnabled = value;
			
			if (tabBar)
			{
				(tabBar as TabBarExtended).closeEnabled = value;
			}
        }

        override protected function createChildren():void
        {
            if (!tabBar)
            {
                tabBar = new TabBarExtended();
                tabBar.name = "tabBar";
                tabBar.focusEnabled = false;

                (tabBar as TabBarExtended).closeEnabled = this._closeEnabled;
				rawChildren.addChild(tabBar);
            }

            super.createChildren();

            invalidateSize();
        }
    }
}
