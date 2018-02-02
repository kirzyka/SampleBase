package h2olib.control.treeGrid
{
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ICollectionView;
	
	import org.osflex.ITreeGridNode;
	use namespace flash_proxy;
	
	public class TreeGridNodeProxy extends Proxy implements ITreeGridNode
	{
		/** Helper class for keeping up with state info */
		protected var helper:TreeGridNodeHelper = new TreeGridNodeHelper();

		/** Collection that holds children */
		protected var childData:ArrayCollection = new ArrayCollection();

		//
		// Methods required by the ITreeGridNode interface.
		//
		public function toggleOpen():void {
			helper.toggleOpen();
		}

		public function get open():Boolean 
		{
			return helper.open;
		}

		public function get children():ICollectionView 
		{
			return childData;
		}

		public function get indentLevel():Number 
		{
			return helper.indentLevel;
		}

		public function set indentLevel(level:Number):void 
		{
			helper.indentLevel = level;
		}

		public function addChild(child: ITreeGridNode): void 
		{
			child.indentLevel = indentLevel + 1;
			childData.addItem(child);
		}

		protected var bean: Object;

		public function TreeGridNodeProxy(bean: Object) 
		{
			this.bean = bean;
		}

		//
		// Methods required by the extended Proxy class
		//
		override flash_proxy function getProperty(name:*):* 
		{
			return bean[name];
		}

		override flash_proxy function setProperty(name:*, value:*):void 
		{
			bean[name] = value;
		}

		override flash_proxy function hasProperty(name:*):Boolean 
		{
			return bean.hasOwnProperty(name);
		}

	}		
}