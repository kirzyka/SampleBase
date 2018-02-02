package framework.view.pages.profiles.data
{
	public class ChooseCompanyVO
	{
		/**
		 *  This property is company name.
		 */
		private var _name:String;
		/**
		 *  This property is id of company.
		 */
		private var _id:Number;
		
		/**
		 *  ChooseCompanyVO. Constructor.
		 */
		public function ChooseCompanyVO(id:Number = 0, name:String = "")
		{
			_id = id;
			_name = name;
		}
		
		/**
		 *  Company name.
		 */
		public function get name():String
		{
			return _name;
		}
		/**
		 *  @private
		 */
		public function set name(value:String):void
		{
			_name = value;
		}
		
		/**
		 *  Company name.
		 */
		public function get id():Number
		{
			return _id;
		}
		/**
		 *  @private
		 */
		public function set id(value:Number):void
		{
			_id = value;
		}
	}
}