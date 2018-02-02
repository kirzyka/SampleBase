package framework.view.pages.login
{
	import mx.validators.Validator;
	import mx.rpc.events.ResultEvent;
	import mx.validators.ValidationResult;
	import flash.events.Event;

	public class PasswordValidator extends Validator
	{
		/**
		 *  Password validator. Constructor.
		 */
		public function PasswordValidator()
		{
			super();
		}
		
		private var results:Array;
		
		/**
		 *  This property contain confirmation password.
		 */
		private var _confirmPassword:String;
		
		private var _matchError:String;
		
		[Bindable("confirmPasswordChange")]
		/**
		 *  Confirmation password.
		 */
		public function get confirmPassword():String
		{
			return _confirmPassword;
		}
		/**
		 *  @private
		 */
		public function set confirmPassword(confirmPassword:String):void
		{
			_confirmPassword = confirmPassword;
			dispatchEvent( new Event("confirmPasswordChange") );
		}
		
		
		public function get matchError():String
		{
			return _matchError;
		}
		/**
		 *  @private
		 */
		public function set matchError(value:String):void
		{
			_matchError = value;
		}
		
		/**
		 *  Executes the validation logic of this validator, including
		 *  validating that a missing or empty value causes a validation
		 *  error as defined by the value of the <code>required</code>
		 *  property.
		 *
		 *  @param value:Object - value to validate.
		 *
		 *  @return For an invalid result, an Array of ValidationResult objects,
		 *  with one ValidationResult object for each field examined
		 *  by the validator that failed validation.
		 *
		 *  @see mx.validators.ValidationResult
		 */
		override protected function doValidation(value:Object):Array
		{
			var typePassword:String = String(value);
			
			// Clear results Array.
			results = [];
			
			if ((required == true) && ((_confirmPassword == "") || (value == "")))
			{
				results.push(new ValidationResult(true, null, "empty", requiredFieldError));
			}
			
			if ((_confirmPassword != null && _confirmPassword.toString().length > 0) || value.toString().length > 0)
			{
				
				if ( value != _confirmPassword )
				{
					results.push ( new ValidationResult(true , null , "doNotMatch", matchError ));
				}
			}
			
			return results;
		}
	}
}
