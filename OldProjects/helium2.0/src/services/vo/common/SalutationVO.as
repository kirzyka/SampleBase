package services.vo.common
{
	[RemoteClass(alias="MapSalutation")]
	[Bindable]
	public class SalutationVO
	{
		/**
		 *  This property contain id of salutation.
		 */
		public var lId:Number;
		/**
		 *  This property contain name of salutation.
		 */
		public var sName:String;
		/**
		 *  This property contain dascription of salutation.
		 */
		public var sDescription:String;
		/**
		* Id name of language
		*/
		public var lNameLocaleId:Number;
		/**
		* Id description of language
		*/
		public var lDescriptionLocaleId:Number;
		/**
		* Id language
		*/
		public var lLanguageId:Number;
	}
}