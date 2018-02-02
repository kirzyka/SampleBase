package framework.utils
{
	import framework.model.AppModelLocator;
	
	import mx.collections.ArrayCollection;
	import mx.controls.*;
	
	import services.vo.items.ArrangementCodeVO;
	
	public class TransactionSplittingUtils
	{
		
		[Bindable]
		public var model:AppModelLocator = AppModelLocator.getInstance();
		
		public function TransactionSplittingUtils()
		{
		}

		public static function manageSaveBtn(cmbMergeExclusive:ComboBox, cmbMergeInclusive:ComboBox, btnSaveMerged:Button):void
		{
			if(cmbMergeExclusive.enabled || cmbMergeInclusive.enabled)
			{
				btnSaveMerged.enabled = true;
			}		
			else
			{
				btnSaveMerged.enabled = false;	
			}				
		}
		
		public static function manageSaveBtn2(chkbMergeExclusive:CheckBox, chckbMergeInclusive:CheckBox, btnSaveMerged:Button):void
		{
			if(chkbMergeExclusive.enabled || chckbMergeInclusive.enabled)
			{
				btnSaveMerged.enabled = true;
			}		
			else
			{
				btnSaveMerged.enabled = false;	
			}				
		}
		
		public static function updateMergeFieldRateState(arr:Array, code:int):int
		{
			if(arr.length == 0)
			{
				return 0;
			}
			else
			{
				return code;
			}
		}
		
		public static function selectArrgCodeById(codeList:Array, commonList:ArrayCollection):ArrayCollection
			{				
				
				var argResult:ArrayCollection = new ArrayCollection();
				var arrangementCodeVO:ArrangementCodeVO;
				for(var i:int = 0; i < codeList.length; i++)
				{
					for(var j:int = 0; j < commonList.length; j++)
					{
						arrangementCodeVO = commonList.getItemAt(j) as ArrangementCodeVO;
						if(arrangementCodeVO.lId == codeList[i])
						{
							argResult.addItem(arrangementCodeVO);
						}
					}
				}
				return argResult;
			}
		
		public static function getArrangementObjById(arr:ArrayCollection, code:int):ArrangementCodeVO
			{
				for(var i:int = 0; i < arr.length; i++)
				{
					if((arr.getItemAt(i) as ArrangementCodeVO).lId == code)
					{
						return (arr.getItemAt(i) as ArrangementCodeVO);
					}
				}
				return null;
			} 
	/*
	private function getArrangementObjById(arr:ArrayCollection, code:int):ArrangementCodeVO
			{
				for(var i:int = 0; i < arr.length; i++)
				{
					if((arr.getItemAt(i) as ArrangementCodeVO).lId == code)
					{
						return (arr.getItemAt(i) as ArrangementCodeVO);
					}
				}
				return null;
			}*/ 
	}
	
}