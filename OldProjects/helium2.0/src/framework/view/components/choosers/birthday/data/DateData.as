package framework.view.components.choosers.birthday.data
{
	public class DateData
	{
		/**
		 *  This property is id of date item view.
		 *  
		 *  @default -1
		 */
		public var id:Number = -1;
		/**
		 *  This property is showed name of date item view.
		 *  
		 *  @default ""
		 */
		public var name:String = "";
		
		public function DateData(id:Number = -1, name:String = "")
		{
			this.id = id;
			this.name = name;
		}
	}
}