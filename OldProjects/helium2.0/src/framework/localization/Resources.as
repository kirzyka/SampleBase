package framework.localization
{
    
    [Bindable]
    public class Resources
    {
        public function Resources()
        {
        }
        // --------------------------------------------------------------------- //
        // 			GLOBAL		                             
        // --------------------------------------------------------------------- //
        /* Buttons */
        public var Global_Button_Ok:String = "Ok";
        public var Global_Button_Open:String = "Open";
        public var Global_Button_Close:String = "Close";
        public var Global_Button_Cancel:String = "Cancel";
        public var Global_Button_Yes:String = "Yes";
        public var Global_Button_No:String = "No";
        public var Global_Button_Edit:String = "Edit";
        public var Global_Button_Save:String = "Save";
        public var Global_Button_Add:String = "Add";
        public var Global_Button_Delete:String = "Delete";
        public var Global_Button_Remove:String = "Remove";
        public var Global_Button_Upload:String = "Upload";
        public var Global_Button_SelectFile:String = "Select File";
        public var Global_Button_Back:String = "Back";
        public var Global_Button_Next:String = "Next";
        public var Global_Button_Prev:String = "Prev";
        public var Global_Button_Update:String = "Update";
        public var Global_Button_Apply:String = "Apply";
        
        /* Months */
        public var Global_Month_January:String = "January";
        public var Global_Month_February:String = "February";
        public var Global_Month_March:String = "March";
        public var Global_Month_April:String = "April";
        public var Global_Month_May:String = "May";
        public var Global_Month_June:String = "June";
        public var Global_Month_July:String = "July";
        public var Global_Month_August:String = "August";
        public var Global_Month_September:String = "September";
        public var Global_Month_October:String = "October";
        public var Global_Month_November:String = "November";
        public var Global_Month_December:String = "December";
        
        /*	Days */
        public var Global_Day_Sunday:String = "Sun";
        public var Global_Day_Monday:String = "Mon";
        public var Global_Day_Tuesday:String = "Tue";
        public var Global_Day_Wednesday:String = "Wed";
        public var Global_Day_Thursday:String = "Thu";
        public var Global_Day_Friday:String = "Fri";
        public var Global_Day_Saturday:String = "Sat";
        
        /*	Currency */
        public var Global_CurrencyEuroLong:String = "euro";
        public var Global_CurrencyEuroShort:String = "EUR";
        
        /* Address */
        public var Global_Address_AddressLine1:String = "Address Line 1";
        public var Global_Address_AddressLine1_Description:String = "Street address, P.O. box, company name, c/o";
        public var Global_Address_AddressLine2:String = "Address Line 2";
        public var Global_Address_AddressLine2_Description:String = "Apartement, suite, unit, building, floor, etc.";
        public var Global_Address_ZipCode:String = "Zip/Postal Code";
        public var Global_Address_Country:String = "Country";
        public var Global_Address_Region:String = "State/Province/Region";
        public var Global_Address_City:String = "City";
        
        /*	Personal Information	*/
        public var Global_PersonalInformation_FirstName:String = "First Name";
        public var Global_PersonalInformation_LastName:String = "Name";
        public var Global_PersonalInformation_Salutation:String = "Salutation";
        public var Global_PersonalInformation_Language:String = "Language";
        public var Global_PersonalInformation_Nationality:String = "Nationality";
        public var Global_PersonalInformation_Telephone:String = "Telephone";
        public var Global_PersonalInformation_Mobile:String = "Mobile";
        public var Global_PersonalInformation_Fax:String = "Fax";
        public var Global_PersonalInformation_Email:String = "E-mail";
        
        /*	Dialogs	*/
        public var Global_Dialogs_Delete:String = "Delete?";
        
        
        public var Global_Total:String = "Total";
        public var Global_VAT:String = "vat";
        
        // --------------------------------------------------------------------- //
        //			Business Day		                             
        // --------------------------------------------------------------------- //
        public var BusinessDay_List_Title:String = "Cash Shift";
        public var BusinessDay_List_Label_OpenBDC:String = "Currently open:";
        public var BusinessDay_List_Label_TotalCredit:String = "Total:";
        
        public var BusinessDay_List_ButtonBar_PrintReport:String = "Print Report";
        public var BusinessDay_List_ButtonBar_CloseBusinessDay:String = "Close Business Day";
        
        public var BusinessDay_List_Columns_Status:String = "Status";
        public var BusinessDay_List_Columns_Room:String = "Room";
        public var BusinessDay_List_Columns_Name:String = "Name";
        public var BusinessDay_List_Columns_ArrDate:String = "Arr.Date";
        public var BusinessDay_List_Columns_DepDate:String = "Dep.date";
        public var BusinessDay_List_Columns_Company:String = "Company";
        public var BusinessDay_List_Columns_Phone:String = "Phone";
        public var BusinessDay_List_Columns_Email:String = "Email";
        public var BusinessDay_List_Columns_Balance:String = "Balance";
        
        public var BusinessDay_List_Reports_All:String = "Select all";
        public var BusinessDay_List_Reports_Rbtc:String = "Revenue by transaction codes";
        public var BusinessDay_List_Reports_Obih:String = "Open balances in house";
        public var BusinessDay_List_Reports_Jd:String = "Journal debit";
        
        public var BusinessDay_List_Reports_Jcc:String = "Journal Credit cards";
        public var BusinessDay_List_Reports_Cs:String = "Cashier summary";
        public var BusinessDay_List_Reports_Cotd:String = "Corrections of the day";
        public var BusinessDay_List_Reports_Mr:String = "Manager report";
        
        public var BusinessDay_List_Reports_Ar:String = "Accounts receivable";
        public var BusinessDay_List_Reports_Ns:String = "No Shows";
        public var BusinessDay_List_Reports_Potd:String = "Payments of the day";
        public var BusinessDay_List_Reports_Yo:String = "Yearly overview";
        
        public var BusinessDay_List_Reports_Arl:String = "A/R List";
        public var BusinessDay_List_Reports_Al:String = "Arrival list";
        
        public var BusinessDay_List_Buttons_OpenShift_Label:String = "Open Shift";
        public var BusinessDay_List_Buttons_OpenShift_Tooltip:String = "Open Shift";
        public var BusinessDay_List_Buttons_BusinessDay_Label:String = "Open Business Day";
        public var BusinessDay_List_Buttons_BusinessDay_Tooltip:String = "We don't open new shift (first) in new day without open business day.";
        
        // --------------------------------------------------------------------- //
        //			Cash Shift		                             
        // --------------------------------------------------------------------- //
        public var CashShift_List_Title:String = "Cash Shift";
        public var CashShift_List_Label_LastOpenShift:String = "Last open shift:";
        public var CashShift_List_Label_TotalCredit:String = "Total:";
        
        public var CashShift_List_ButtonBar_BusinessDay:String = "Business Day:";
        public var CashShift_List_ButtonBar_Shift:String = "Shift:";
        public var CashShift_List_ButtonBar_ShowPaymentsDetails:String = "Show Payments Details";
        public var CashShift_List_ButtonBar_PrintReport:String = "Print Report";
        public var CashShift_List_ButtonBar_CloseShift:String = "Close Shift";
        public var CashShift_List_ButtonBar_ReopenShift:String = "Reopen Shift";
        
        public var CashShift_List_Columns_Time:String = "Time";
        public var CashShift_List_Columns_PaymentType:String = "PaymentType";
        public var CashShift_List_Columns_GuestName:String = "GuestName";
        public var CashShift_List_Columns_RoomNumber:String = "RoomNumber";
        public var CashShift_List_Columns_CashShift:String = "CashShift";
        public var CashShift_List_Columns_Status:String = "Status";
        public var CashShift_List_Columns_User:String = "User";
        public var CashShift_List_Columns_Credit:String = "Credit";
        
        public var CashShift_List_Buttons_OpenShift_Label:String = "Open Shift";
        public var CashShift_List_Buttons_OpenShift_Tooltip:String = "Open Shift";
        public var CashShift_List_Buttons_BusinessDay_Label:String = "Open Business Day";
        public var CashShift_List_Buttons_BusinessDay_Tooltip:String = "We don't open new shift (first) in new day without open business day.";
        
        // --------------------------------------------------------------------- //
        //			Check In		                             
        // --------------------------------------------------------------------- //		
        
        // --------------------------------------------------------------------- //
        //			Check Out		                             
        // --------------------------------------------------------------------- //		
        
        public var CheckOut_Buttons_AttachToAccount:String = "Attach to Account";
        public var CheckOut_Buttons_RemoveFromAccount:String = "Remove from Account";
        public var CheckOut_Buttons_Merge:String = "Merge";
        public var CheckOut_Buttons_Adjust:String = "Adjust";
        public var CheckOut_Buttons_Split:String = "Split";
        public var CheckOut_Buttons_PrintActualReport:String = "Print Actual Report";
        public var CheckOut_Buttons_PrintInvoice:String = "Print Invoice";
        public var CheckOut_Buttons_Pay:String = "PAY";
        public var CheckOut_Buttons_AddTransaction:String = "Add Transaction";
        public var CheckOut_Buttons_AddPayment:String = "Add Payment";
        public var CheckOut_Buttons_AcceptPayment:String = "Accept Payment";
        public var CheckOut_Buttons_Back:String = "Back";
        
        public var CheckOut_Columns_Date:String = "Date";
        public var CheckOut_Columns_Code:String = "Code";
        public var CheckOut_Columns_TransactionName:String = "Transaction Name";
        public var CheckOut_Columns_Price:String = "Price, euro";
        public var CheckOut_Columns_AdjustmentReason:String = "Adjustment Reason";
        
        public var CheckOut_ReservationSummary_Title:String = "Reservation Summary";
        public var CheckOut_ReservationSummary_GuestName:String = "Guest Name";
        public var CheckOut_ReservationSummary_Company:String = "Company";
        public var CheckOut_ReservationSummary_TravelAgency:String = "Travel Agency";
        public var CheckOut_ReservationSummary_RoomNumber:String = "Room Number";
        public var CheckOut_ReservationSummary_Adults:String = "Adults";
        public var CheckOut_ReservationSummary_ChildrenAbove:String = "Children &lt; ";
        public var CheckOut_ReservationSummary_ChildrenMiddle:String = "Children &lt; ";
        public var CheckOut_ReservationSummary_ChildrenBefore:String = "Children > ";
        public var CheckOut_ReservationSummary_RoomType:String = "Room Type";
        public var CheckOut_ReservationSummary_ArrivalDate:String = "Arrival Date";
        public var CheckOut_ReservationSummary_DepartureDate:String = "Departure Date";
        public var CheckOut_ReservationSummary_Rate:String = "Rate";
        public var CheckOut_ReservationSummary_RatePrice:String = "Rate Price";
        
        public var CheckOut_Popups_AddTransaction_Title:String = "Add Transaction";
        public var CheckOut_Popups_AddTransaction_SearchBox_Group:String = "Group";
        public var CheckOut_Popups_AddTransaction_SearchBox_Transaction:String = "Transaction Name or Code";
        public var CheckOut_Popups_AddTransaction_Columns_Transaction:String = "Transaction/Article";
        public var CheckOut_Popups_AddTransaction_Columns_Code:String = "Code";
        public var CheckOut_Popups_AddTransaction_Columns_Price:String = "Price, euro";
        public var CheckOut_Popups_AddTransaction_Columns_VAT:String = "VAT";
        public var CheckOut_Popups_AddTransaction_Columns_Arregement:String = "Arrangement codes";
        
        public var CheckOut_Popups_SplitItems_Title:String = "Split Transaction";
        public var CheckOut_Popups_SplitItems_Code:String = "Code";
        public var CheckOut_Popups_SplitItems_Name:String = "Name";
        public var CheckOut_Popups_SplitItems_Price:String = "Price";
        public var CheckOut_Popups_SplitItems_Amount:String = "Amount";
        public var CheckOut_Popups_SplitItems_Percentage:String = "Percentage";
        
        public var CheckOut_Popups_AdjustItem_Title:String = "Adjust Transaction";
        public var CheckOut_Popups_AdjustItem_Code:String = "Code";
        public var CheckOut_Popups_AdjustItem_Name:String = "Name";
        public var CheckOut_Popups_AdjustItem_Price:String = "Price";
        public var CheckOut_Popups_AdjustItem_Amount:String = "Amount";
        public var CheckOut_Popups_AdjustItem_Percentage:String = "Percentage";
        public var CheckOut_Popups_AdjustItem_Reason:String = "Reason";
        
        public var CheckOut_Popups_DeleteAttachedItems_Title:String = "Remove Transactions from Account?";
        public var CheckOut_Popups_DeleteAttachedItems_Description:String = "Are you sure you want to remove selected transactions from account?";
        
        public var CheckOut_PaymentChooser_PaymentType:String = "Payment Type";
        public var CheckOut_PaymentChooser_CreditCardType:String = "Credit Card Type";
        public var CheckOut_PaymentChooser_CreditCardNumber:String = "Credit Card Number";
        public var CheckOut_PaymentChooser_ExpirationDate:String = "Expiration Date";
        public var CheckOut_PaymentChooser_CreditCardOf:String = "Credit Card of";
        public var CheckOut_PaymentChooser_Amount:String = "Amount";
        
        public var CheckOut_Payment_Buttons_AddPayment:String = "Add Payment";
        public var CheckOut_Payment_Buttons_AcceptPayment:String = "Accept Payment";
        public var CheckOut_Payment_Buttons_PrintInvoice:String = "Print Invoice";
        public var CheckOut_Payment_Buttons_PrintActualReport:String = "Print Actual Report";
        public var CheckOut_Payment_Buttons_Split:String = "Split";
        
        
        public var CheckOut_Payment_DebitorPayments_Title:String = "Debitor Payments";
        public var CheckOut_Payment_DebitorPayments_InvoiceAmount:String = "Invoice Amount";
        public var CheckOut_Payment_DebitorPayments_TotalAmountVAT:String = "Total Amount incl. VAT";
        public var CheckOut_Payment_DebitorPayments_TotalAmountNet:String = "Total Amount Net";
        public var CheckOut_Payment_DebitorPayments_Vat:String = "VAT";
        public var CheckOut_Payment_DebitorPayments_TotalNetVAT:String = "Total Net";
        
        public var CheckOut_Payment_OtherPayment_Title:String = "Other Payments";
        public var CheckOut_Payment_OtherPayment_PaymentType:String = "Payment Type";
        public var CheckOut_Payment_OtherPayment_CreditCardType:String = "Credit Card Type";
        public var CheckOut_Payment_OtherPayment_CreditCardNumber:String = "Credit Card Number";
        public var CheckOut_Payment_OtherPayment_ExpirationDate:String = "Expiration Date";
        public var CheckOut_Payment_OtherPayment_CreditCardOf:String = "Credit Card of";
        public var CheckOut_Payment_OtherPayment_Amount:String = "Amount";
        
        public var CheckOut_Payment_Columns_Date:String = "Date";
        public var CheckOut_Payment_Columns_Description:String = "Description";
        public var CheckOut_Payment_Columns_Debit:String = "Debit";
        public var CheckOut_Payment_Columns_Credit:String = "Credit";
        
        
        // --------------------------------------------------------------------- //
        //			Children Groups		                             
        // --------------------------------------------------------------------- //		
        
        // --------------------------------------------------------------------- //
        //			Daily Overview		                             
        // --------------------------------------------------------------------- //		
        
        // --------------------------------------------------------------------- //
        //			Dashboard		                             
        // --------------------------------------------------------------------- //	
        
        // --------------------------------------------------------------------- //
        //			Group Preparing		                             
        // --------------------------------------------------------------------- //
        
        // --------------------------------------------------------------------- //
        //			Hotels		                             
        // --------------------------------------------------------------------- //
        
        // --------------------------------------------------------------------- //
        //			In House		                             
        // --------------------------------------------------------------------- //
        
        public var InHouse_Popups_Messages_Title:String = "Messages";
        public var InHouse_Popups_Messages_View:String = "Message body";
        public var InHouse_Popups_Messages_From:String = "From";
        public var InHouse_Popups_Messages_Body:String = "Message";
        public var InHouse_Popups_Messages_CreationTime:String = "Creation Time";
        public var InHouse_Popups_Messages_DeliverTime:String = "Deviler Time";
        
        public var InHouse_Popups_RoomAvailable_Title:String = " - Rooms Available";
        public var InHouse_Popups_RoomAvailable_Smoker:String = "Smoker";
        public var InHouse_Popups_RoomAvailable_NonSmoker:String = "Non smoker";
        public var InHouse_Popups_RoomAvailable_Internet:String = "Internet";
        public var InHouse_Popups_RoomAvailable_NextToElevator:String = "Next To Elevator";
        public var InHouse_Popups_RoomAvailable_Floor:String = "Floor";
        public var InHouse_Popups_RoomAvailable_Buttons_filter:String = "Filter";
        public var InHouse_Popups_RoomAvailable_Buttons_assign:String = "Assign";
        
        public var InHouse_Popups_RoomAvailable_Columns_Room:String = "Room";
        public var InHouse_Popups_RoomAvailable_Columns_RoomType:String = "Room type";
        public var InHouse_Popups_RoomAvailable_Columns_Setting:String = "Setting";
        public var InHouse_Popups_RoomAvailable_Columns_Status:String = "Status";
        public var InHouse_Popups_RoomAvailable_Columns_GuestName:String = "Guest name";
        public var InHouse_Popups_RoomAvailable_Columns_NightsAvailable:String = "Nights available";
        
        public var InHouse_Column_RoomNumber:String = "Room Number";
        public var InHouse_Column_GuestName:String = "Guest Name";
        public var InHouse_Column_ArrivalDate:String = "Arrival Date";
        public var InHouse_Column_DepartureDate:String = "Departure Date";
        public var InHouse_Column_Company:String = "Company";
        public var InHouse_Column_TravelAgency:String = "Travel Agency";
        public var InHouse_Column_Group:String = "Group";
        public var InHouse_Column_Message:String = "Message";
        
        // --------------------------------------------------------------------- //
        //			Invoice Managment		                             
        // --------------------------------------------------------------------- //		
        
        // --------------------------------------------------------------------- //
        //			Items		                             
        // --------------------------------------------------------------------- //
        /* Arrangements */
        public var Items_Arrangements_SearchBox_Codes:String = "Search for Arrangement Codes";
        
        public var Items_Arrangements_Columns_Code:String = "Code";
        public var Items_Arrangements_Columns_Description:String = "Description";
        
        public var Items_Arrangements_Popups_Save_Add:String = "Add Code";
        public var Items_Arrangements_Popups_Save_Edit:String = "Edit Code";
        public var Items_Arrangements_Popups_Save_LabelCode:String = "Code";
        public var Items_Arrangements_Popups_Save_LabelDescription:String = "Description";
        
        public var Items_Arrangements_Popups_Delete_Title:String = "Delete Code";
        public var Items_Arrangements_Popups_Delete_Description:String = "Are you sure to delete selected code?";
        
        /* Groups */
        public var Items_Groups_SystemPanel_Title:String = "System";
        public var Items_Groups_Popups_AddGroup_Main:String = "Add Main Group";
        public var Items_Groups_Popups_AddGroup_Sub:String = "Add Sub Group";
        public var Items_Groups_Popups_AddGroup_MainGroup_Name:String = "Group Name";
        public var Items_Groups_Popups_AddGroup_SubGroup_Name:String = "Sub Group Name";
        
        public var Items_Groups_Popups_EditGroup_Main:String = "Edit Main Group";
        public var Items_Groups_Popups_EditGroup_Sub:String = "Edit Sub Group";
        public var Items_Groups_Popups_EditGroup_MainGroup:String = "Main Group";
        public var Items_Groups_Popups_EditGroup_SubGroup:String = "Sub Group";
        
        public var Items_Groups_Popups_DeleteMainGroup_Title:String = "Delete Main Group";
        public var Items_Groups_Popups_DeleteMainGroup_Description:String = "Are you sure to delete selected Main Group?";
        public var Items_Groups_Popups_DeleteMainGroup_SubDescription:String = "All sub groups and transactions linked to them will also be deleted.";
        
        public var Items_Groups_Popups_DeleteSubGroup_Title:String = "Delete Sub Group";
        public var Items_Groups_Popups_DeleteSubGroup_Description:String = "Are you sure to delete selected Sub Group?";
        public var Items_Groups_Popups_DeleteSubGroup_SubDescription:String = "All transactions linked to Sub Group will also be deleted.";
        
        /* Managment */
        public var Items_Managment_SearchBox_Group:String = "Group";
        public var Items_Managment_SearchBox_Transaction:String = "Transaction Name or Code";
        
        public var Items_Managment_Columns_Transaction:String = "Transaction/Article";
        public var Items_Managment_Columns_Code:String = "Code";
        public var Items_Managment_Columns_Price:String = "Price";
        public var Items_Managment_Columns_VAT:String = "VAT";
        public var Items_Managment_Columns_Arregement:String = "Arrangement codes";
        
        public var Items_Managment_Buttons_EditVATPeriods:String = "VAT periods";
        public var Items_Managment_Buttons_EditVATCreate:String = "Create";
        
        public var Items_Managment_Popups_Save_Add:String = "Add Transaction|Article";
        public var Items_Managment_Popups_Save_Edit:String = "Edit Transaction|Article";
        public var Items_Managment_Popups_Save_Group:String = "Group";
        public var Items_Managment_Popups_Save_Subgroup:String = "Sub Group";
        public var Items_Managment_Popups_Save_RbTransaction:String = "Transaction";
        public var Items_Managment_Popups_Save_RbArticle:String = "Article";
        public var Items_Managment_Popups_Save_Name:String = "Name";
        public var Items_Managment_Popups_Save_Code:String = "Code";
        public var Items_Managment_Popups_Save_Price:String = "Price";
        public var Items_Managment_Popups_Save_Vat:String = "Default VAT";
        public var Items_Managment_Popups_Save_Type:String = "Transaction type:";
        public var Items_Managment_Popups_Save_ArrangementCodes:String = "Arrangement Codes";
        
        public var Items_Managment_Popups_EditVATPeriods_Title:String = "Edit VAT periods";
        public var Items_Managment_Popups_EditVATPeriods_No:String = "No";
        public var Items_Managment_Popups_EditVATPeriods_Start:String = "Start";
        public var Items_Managment_Popups_EditVATPeriods_End:String = "End";
        public var Items_Managment_Popups_EditVATPeriods_VAT:String = "VAT";
        
        public var Items_Managment_Popups_DeleteArticle_Title:String = "Delete Article";
        public var Items_Managment_Popups_DeleteArticle_Description:String = "Are you sure to delete selected Article?";
        
        public var Items_Managment_Popups_DeleteTransaction_Title:String = "Delete Transaction";
        public var Items_Managment_Popups_DeleteTransaction_Description:String = "Are you sure to delete selected Transaction?";
        
        // --------------------------------------------------------------------- //
        //			Loader		                             
        // --------------------------------------------------------------------- //	
        
        // --------------------------------------------------------------------- //
        //			Login		                             
        // --------------------------------------------------------------------- //
        
        public var Login_LoginWindow_Title:String = "Login Form";
        public var Login_LoginWindow_UserNameLabel:String = "Login";
        public var Login_LoginWindow_PasswordLabel:String = "Password";
        public var Login_LoginWindow_LoginButton:String = "Sign In";
        public var Login_LoginWindow_Workspace_Title:String = "Workspace";
        public var Login_LoginWindow_Workspace_Frontend:String = "Frontend";
        public var Login_LoginWindow_Workspace_Backend:String = "Backend";
        public var Login_LoginWindow_SignIn:String = "Sign In";
        public var Login_LoginWindow_ForgotPassword:String = "I forgot my password";
        public var Login_LoginWindow_Hotel:String = "Hotel";
        
        public var Login_FirstTimeLogin_Title:String = "First Login";
        public var Login_FirstTimeLogin_HeaderLabel:String = "This is the first time you log in to the system.";
        public var Login_FirstTimeLogin_Login:String = "Login";
        public var Login_FirstTimeLogin_Password:String = "Password";
        public var Login_FirstTimeLogin_ConfirmPassword:String = "Confirm password";
        public var Login_FirstTimeLogin_Minimum:String = "minimum ";
        public var Login_FirstTimeLogin_Symbols:String = " symbols";
        
        public var Login_FirstTimeLogin_ForgotPasswordQuestion:String = "Forgot password question";
        public var Login_FirstTimeLogin_Answer:String = "Answer";
        public var Login_FirstTimeLogin_Name:String = "First Name";
        public var Login_FirstTimeLogin_Surname:String = "Name";
        public var Login_FirstTimeLogin_Email:String = "Email";
        public var Login_FirstTimeLogin_DirectPhone:String = "Direct phone";
        public var Login_FirstTimeLogin_Extension:String = "Extension";
        public var Login_FirstTimeLogin_Position:String = "Position in primary Hotel";
        public var Login_FirstTimeLogin_HiringDate:String = "Hiring date";
        public var Login_FirstTimeLogin_PrimaryHotel:String = "Primary Hotel";
        public var Login_FirstTimeLogin_SecondaryHotels:String = "Secondary Hotels";
        
        public var Login_FirstTimeLogin_Messages_PasswordIncorrect:String = "Password incorrect!";
        
        
        // --------------------------------------------------------------------- //
        //			Miscellaneous		                             
        // --------------------------------------------------------------------- //
        
        // --------------------------------------------------------------------- //
        //			Profiles		                             
        // --------------------------------------------------------------------- //	
        /* Common */
        public var Profiles_Callers_Title:String = "Callers";
        public var Profiles_Callers_Selected:String = "Selected";
        public var Profiles_Callers_Columns_FirstName:String = "First Name";
        public var Profiles_Callers_Columns_LastName:String = "Name";
        public var Profiles_Callers_Columns_Language:String = "Lang.";
        public var Profiles_Callers_Columns_Phone:String = "Phone";
        public var Profiles_Callers_Columns_Email:String = "Email";
        public var Profiles_Callers_Buttons_AddNewCaller:String = "Add New Caller";
        public var Profiles_Callers_Buttons_SetAsPrimary:String = "Set As Primary";
        public var Profiles_Callers_Frames_CallerInfo_Title:String = "Caller Information";
        
        public var Profiles_SecondaryBillingAddresses_Title:String = "Secondary and Billing Addresses";
        public var Profiles_SecondaryBillingAddresses_AddressType_Label:String = "Address Type";
        public var Profiles_SecondaryBillingAddresses_AddressType_Secondary:String = "Secondary";
        public var Profiles_SecondaryBillingAddresses_AddressType_Billing:String = "Billing";
        
        /* Individual */
        public var Profiles_Individual_Title:String = "Individual";
        
        public var Profiles_Individual_SearchBox_LastName:String = "Name";
        
        public var Profiles_Individual_Columns_LastName:String = "Name";
        public var Profiles_Individual_Columns_FirstName:String = "First Name";
        public var Profiles_Individual_Columns_Company:String = "Company";
        public var Profiles_Individual_Columns_Phone:String = "Phone";
        public var Profiles_Individual_Columns_Email:String = "Email";
        
        public var Profiles_Individual_Popups_Update_Title:String = "Individual Profile";
        
        public var Profiles_Individual_Popups_Update_Profile_Title:String = "Profile";
        public var Profiles_Individual_Popups_Update_Profile_Personal_Title:String = "Personal Information";
        public var Profiles_Individual_Popups_Update_Profile_Personal_LastName:String = "Name";
        public var Profiles_Individual_Popups_Update_Profile_Personal_FirstName:String = "First Name";
        public var Profiles_Individual_Popups_Update_Profile_Personal_Salutation:String = "Salutation";
        public var Profiles_Individual_Popups_Update_Profile_Personal_Language:String = "Language";
        public var Profiles_Individual_Popups_Update_Profile_Personal_Birthday:String = "Birthday";
        public var Profiles_Individual_Popups_Update_Profile_Personal_Nationality:String = "Nationality";
        public var Profiles_Individual_Popups_Update_Profile_Personal_Passport:String = "Passport Number";
        
        public var Profiles_Individual_Popups_Update_Profile_HomeAddress_Title:String = "Home Address";
        public var Profiles_Individual_Popups_Update_Profile_HomeAddress_AddressLine1_Description:String = "Street address, P.O. box, company name, c/o";
        public var Profiles_Individual_Popups_Update_Profile_HomeAddress_AddressLine1:String = "Address Line 1";
        public var Profiles_Individual_Popups_Update_Profile_HomeAddress_AddressLine2_Description:String = "Apartement, suite, unit, building, floor, etc.";
        public var Profiles_Individual_Popups_Update_Profile_HomeAddress_AddressLine2:String = "Address Line 2";
        public var Profiles_Individual_Popups_Update_Profile_HomeAddress_ZipCode:String = "Zip/Postal Code";
        public var Profiles_Individual_Popups_Update_Profile_HomeAddress_Country:String = "Country";
        public var Profiles_Individual_Popups_Update_Profile_HomeAddress_Region:String = "State/Province/Region";
        public var Profiles_Individual_Popups_Update_Profile_HomeAddress_City:String = "City";
        public var Profiles_Individual_Popups_Update_Profile_HomeAddress_Telephone:String = "Telephone";
        public var Profiles_Individual_Popups_Update_Profile_HomeAddress_Mobile:String = "Mobile";
        public var Profiles_Individual_Popups_Update_Profile_HomeAddress_Fax:String = "Fax";
        public var Profiles_Individual_Popups_Update_Profile_HomeAddress_Email:String = "E-mail";
        
        public var Profiles_Individual_Popups_Update_Profile_Additional_Title:String = "Additional Information";
        public var Profiles_Individual_Popups_Update_Profile_Additional_Vip1:String = "VIP1";
        public var Profiles_Individual_Popups_Update_Profile_Additional_Vip2:String = "VIP2";
        public var Profiles_Individual_Popups_Update_Profile_Additional_Smoker:String = "Smoker";
        public var Profiles_Individual_Popups_Update_Profile_Additional_Disabled:String = "Disabled";
        public var Profiles_Individual_Popups_Update_Profile_Additional_PreferredRoom:String = "Preferred Room";
        public var Profiles_Individual_Popups_Update_Profile_Additional_BonusProgram:String = "Bonus Program";
        public var Profiles_Individual_Popups_Update_Profile_Additional_Wishes:String = "Special Wishes";
        public var Profiles_Individual_Popups_Update_Profile_Additional_MailingActions:String = "Mailing Actions";
        public var Profiles_Individual_Popups_Update_Profile_Additional_Notes:String = "Notes";
        
        public var Profiles_Individual_Popups_Update_Profile_Relationships_Title:String = "Relationships";
        public var Profiles_Individual_Popups_Update_Profile_Relationships_Company:String = "Company/TA";
        
        public var Profiles_Individual_Popups_Update_Log_Title:String = "Log";
        
        public var Profiles_Individual_Popups_Delete_Title:String = "Delete Profile";
        public var Profiles_Individual_Popups_Delete_Description:String = "Are you sure to delete selected Profile?";
        
        public var Profiles_Individual_Buttons_Profiles:String = "Profile...";
        public var Profiles_Individual_Buttons_SaveProfile:String = "Save Profile";
        
        /* Company */
        public var Profiles_Company_Title:String = "Company";
        public var Profiles_Company_SearchBox_CompanyName:String = "Search by Company Name";
        
        public var Profiles_Company_Columns_CompanyName:String = "Company Name";
        public var Profiles_Company_Columns_City:String = "City";
        public var Profiles_Company_Columns_Country:String = "Country";
        public var Profiles_Company_Columns_Phone:String = "Phone";
        public var Profiles_Company_Columns_Email:String = "Email";
        
        public var Profiles_Company_Popups_Update_CompanyInfo_Title:String = "Company Information";
        public var Profiles_Company_Popups_Update_CompanyInfo_CompanyName:String = "Company Name";
        public var Profiles_Company_Popups_Update_CompanyInfo_Language:String = "Language";
        public var Profiles_Company_Popups_Update_CompanyInfo_CorporateId:String = "Corporate ID";
        public var Profiles_Company_Popups_Update_CompanyInfo_BookingCode:String = "Booking Code";
        public var Profiles_Company_Popups_Update_CompanyInfo_SourceCode:String = "Source Code";
        public var Profiles_Company_Popups_Update_CompanyInfo_IndustryCode:String = "Market Code";
        public var Profiles_Company_Popups_Update_CompanyInfo_PrimaryAddress_Title:String = "Primary Address";
        
        public var Profiles_Company_Popups_Delete_Title:String = "Delete Company Profile";
        public var Profiles_Company_Popups_Delete_Description:String = "Are you sure to delete selected Company Profile?";
        
        public var Profiles_Company_Popups_Choose_Title:String = "Choose company";
        
        /* Travel Agency */
        public var Profiles_TravelAgency_Title:String = "Travel Agency";
        public var Profiles_TravelAgency_SearchBox_TravelAgencyName:String = "Search by Travel Agency Name";
        
        public var Profiles_TravelAgency_Columns_TravelAgentName:String = "Travel Agent Name";
        public var Profiles_TravelAgency_Columns_City:String = "City";
        public var Profiles_TravelAgency_Columns_Country:String = "Country";
        public var Profiles_TravelAgency_Columns_Phone:String = "Phone";
        public var Profiles_TravelAgency_Columns_Email:String = "Email";
        
        public var Profiles_TravelAgency_Popups_Update_Title:String = "Individual Profile";
        public var Profiles_TravelAgency_Popups_Update_Profile_Title:String = "Profile";
        public var Profiles_TravelAgency_Popups_Update_Profile_Personal_Title:String = "Personal Information";
        public var Profiles_TravelAgency_Popups_Update_Profile_Personal_LastName:String = "Name";
        public var Profiles_TravelAgency_Popups_Update_Profile_Personal_FirstName:String = "First Name";
        public var Profiles_TravelAgency_Popups_Update_Profile_Personal_Salutation:String = "Salutation";
        public var Profiles_TravelAgency_Popups_Update_Profile_Personal_Language:String = "Language";
        public var Profiles_TravelAgency_Popups_Update_Profile_Personal_Birthday:String = "Birthday";
        public var Profiles_TravelAgency_Popups_Update_Profile_Personal_Nationality:String = "Nationality";
        public var Profiles_TravelAgency_Popups_Update_Profile_Personal_Passport:String = "Passport Number";
        
        public var Profiles_TravelAgency_Popups_Update_Profile_HomeAddress_Title:String = "Home Address";
        public var Profiles_TravelAgency_Popups_Update_Profile_HomeAddress_AddressLine1_Description:String = "Street address, P.O. box, company name, c/o";
        public var Profiles_TravelAgency_Popups_Update_Profile_HomeAddress_AddressLine1:String = "Address Line 1";
        public var Profiles_TravelAgency_Popups_Update_Profile_HomeAddress_AddressLine2_Description:String = "Apartement, suite, unit, building, floor, etc.";
        public var Profiles_TravelAgency_Popups_Update_Profile_HomeAddress_AddressLine2:String = "Address Line 2";
        public var Profiles_TravelAgency_Popups_Update_Profile_HomeAddress_ZipCode:String = "Zip/Postal Code";
        public var Profiles_TravelAgency_Popups_Update_Profile_HomeAddress_Country:String = "Country";
        public var Profiles_TravelAgency_Popups_Update_Profile_HomeAddress_Region:String = "State/Province/Region";
        public var Profiles_TravelAgency_Popups_Update_Profile_HomeAddress_City:String = "City";
        public var Profiles_TravelAgency_Popups_Update_Profile_HomeAddress_Telephone:String = "Telephone";
        public var Profiles_TravelAgency_Popups_Update_Profile_HomeAddress_Fax:String = "Fax";
        public var Profiles_TravelAgency_Popups_Update_Profile_HomeAddress_Email:String = "E-mail";
        
        public var Profiles_TravelAgency_Popups_Update_Profile_Additional_Title:String = "Additional Information";
        public var Profiles_TravelAgency_Popups_Update_Profile_Additional_Vip1:String = "VIP1";
        public var Profiles_TravelAgency_Popups_Update_Profile_Additional_Vip2:String = "VIP2";
        public var Profiles_TravelAgency_Popups_Update_Profile_Additional_Smoker:String = "Smoker";
        public var Profiles_TravelAgency_Popups_Update_Profile_Additional_Disabled:String = "Disabled";
        public var Profiles_TravelAgency_Popups_Update_Profile_Additional_PreferredRoom:String = "Preferred Room";
        public var Profiles_TravelAgency_Popups_Update_Profile_Additional_BonusProgram:String = "Bonus Program";
        public var Profiles_TravelAgency_Popups_Update_Profile_Additional_Wishes:String = "Special Wishes";
        public var Profiles_TravelAgency_Popups_Update_Profile_Additional_MailingActions:String = "Mailing Actions";
        public var Profiles_TravelAgency_Popups_Update_Profile_Additional_Notes:String = "Notes";
        
        public var Profiles_TravelAgency_Popups_Update_Profile_Relationships_Title:String = "Relationships";
        public var Profiles_TravelAgency_Popups_Update_Profile_Relationships_Company:String = "Company";
        
        public var Profiles_TravelAgency_Popups_Update_Log_Title:String = "Log";
        
        public var Profiles_TravelAgency_Popups_Delete_Title:String = "Delete Travel Agency";
        public var Profiles_TravelAgency_Popups_Delete_Description:String = "Are you sure to delete selected Travel Agency?";
        
        public var Profiles_TravelAgency_Buttons_Profiles:String = "Profile...";
        public var Profiles_TravelAgency_Buttons_SaveProfile:String = "Save Profile";
        
        // --------------------------------------------------------------------- //
        //			Rates		                             
        // --------------------------------------------------------------------- //	
        
        /* Bar	*/
        public var Rates_Bar_PricesForm_Title:String = "Prices";
        public var Rates_Bar_PricesForm_OneAdult:String = "One Adult:";
        public var Rates_Bar_PricesForm_TwoAdults:String = "Two Adults:";
        public var Rates_Bar_PricesForm_ExtraAdultMarkup:String = "Extra Adult:";
        public var Rates_Bar_PricesForm_LabelMarkup:String = "Markup";
        public var Rates_Bar_PricesForm_ThreeAdults:String = "Three Adults:";
        public var Rates_Bar_PricesForm_Children:String = "Children < ";
        public var Rates_Bar_PricesForm_PriceType:String = "Price Type";
        public var Rates_Bar_PricesForm_PaymentType:String = "Payment Type";
        public var Rates_Bar_PricesForm_Absolute:String = "Absolute";
        public var Rates_Bar_PricesForm_PercentFromBar:String = "% from BAR";
        public var Rates_Bar_PricesForm_PerNight:String = "per Night";
        public var Rates_Bar_PricesForm_PerStay:String = "per Stay";
        public var Rates_Bar_PricesForm_Euro:String = "euro";
        
        /*	Company Rates	*/
        public var Rates_CompanyRates_TransactionWindow_Title:String = "Transaction Name:";
        public var Rates_CompanyRates_AddTransaction_Included:String = "Included to logis";
        public var Rates_CompanyRates_transaction_splitting_Merge_Head:String = "Merge transactions";
        public var Rates_CompanyRates_transaction_splitting_Merge_Inclusive:String = "Merge inclusive by arrangement code:";
        public var Rates_CompanyRates_transaction_splitting_Merge_NonInclusive:String = "Merge non-inclusive by arrangement code:";
        public var Rates_CompanyRates_transaction_splitting_Save:String = "Save";
        
        /*	Packages	*/
        public var Rates_Packages_PackagesList_Search_PackageName_Prompt:String = "Package Name";
        public var Rates_Packages_PackagesList_Search_From:String = "From:";
        public var Rates_Packages_PackagesList_Search_To:String = "To:";
        public var Rates_Packages_PackagesList_Search_Search:String = "Search";
        
        public var Rates_Packages_PackagesList_Columns_PackageName:String = "Package Name";
        public var Rates_Packages_PackagesList_Columns_RoomType:String = "Room Type";
        public var Rates_Packages_PackagesList_Columns_From:String = "From";
        public var Rates_Packages_PackagesList_Columns_To:String = "To";
        public var Rates_Packages_PackagesList_Columns_Price:String = "Price";
        public var Rates_Packages_PackagesList_Columns_PricePer:String = "Price per";
        public var Rates_Packages_PackagesList_Columns_MinimumStay:String = "Minimum Stay:";
        public var Rates_Packages_PackagesList_Columns_MaximumStay:String = "Maximum Stay:";
        public var Rates_Packages_PackagesList_Columns_EditPackage:String = "Edit Package";
        public var Rates_Packages_PackagesList_Columns_DeletePackage:String = "Delete Package";
        public var Rates_Packages_PackagesList_Columns_TransationsPackage:String = "Package Transactions List";
        
        public var Rates_Packages_PackagesList_Button_AddPackage:String = "Add New Package";
        
        public var Rates_Packages_PackagesList_Dialogs_DeletePackage:String = "Would you like to delete this Package?";
        
        
        public var Rates_Packages_DetailsWindow_NewTitle:String = "New Package";
        public var Rates_Packages_DetailsWindow_EditTitle:String = "Edit ";
        public var Rates_Packages_DetailsWindow_ConfigurationForm_Title:String = "Configuration";
        public var Rates_Packages_DetailsWindow_ConfigurationForm_From:String = "From:";
        public var Rates_Packages_DetailsWindow_ConfigurationForm_To:String = "To:";
        public var Rates_Packages_DetailsWindow_ConfigurationForm_PackageName:String = "Name:";
        public var Rates_Packages_DetailsWindow_ConfigurationForm_RoomType:String = "Room Type:";
        public var Rates_Packages_DetailsWindow_ConfigurationForm_MinimumStay:String = "Minimum Stay:";
        public var Rates_Packages_DetailsWindow_ConfigurationForm_MaximumStay:String = "Maximum Stay:";
        public var Rates_Packages_DetailsWindow_ConfigurationForm_Nights:String = "nights";
        public var Rates_Packages_DetailsWindow_ConfigurationForm_Description:String = "Description:";
        
        public var Rates_Packages_DetailsWindow_PricesForm_Title:String = "Prices";
        public var Rates_Packages_DetailsWindow_PricesForm_OneAdult:String = "One Adult:";
        public var Rates_Packages_DetailsWindow_PricesForm_TwoAdults:String = "Two Adults:";
        public var Rates_Packages_DetailsWindow_PricesForm_ExtraAdultMarkup:String = "Extra Adult Markup:";
        public var Rates_Packages_DetailsWindow_PricesForm_ThreeAdults:String = "Three Adults:";
        public var Rates_Packages_DetailsWindow_PricesForm_Children:String = "Children &lt; ";
        public var Rates_Packages_DetailsWindow_PricesForm_PriceType:String = "Price Type:";
        public var Rates_Packages_DetailsWindow_PricesForm_PaymentType:String = "Payment Type:";
        public var Rates_Packages_DetailsWindow_PricesForm_Absolute:String = "Absolute";
        public var Rates_Packages_DetailsWindow_PricesForm_PercentFromBar:String = "% from BAR";
        public var Rates_Packages_DetailsWindow_PricesForm_PerNight:String = "per Night";
        public var Rates_Packages_DetailsWindow_PricesForm_PerStay:String = "per Stay";
        public var Rates_Packages_DetailsWindow_PricesForm_Euro:String = "euro";
        public var Rates_Packages_DetailsWindow_PricesForm_Percent:String = "%";
        
        
        public var Rates_Packages_TransactionsSplitting_Title:String = "Transactions Splitting";
        public var Rates_Packages_TransactionsSplitting_EditTransaction:String = "Edit Transaction";
        public var Rates_Packages_TransactionsSplitting_DeleteTransaction:String = "Delete Transaction";
        public var Rates_Packages_TransactionsSplitting_Columns_Code:String = "Code";
        public var Rates_Packages_TransactionsSplitting_Columns_TransactionName:String = "Transaction Name";
        public var Rates_Packages_TransactionsSplitting_Columns_PricePerStay:String = "Price per Stay";
        public var Rates_Packages_TransactionsSplitting_Columns_Price:String = "Price";
        public var Rates_Packages_TransactionsSplitting_Columns_PricePer:String = "Price per";
        public var Rates_Packages_TransactionsSplitting_Columns_Description:String = "Description";
        public var Rates_Packages_TransactionsSplitting_Columns_EditTransaction:String = "Edit Transaction";
        public var Rates_Packages_TransactionsSplitting_Columns_DeleteTransaction:String = "Delete Transaction";
        
        public var Rates_Packages_TransactionsSplitting_PerRoom:String = "room";
        public var Rates_Packages_TransactionsSplitting_PerPerson:String = "person";
        
        public var Rates_Packages_TransactionsSplitting_Buttons_AddTransaction:String = "Add Transaction";
        
        public var Rates_Packages_TransactionsSplitting_Total:String = "Total:";
        
        public var Rates_Packages_TransactionDetails_NewTitle:String = "Add Transaction";
        public var Rates_Packages_TransactionDetails_EditTitle:String = "Edit ";
        
        public var Rates_Packages_TransactionDetails_Search_Title:String = "Search";
        public var Rates_Packages_TransactionDetails_Search_Group:String = "Group";
        public var Rates_Packages_TransactionDetails_Search_Transaction:String = "Transaction/Article";
        public var Rates_Packages_TransactionDetails_Search_Columns_Transaction:String = "Transaction";
        public var Rates_Packages_TransactionDetails_Search_Columns_Code:String = "Code";
        public var Rates_Packages_TransactionDetails_Search_Columns_Price:String = "Price";
        public var Rates_Packages_TransactionDetails_Search_Columns_Vat:String = "VAT";
        public var Rates_Packages_TransactionDetails_Search_Columns_ArrangementCode:String = "Arrangement code";
        
        public var Rates_Packages_TransactionDetails_Details_Title:String = "Transaction";
        public var Rates_Packages_TransactionDetails_Details_TransactionName:String = "Transaction Name:";
        public var Rates_Packages_TransactionDetails_Details_Code:String = "Code:";
        public var Rates_Packages_TransactionDetails_Details_Price:String = "Price:";
        public var Rates_Packages_TransactionDetails_Details_PerRoom:String = "per Room";
        public var Rates_Packages_TransactionDetails_Details_PerPerson:String = "per Person";
        public var Rates_Packages_TransactionDetails_Details_PerChild:String = "per Child &lt; ";
        public var Rates_Packages_TransactionDetails_Details_Description:String = "Description:";
        public var Rates_Packages_TransactionDetails_Details_BookingRhythm:String = "Booking Rhythm:";
        public var Rates_Packages_TransactionDetails_Details_Euro:String = "euro";
        
        
        // --------------------------------------------------------------------- //
        //			Reports		                             
        // --------------------------------------------------------------------- //
        
        // --------------------------------------------------------------------- //
        //			Reservation Create		                             
        // --------------------------------------------------------------------- //
        
        // --------------------------------------------------------------------- //
        //			Reservation Edit		                             
        // --------------------------------------------------------------------- //	
        
        /* Search */
        public var ReservationEdit_Search_AdvancedSearch:String = "Advanced Search";
        public var ReservationEdit_Search_SimpleSearch:String = "Simple Search";
        public var ReservationEdit_Search_Filter_ConfirmationCode:String = "Confirmation code:";
        public var ReservationEdit_Search_Filter_CallerName:String = "Caller Name:";
        public var ReservationEdit_Search_Filter_Company:String = "Company:";
        public var ReservationEdit_Search_Filter_TravelAgency:String = "Travel Agency:";
        public var ReservationEdit_Search_Filter_GuestName:String = "Guest Name:";
        public var ReservationEdit_Search_Filter_City:String = "City:";
        public var ReservationEdit_Search_Filter_Zip:String = "Zip:";
        public var ReservationEdit_Search_Filter_Street:String = "Street:";
        public var ReservationEdit_Search_Filter_ReservationType:String = "Reservation Type:";
        public var ReservationEdit_Search_Filter_Individual:String = "Individual";
        public var ReservationEdit_Search_Filter_Group:String = "Group";
        public var ReservationEdit_Search_Filter_Search:String = "Search";
        
        public var ReservationEdit_Search_Columns_ConfirmationCode:String = "Confirmation code";
        public var ReservationEdit_Search_Columns_CallerName:String = "Caller Name";
        public var ReservationEdit_Search_Columns_Company:String = "Company";
        public var ReservationEdit_Search_Columns_TravelAgency:String = "Travel Agency";
        public var ReservationEdit_Search_Columns_GuestName:String = "Guest Name";
        public var ReservationEdit_Search_Columns_City:String = "City:";
        public var ReservationEdit_Search_Columns_Zip:String = "Zip";
        public var ReservationEdit_Search_Columns_Street:String = "Street";
        
        public var ReservationEdit_Search_Buttons_Save_Label:String = "Save";
        public var ReservationEdit_Search_Buttons_Save_Tooltip:String = "Save";
        
        // --------------------------------------------------------------------- //
        //			Room Settigs		                             
        // --------------------------------------------------------------------- //
        public var RoomSettings_SearchBox_Codes:String = "Search Room Setting by";
        public var RoomSettings_SearchBox_Label:String = "Room setting";
        
        public var RoomSettings_Columns_Code:String = "Room Settings Code";
        public var RoomSettings_Columns_Description:String = "Description";
        public var RoomSettings_Columns_SW:String = "Special Wish";
        
        public var RoomSettings_SavePopup_AddTitle:String = "Add Room Setting";
        public var RoomSettings_SavePopup_EditTitle:String = "Edit Room Setting";
        public var RoomSettings_SavePopup_LabelCode:String = "Code";
        public var RoomSettings_SavePopup_LabelCodeLimitInput:String = "Max. 4 capital letters";
        public var RoomSettings_SavePopup_LabelSpecialWish:String = "Special Wish";
        public var RoomSettings_SavePopup_LabelDescription:String = "Description";
        public var RoomSettings_RemovePopup_Title:String = "Delete Room Setting";
        public var RoomSettings_RemovePopup_Description:String = "Are you sure to delete selected room setting?";
        
        
        // --------------------------------------------------------------------- //
        //			Room Types		                             
        // --------------------------------------------------------------------- //		
        
        // --------------------------------------------------------------------- //
        //			Security		                             
        // --------------------------------------------------------------------- //		
        
        public var Security_UserSystemManagerTitle:String = "User System Manager";
        
        public var Security_UserHotelManager_Title:String = "User Hotel Manager";
        
        public var Security_RoleManager_Title:String = "Role Manager";
        public var Security_RoleManager_NewRoleName:String = "New Role Name";
        public var Security_RoleManager_Buttons_Save_Label:String = "Save";
        public var Security_RoleManager_Buttons_Save_Tooltip:String = "Save";
        public var Security_RoleManager_Dialogs_DeleteRole_Title:String = "Delete?";
        public var Security_RoleManager_Dialogs_DeleteRole_Description:String = "Would you like to delete this Role?";
    }
}