/*
 * $Id: TreeGridColumnEx.as,v 1.1 2008/02/24 10:40:56 spo Exp $
 *
 * Copyright (c) 2007 WorldTicket A/S
 * All rights reserved.
 */
package net.worldticket.core.controls {
    import flexlib.controls.treeGridClasses.TreeGridColumn;

    import mx.controls.dataGridClasses.DataGridColumn;
    import net.worldticket.core.controls.dataGridExClasses.IFooterColumn;

    /**
     * The TreeGridColumnEx class is used for ..
     *
     * @author Sergey Poltorak (SPO) / WorldTicket A/S
     * @version $Revision 1.0 $ $Date: 2008/02/24 10:40:56 $
     */
    [DefaultProperty("footerColumn")]
    public class TreeGridColumnEx extends TreeGridColumn implements IFooterColumn{
        /**
         * Constructor.
         */
        public function TreeGridColumnEx() {
            super();
        }

        private var _footerColumn:DataGridColumn;

        public function set footerColumn(value:DataGridColumn):void {
            _footerColumn = value;
        }

        public function get footerColumn():DataGridColumn {
            return _footerColumn;
        }
    }
}
