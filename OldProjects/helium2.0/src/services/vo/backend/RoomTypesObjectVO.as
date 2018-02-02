package services.vo.backend
{
	import mx.collections.ArrayCollection;
	
	[RemoteClass(alias="MapRoomType")]
	public class RoomTypesObjectVO
	{
		/* public var oRoomQuality:RoomQualityObjectVO = new RoomQualityObjectVO();
        public var aRoomWithBedTypes:Array = new Array();
 
        public function RoomTypesConstructor(oRoomQuality:RoomQualityObjectVO, aRoomWithBedTypes:Array):void
        {
            this.oRoomQuality = oRoomQuality;
            this.aRoomWithBedTypes = aRoomWithBedTypes;
        } */
        
        public var iId:Number;
        public var iRoomQuality:Number;
        public var iBedType:Number;
        public var sShortName:String;
        public var iDescription:Number;
        public var sDescription:String;
        public var iRoomCapacity:Number;
        
         [Transient]
		public var checked:Boolean = false;  
		
		  [Transient]
		public var label:String = 'baah';  
		
		[Transient]
		public var children:Array =  []; 
        
        public var oBedType:BedTypeObjectVO;
        
        public var oRoomQuality:RoomQualityObjectVO = new RoomQualityObjectVO();
  
        public function RoomWithBedTypesConstructor(iId:int, oBedType:BedTypeObjectVO, sShortName:String, sDescription:String, iRoomCapacity:Number):void
        {
        	this.iId = iId;
            this.oBedType = oBedType;
            this.sShortName = sShortName;
            this.sDescription = sDescription;
            this.iRoomCapacity = iRoomCapacity;
        }

	}
}