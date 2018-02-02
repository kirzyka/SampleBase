package framework.view.components.address.data
{
	import services.vo.common.ContactVO;
	import services.vo.profiles.CompanyContactVO;
	
	public class ContactData
	{
		public static function convert(input:Object):ContactVO
		{
			var contact:ContactVO = new ContactVO();
			
			if (input is ContactVO)
			{
				contact = input as ContactVO;
			}
			
			if (input is CompanyContactVO)
			{
				var cmpContact:CompanyContactVO = input as CompanyContactVO;
				contact = cmpContact.oMapContact;
			}
			
			return contact;
		}
		
		public static function toCompanyContact(contacts:Array, isPrimary:Boolean = false):Array
		{
			var res:Array = [];
			
			for each(var contact:ContactVO in contacts)
			{
				var cmpContact:CompanyContactVO = new CompanyContactVO();
				cmpContact.bIsPrimary = isPrimary;
				cmpContact.oMapContact = contact;
				res.push(cmpContact);
			}
			
			return res;
		}
		
		public static function toContact(contacts:Array):Array
		{
			var res:Array = [];
			
			for each(var contact:Object in contacts)
			{
				res.push(convert(contact));
			}
			
			return res;
		}
	}
}