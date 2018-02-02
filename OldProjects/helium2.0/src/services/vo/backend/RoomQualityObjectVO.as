package services.vo.backend
{
	[RemoteClass(alias="MapRoomQuality")]
	[Bindable]
	public class RoomQualityObjectVO
	{
		public var lQualityId:Number;
        public var bIsUsedStandalone:Boolean;
        public var sQualityName:String;
        public var bIsSelected:Boolean = false;

        public function RoomQualityConstructor(lQualityId:Number, bIsUsedStandalone:Boolean, sQualityName:String, bIsSelected:Boolean):void
        {
            this.lQualityId = lQualityId;
            this.bIsUsedStandalone = bIsUsedStandalone;
            this.sQualityName = sQualityName;
            
            //for interface
            this.bIsSelected = bIsSelected;
        }
	}
}