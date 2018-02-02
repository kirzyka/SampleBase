import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.utils.Timer;

import h2olib.control.enum.MessageKind;
import h2olib.control.event.MessageBarEvent;

import mx.controls.Alert;
import mx.controls.LinkButton;
import mx.events.CloseEvent;
import mx.events.FlexEvent;

private static const TOOLTIP_LENGTH:uint = 128;

public var iconERROR:Class;
public var iconWARNING:Class;
public var iconRESULT:Class;
public var iconINFORMATION:Class;
public var iconQUESTION:Class;

[Bindable]
private var message:String;

private var _details:String;

[Bindable]
public function get details():String 
{
    return _details;
}

public function set details(value:String):void 
{
    _details = value;
    shortDetails = value && (value.length > TOOLTIP_LENGTH) ?
        value.substr(0, TOOLTIP_LENGTH) + "..." :
        value;
}

// Tooltip
[Bindable]
public var shortDetails:String;

private var stackTrace:String;

[Bindable]
private var kindIconClass:Class;

private var _timer:Timer;

public function get timer():Timer 
{
    if (!_timer) 
    {
        _timer = new Timer(5000);
        _timer.addEventListener(TimerEvent.TIMER, timerCompleteHandler);
    }
    return _timer;
}

private var _closeHandler:Function;

public function set closeHandler(value:Function):void 
{
    if (_closeHandler != value) 
    {
        if (_closeHandler != null) 
        {
            removeEventListener(CloseEvent.CLOSE, _closeHandler);
        }
        if (value != null) 
        {
            addEventListener(CloseEvent.CLOSE, value);
        }
        _closeHandler = value;
    }
}

public function get closeHandler():Function 
{
    return _closeHandler;
}

private function timerCompleteHandler(event:TimerEvent):void 
{
    hide();
    timer.reset();
}

private function init():void 
{
    currentState = '';
    addEventListener(MessageBarEvent.HIDE,
        function(event:MessageBarEvent):void {
            hide();
        });
}

private function setTypeProperties(kind:uint):void {
    var backgroundColor:String;
    var textColor:String;

    if (kind == MessageKind.ERROR) {
        kindIconClass = iconERROR;
        backgroundColor = '#EF5C60'
        textColor = '#B10101';
    } else if (kind == MessageKind.WARNING) {
        kindIconClass = iconWARNING;
        backgroundColor = '#fcb954'
        textColor = '#84600d';
    } else if (kind == MessageKind.RESULT) {
        kindIconClass = iconRESULT;
        backgroundColor = '#a4ef72'
        textColor = '#008040';
    } else if (kind == MessageKind.INFORMATION) {
        kindIconClass = iconINFORMATION;
        backgroundColor = '#72d8fa'
        textColor = '#1b6089';
    }  else if (kind == MessageKind.QUESTION) {
        kindIconClass = iconQUESTION;
        backgroundColor = '#72d8fa'
        textColor = '#1b6089';
    }

    if (content) content.setStyle('backgroundColor', backgroundColor);
    //content.setStyle('textColor', textColor);
    //lblError.setStyle('color', textColor);
}

public function showServiceError(error:MessageBarEvent, autoHide:Boolean = false):void 
{
    show(MessageKind.ERROR, error.message, error.details, error.stackTrace, autoHide);
}

[Bindable]
private var hasDetails:Boolean;

/**
 * Shows a provided message.
 *
 * @param kind Message box kind.
 * @param message Text to display.
 * @param details Text to show in popup window.
 * @param stackTrace Text to show in popup window.
 * @param autoHide AutoHide flag.
 *    autoHide is false if message <code>kind</code> is MessageKind.ERROR.
 * @clickHandler Event handler that is called when any button
 *    on the MessageBox control is pressed.
 * @buttonFlag A bitflag that specifies a button group.
 *    Use constants from <code>Alert</code> class.
 */
public function show(kind:uint, message:String, details:String = null,
        stackTrace:String = null, autoHide:Boolean = false,
        closeHandler:Function = null, buttonFlag:uint = 0):void 
{

    timer.reset();

    this.message = message;
    this.details = details;
    this.stackTrace = stackTrace;
    this.closeHandler = closeHandler;

    if (kind == MessageKind.ERROR) {
        autoHide = false;
    }

    hasDetails = details || stackTrace;

    clear();

    setTypeProperties(kind);
    visible = true;

    currentState = !currentState ? 'timeoutState' : '';

    buttons.includeInLayout = buttonFlag > 0;
    if (buttonFlag) 
    {
        if (buttonFlag & Alert.YES) 
        {
            addButton(Alert.YES, Alert.yesLabel, buttonClickHandler);
        }
        if (buttonFlag & Alert.NO) 
        {
            addButton(Alert.NO, Alert.noLabel, buttonClickHandler);
        }
    }

    if (autoHide) 
    {
        timer.start();
    }
}

private function buttonClickHandler(event:MouseEvent):void 
{
    hide();
    dispatchEvent(new CloseEvent(CloseEvent.CLOSE, false, false, (event.currentTarget as LinkButton).data as int));
}

public function messageHandler(event:MessageBarEvent):void 
{
    if (event.type == MessageBarEvent.HIDE) 
    {
        hide();
    } 
    else 
    {
		show(event.kind, event.message, event.details, event.stackTrace, event.autoHide);
    }
}

private function clear():void 
{
    if (buttons) {
        buttons.removeAllChildren();
    }
}

/**
 *  Adds button to buttons box.
 *
 *  @param buttonFlag
 *  @param label Button label
 *  @param clickHandler Handler for click event.
 */
private function addButton(buttonFlag:uint, label:String, clickHandler:Function):void {
    var button:LinkButton = new LinkButton();

    var hasToFocus:Boolean = !buttons.numChildren;

    button.data = buttonFlag;
    button.label = label;

    if (clickHandler != null) 
    {
        button.addEventListener(MouseEvent.CLICK, clickHandler);
    }

    buttons.addChild(button);

    if (hasToFocus) 
    {
        button.setFocus();
    }
}

public function hide():void 
{
    visible = false;
    
}

private function enterBaseState(event:FlexEvent):void 
{
    currentState = 'timeoutState';
}

private function showDetails():void 
{
    if (hasDetails)  
    {
        //var window:MessageBoxDetailsWindow = new MessageBoxDetailsWindow();
        //window.show(kindIconClass, message, details, stackTrace);
    }
}
