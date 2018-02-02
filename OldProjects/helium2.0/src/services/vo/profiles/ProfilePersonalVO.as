package services.vo.profiles
{
    import mx.events.IndexChangedEvent;
    
    import services.vo.common.ContactVO;
    
    [Bindable]
    [RemoteClass(alias="MapProfilePersonal")]
    public class ProfilePersonalVO
    {
        /**
         *  This property contain id of profile.
         */
        public var lId:Number = 0;
        /**
         *  This property contain first name of person in the
         *  profile.
         */
        public var sName:String = "";
        /**
         *  This property contain last name of person in the
         *  profile.
         */
        public var sSurname:String = "";
        /**
         *  This property contain passport number.
         */
        public var sPassNumber:String;
        /**
         *  This property contain the date of the birthday.
         */
        public var dBirthDate:String;
        /**
         *  This property contain preffered room.
         */
        public var sPreferRoom:String;
        /**
         *  This property contain some notes by profile.
         */
        public var sNote:String;
        /**
         *  If this property is <code>true</code>, the person
         *  is smoker.
         */
        public var bIsSmoking:Boolean = false;
        public var smokerField:int = 0;
        /**
         *  If this property is <code>true</code>, the person
         *  is disabled.
         */
        public var bIsDisabled:Boolean = false;
        /**
         *  This property contain company name by person in the
         *  profile.
         */
        public var sCompanyName:String;
        /**
         *  This property contain id of person's company.
         *
         *  @default 0
         */
        public var lCompanyId:Number = 0;
        /**
         *  This property contain id of salutation.
         */
        public var lSalutationId:Number = 0;
        /**
         *  This property contain id of person's language.
         */
        public var lLanguageId:Number = 0;
        /**
         *  This property contain id of person's nationality.
         */
        public var lNationalityId:Number = 0;
        /**
         *  This property contain id of person's vip total.
         *
         *  @default 0
         */
        public var lVipTotalId:Number = 0;
        /**
         *  This property contain  id of person's vip hotel.
         *
         *  @default 0
         */
        public var lVipHotelId:Number = 0;
        /**
         *  This property contain updated time for profile.
         *  <p><b>Note:</b>it have to make log by changing in
         *  profile into the server side.
         */
        public var sUpdatedAt:String;
        /**
         *  This property contain person who updated profile.
         *  <p><b>Note:</b>it have to make log by changing in
         *  profile into the server side.
         */
        public var sUpdatedBy:String;
        /**
         *  This property contain list of adresses by person.
         *
         *  @default []
         */
        public var aAddresses:Array = [];
        /**
         *  This property contain all contact data by person.
         *
         *  @see framework.vo.frontend.ContactVO
         *
         *  @default []
         */
        public var aContacts: /* ContactVO */ Array = [];
        /**
         *  This property contain choosed wishes by person
         *  (by items).
         *
         *  @default []
         */
        public var aItemsWishes: /*  */ Array = [];
        /**
         *  This property contain choosed wishes by person
         *  (by room settings).
         *
         *  @default []
         */
        public var aSettingsWishes:Array = [];
        /**
         *  This property contain list of mailings.
         *
         *  @default []
         */
        public var aMailings:Array = [];
        /**
         *  This property contain
         *
         *  @default []
         */
        public var aLoyalties:Array = [];
        /**
         *  <b>Note:</b>it need for server side.
         */
        
        public var lMainId:Number = 0;
        
        public var aSettingsWishesList:Array = [];
        
        [Transient]
        public var bIsUnknown:Boolean = true;
        
        public var bIsCaller:Boolean = false;
        
        public function get email():String
        {
            if (aContacts.length != 0)
            {
                for (var i:int = 0; i < aContacts.length; i++)
                {
                    var contact:ContactVO = this.aContacts[i] as ContactVO;
                    if (contact.iContactType == ContactVO.CONTACT_WORK_EMAIL)
                    {
                        return contact.sContactData;
                    }
                }
            }
            return "";
        }
        
        public function set email(value:String):void
        {
            var emailExist:Boolean = false;
            for (var i:int = 0; i < this.aContacts.length; i++)
            {
                var contact:ContactVO = this.aContacts[i] as ContactVO;
                if (contact.iContactType == ContactVO.CONTACT_WORK_EMAIL && contact.sContactData != value)
                {
                    emailExist = true;
                    break
                }
            }
            if (emailExist == false)
            {
                var newContact:ContactVO = new ContactVO();
                newContact.iContactType = ContactVO.CONTACT_WORK_EMAIL;
                newContact.sContactData = value;
                this.aContacts[this.aContacts.length == 0 ? 0 : this.aContacts.length] = newContact;
            }
        }
        
        public function get phone():String
        {
            var _phone:String = "";
            if (this.aContacts.length != 0)
            {
                for (var i:int = 0; i < this.aContacts.length; i++)
                {
                    var contact:ContactVO = this.aContacts[i] as ContactVO;
                    if (contact.iContactType == ContactVO.CONTACT_WORK_PHONE)
                    {
                        _phone = contact.sContactData;
                        break;
                    }
                }
            }
            return _phone;
        }
        
        public function set phone(_phone:String):void
        {
            var phoneExist:Boolean = false;
            for (var i:int = 0; i < this.aContacts.length; i++)
            {
                var contact:ContactVO = this.aContacts[i] as ContactVO;
                if (contact.iContactType == ContactVO.CONTACT_WORK_PHONE)
                {
                    contact.sContactData = _phone;
                    phoneExist = true;
                    break
                }
            }
            if (phoneExist == false)
            {
                var newContact:ContactVO = new ContactVO();
                newContact.iContactType = ContactVO.CONTACT_WORK_PHONE;
                newContact.sContactData = _phone;
                this.aContacts[this.aContacts.length == 0 ? 0 : this.aContacts.length] = newContact;
            }
        }
        
        private function checkTypeOfConfirmation(type:int, contactType:int):Boolean
        {
            var isNeededType:Boolean = false;
            switch (type)
            {
                case ContactVO.CONTACT_WORK_PHONE:
                    if (contactType == 1)
                    {
                        isNeededType = true;
                    }
                    break;
                case ContactVO.CONTACT_WORK_FAX:
                    if (contactType == 2)
                    {
                        isNeededType = true;
                    }
                    break;
                case ContactVO.CONTACT_WORK_EMAIL:
                    if (contactType == 3 || contactType == 7)
                    {
                        isNeededType = true;
                    }
                    break;
            }
            return isNeededType;
        }
        
        public function getDataForConfirmation(type:int):Array
        {
            var comfirmationData:Array = new Array();
            var i:int = 0;
            if (type == ContactVO.CONTACT_WHITE_MAIL)
            {
                for (i = 0; i < this.aAddresses.length; i++)
                {
                    var address:ProfileAddressPersonalVO = this.aAddresses[i] as ProfileAddressPersonalVO;
                    comfirmationData.push(address.sFullAddress);
                }
            }
            else
            {
                for (i = 0; i < this.aContacts.length; i++)
                {
                    var contact:ContactVO = this.aContacts[i] as ContactVO;
                    if (checkTypeOfConfirmation(type, contact.iContactType))
                    {
                        comfirmationData.push(contact.sContactData);
                    }
                }
            }
            return comfirmationData;
        }
    }
}