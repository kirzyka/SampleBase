package services.vo.backend
{
	[RemoteClass(alias="MapRoomWithBedTypes")]
	public class RoomWithBedTypesObjectVO
	{
		/* public var iId:int;
		public var oBedType:BedTypeObjectVO;
        public var sShortName:String;
        public var sDescription:String;
        public var iRoomCapacity:Number;
  
        public function RoomWithBedTypesConstructor(iId:int, oBedType:BedTypeObjectVO, sShortName:String, sDescription:String, iRoomCapacity:Number):void
        {
        	this.iId = iId;
            this.oBedType = oBedType;
            this.sShortName = sShortName;
            this.sDescription = sDescription;
            this.iRoomCapacity = iRoomCapacity;
        } */
        
        public var oRoomQuality:RoomQualityObjectVO = new RoomQualityObjectVO();
        public var aRoomWithBedTypes:Array = new Array();
        public var flx_oRoomStandalone:RoomTypesObjectVO = new RoomTypesObjectVO();
        
           [Transient]
		public var checked:Boolean = false;  
		
	 	  [Transient]
		public var label:String = 'buuh';  
		
		[Transient]
		public var children:Array =  aRoomWithBedTypes;  
 
        public function RoomTypesConstructor(oRoomQuality:RoomQualityObjectVO, aRoomWithBedTypes:Array):void
        {
            this.oRoomQuality = oRoomQuality;
            this.flx_oRoomStandalone = flx_oRoomStandalone;
            if (aRoomWithBedTypes[0].oBedType == null)
            {
            	//this.flx_oRoomStandalone = aRoomWithBedTypes[0];
            	this.aRoomWithBedTypes = null;
            }
            else  
            {
            	this.aRoomWithBedTypes = aRoomWithBedTypes;
            	this.flx_oRoomStandalone = null;
            }
        }

	}
}