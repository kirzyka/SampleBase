package com.controls
{
	import com.adobe.utils.StringUtil;
	
	import flash.desktop.Clipboard;
	import flash.desktop.ClipboardFormats;
	
	import flashx.textLayout.operations.DeleteTextOperation;
	import flashx.textLayout.operations.InsertTextOperation;
	import flashx.textLayout.operations.PasteOperation;
	
	import spark.components.TextInput;
	import spark.events.TextOperationEvent;
	
	public class RestrictedTextInput extends TextInput
	{
		public var allowStartWithSpace:Boolean;
		public var allowMoreThanOneSpace:Boolean;
		
		public function RestrictedTextInput()
		{
			super();
			restrict = "0-9A-z";
		}
		
		override protected function childrenCreated():void
		{
			super.childrenCreated();
			
			//listen for the text change event
			addEventListener(TextOperationEvent.CHANGING, onTextChanging);
			addEventListener(TextOperationEvent.CHANGE, onTextChange);
		}		
		
		public function onTextChanging(event:TextOperationEvent):void
		{
			//trace("Text1: " + text);
			
			if(event.operation is PasteOperation)
			{
				var pastedText:String = Clipboard.generalClipboard.getData(ClipboardFormats.TEXT_FORMAT).toString();				

				if(restrict && !new RegExp("[" + restrict + " ]").test(pastedText))// allows to paste several white spaces
				{
					event.preventDefault();
				}
				//PasteOperation(event.operation)
				//StringUtil.ltrim(value);
				//trace("paste operation");
			}
			else if(event.operation is InsertTextOperation)
			{
				//trace("insert operation");
			}
			else if(event.operation is DeleteTextOperation)
			{
				//trace("delete operation");
			}
			
		}
		
		public function onTextChange(event:TextOperationEvent):void
		{
			if (event.operation is PasteOperation)
			{
				return;
			}
			if(!allowStartWithSpace)
			{
				text = StringUtil.ltrim(text);
			}
			if(!allowMoreThanOneSpace)
			{
				var position:int = selectionActivePosition;
				text = text.replace(new RegExp(/\s{1,}/g), " ");
				selectRange(position, position);
			}
			
		}

	}
}