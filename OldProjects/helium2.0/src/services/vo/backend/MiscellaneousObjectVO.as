package services.vo.backend
{
	//[RemoteClass(alias="MapVatObject")]
	[Bindable]
	public class MiscellaneousObjectVO
	{
		public var currPage:int;
		
		public var pageNames:Array=["Countries and Regions", "Languages", "Nationalities", "VAT", "Loyalty Programs", "Salutation"];

        public function MiscellaneousObjectVO(currPage:int = 0):void
        {
            this.currPage = currPage;           
        }
	}
}