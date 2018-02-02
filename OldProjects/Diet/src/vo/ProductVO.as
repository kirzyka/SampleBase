package vo
{
	public class ProductVO
	{
		public var categoryId:int;
		public var id:int;
		public var productName:String;
		public var score:Number = 0;
		
		public function ProductVO(categotyId:int, id:int, productName:String, score:Number)
		{
			this.categoryId = categotyId;
			this.id = id;
			this.productName = productName;
			this.score = score;
		}
	}
}