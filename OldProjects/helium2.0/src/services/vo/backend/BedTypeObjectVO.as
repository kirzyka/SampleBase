package services.vo.backend
{
	[RemoteClass(alias="MapBedType")]
	public class BedTypeObjectVO
	{
	 	public var iTypeId:Number;
        public var sTypeName:String;
        public var bIsDefault:Boolean;
        
        
        public var bIsChecked:Boolean;        
        public var ___iCapacity:int = 1; // only for client
        //public var bIsDelete:Boolean;
 
        public function BedTypyConstructor(iTypeId:Number, sTypeName:String):void
        { 
            this.iTypeId = iTypeId;
            this.sTypeName = sTypeName;
            this.bIsChecked = false;
            this.bIsDefault = false;
        }

	}
}