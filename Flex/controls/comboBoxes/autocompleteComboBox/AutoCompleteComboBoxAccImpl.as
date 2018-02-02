package com.controls.comboBoxes.autocompleteComboBox
{

	import flash.accessibility.Accessibility;
	import flash.events.Event;

	import mx.accessibility.AccConst;
	import mx.core.UIComponent;
	import mx.core.mx_internal;

	import spark.accessibility.ComboBoxAccImpl;
	import spark.components.ComboBox;
	import spark.events.IndexChangeEvent;

	use namespace mx_internal;

	public class AutoCompleteComboBoxAccImpl extends ComboBoxAccImpl
	{


		mx_internal static function createAccessibilityImplementation(component:UIComponent):void
		{
			component.accessibilityImplementation =
				new AutoCompleteComboBoxAccImpl(component);
		}


		public function AutoCompleteComboBoxAccImpl(master:UIComponent)
		{
			super(master);
		}

		override protected function eventHandler(event:Event):void
		{
			//trace("AutoCompleteComboBoxAccImpl eventHandler " + event.type);
			switch (event.type)
			{
				case "close":
				{
					if(AutoCompleteComboBox(master).textInput.text == "")
						AutoCompleteComboBox(master)._inputTextChanged = true;
					AutoCompleteComboBox(master).invalidateProperties();
					if (master.getFocus() && master.owns(master.getFocus()) && ComboBox(master).textInput)
					{
						ComboBox(master).textInput.textDisplay.setFocus();
						ComboBox(master).textInput.selectRange(255, 255);
						Accessibility.sendEvent(master, 1, AccConst.EVENT_OBJECT_FOCUS);
					}
					break;
				}

				case "caretChange":
				{
					/*					var index:uint = IndexChangeEvent(event).newIndex;
										// childIDs are 1 based, a plus two offset is used because the
										// first child is an edit field and not a list item
										var childID:uint = index + 2;

										Accessibility.sendEvent(master, 0,
											AccConst.EVENT_OBJECT_VALUECHANGE);
										Accessibility.sendEvent(master, 1,
											AccConst.EVENT_OBJECT_VALUECHANGE);
										// This event will fire for the opened and close combo box
										// normally this only fires on open comboboxes but it is fired
										// for closed comboboxes to support screen readers
										if (ComboBox(master).isDropDownOpen && index >=0 && index < ComboBox(master).dataProvider.length)
										{
											Accessibility.sendEvent(master, childID,
												AccConst.EVENT_OBJECT_FOCUS);
										}
					*/
					break;
				}

				default:
				{
					super.eventHandler(event);
				}
			}
		}
	}
}
