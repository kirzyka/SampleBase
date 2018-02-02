package com.controls.collapsePanel.interfaces
{
	public interface IErrorViewer
	{
		function set showError(value:Boolean):void;
		function get showError():Boolean;
		function set errorStringGlobal(value:String):void
		function get errorStringGlobal():String;
	}
}