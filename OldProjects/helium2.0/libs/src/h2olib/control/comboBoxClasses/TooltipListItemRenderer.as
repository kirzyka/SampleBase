package h2olib.control.comboBoxClasses
{
    import flash.geom.Point;
    import flash.geom.Rectangle;

    import mx.controls.listClasses.ListItemRenderer;
    import mx.core.IToolTip;
    import mx.events.ToolTipEvent;

	/**
	* The TooltipListItemRenderer class is 
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009/06/24 $
	*
	*/
    public class TooltipListItemRenderer extends ListItemRenderer 
    {

        public function TooltipListItemRenderer() 
        {
            super();
        }

        override protected function toolTipShowHandler(event:ToolTipEvent):void 
        {
            var toolTip:IToolTip = event.toolTip;

            // Calculate global position of label.
            var pt:Point = new Point(0, 0);
            pt = label.localToGlobal(pt);
            pt = stage.globalToLocal(pt);

            toolTip.move(pt.x + owner.width, pt.y + (height - toolTip.height) / 2);

            var screen:Rectangle = systemManager.screen;
            var screenRight:Number = screen.x + screen.width;
            if (toolTip.x + toolTip.width > screenRight) 
            {
                toolTip.move(screenRight - toolTip.width, toolTip.y);
            }
        }
    }
}
