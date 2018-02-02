package services.vo.backend
{
	[RemoteClass(alias="MapVatObject")]
	[Bindable]
	public class VatObjectVO
	{
		public var iVatId:Number;
        public var sVatName:String;
        public var iVatValue:Number;

        public function VatObjectConstructor(iVatId:Number, sVatName:String, iVatValue:Number):void
        {
            this.iVatId = iVatId;
            this.sVatName = sVatName;
            this.iVatValue = iVatValue;
        }

	}
}