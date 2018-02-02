package h2olib.control.containers
{
	import mx.core.Application;
	
	[Bindable]
	/**
	 * Here we define javascript functions which will be inserted into the DOM
	 */
	public class IFrameFunction
	{
		public static const FUNCTION_CREATEIFRAME:String = 
			"document.insertScript = function ()" +
			"{ " +
				"if (document.createIFrame==null)" + 
				"{" + 
					"createIFrame = function (frameID)" +
					"{ " +
						"var bodyID = document.getElementsByTagName(\"body\")[0];" +
						"var newDiv = document.createElement('div');" +
						"newDiv.id = frameID;" +
						"newDiv.style.position ='absolute';" +
						"newDiv.style.backgroundColor = 'transparent';" + 
						"newDiv.style.border = '0px';" +
						"newDiv.style.visibility = 'hidden';" +
						"bodyID.appendChild(newDiv);" +
					"}" +
				"}" +
			"}";
		
		public static const FUNCTION_MOVEIFRAME:String = 
			"document.insertScript = function ()" +
			"{ " +
				"if (document.moveIFrame==null)" +
				"{" +
					"moveIFrame = function(frameID, iframeID, x,y,w,h) " + 
					"{" +
						"var frameRef=document.getElementById(frameID);" +
						"frameRef.style.left=x;" + 
						"frameRef.style.top=y;" +
						"var iFrameRef=document.getElementById(iframeID);" +
						"iFrameRef.width=w;" +
						"iFrameRef.height=h;" +
					"}" +
				"}" +
			"}";
		
		public static const FUNCTION_HIDEIFRAME:String = 
			"document.insertScript = function ()" +
			"{ " +
				"if (document.hideIFrame==null)" +
				"{" +
					"hideIFrame = function (frameID, iframeID)" +
					"{" +
						"var iframeRef = document.getElementById(iframeID);" +
						"var iframeDoc;" +
						"if (iframeRef.contentWindow) {" +
							"iframeDoc = iframeRef.contentWindow.document;" +
						"} else if (iframeRef.contentDocument) {" +
							"iframeDoc = iframeRef.contentDocument;" +
						"} else if (iframeRef.document) {" +
							"iframeDoc = iframeRef.document;" +
						"}" +
						"if (iframeDoc) {" +
							"iframeDoc.body.style.visibility='hidden';" +
						"}" +
						"document.getElementById(frameID).style.visibility='hidden';" +
					"}" +
				"}" +
			"}";
		
		public static const FUNCTION_SHOWIFRAME:String = 
			"document.insertScript = function ()" +
			"{ " +
				"if (document.showIFrame==null)" +
				"{" +
					"showIFrame = function (frameID, iframeID)" +
					"{" +
						"var iframeRef = document.getElementById(iframeID);" +
						"document.getElementById(frameID).style.visibility='visible';" +
						
						"var iframeDoc;" +
						"if (iframeRef.contentWindow) {" +
							"iframeDoc = iframeRef.contentWindow.document;" +
						"} else if (iframeRef.contentDocument) {" +
							"iframeDoc = iframeRef.contentDocument;" +
						"} else if (iframeRef.document) {" +
							"iframeDoc = iframeRef.document;" +
						"}" +
						"if (iframeDoc) {" +
							"iframeDoc.body.style.visibility='visible';" +
						"}" +
					"}" +
				"}" +
			"}";
		
		public static const FUNCTION_HIDEDIV:String = 
			"document.insertScript = function ()" +
			"{ " +
				"if (document.hideDiv==null)" +
				"{" +
					"hideDiv = function (frameID, iframeID)" +
					"{" +
						"document.getElementById(frameID).style.visibility='hidden';" +
					"}" +
				"}" +
			"}";
		
		public static var FUNCTION_SHOWDIV:String = 
			"document.insertScript = function ()" +
			"{ " +
				"if (document.showDiv==null)" +
				"{" +
					"showDiv = function (frameID, iframeID)" +
					"{" +
						"document.getElementById(frameID).style.visibility='visible';" +
					"}" +
				"}" +
			"}";
		
		public static const FUNCTION_LOADIFRAME:String = 
			"document.insertScript = function ()" +
			"{ " +
				"if (document.loadIFrame==null)" +
				"{" +
					"loadIFrame = function (frameID, iframeID, url)" +
					"{" +
						"document.getElementById(frameID).innerHTML = \"<iframe id='\"+iframeID+\"' src='\"+url+\"' onLoad='"
							+ Application.application.id + ".\"+frameID+\"_load()' frameborder='0'></iframe>\";" + 
					"}" +
				"}" +
			"}";
		
		public static const FUNCTION_LOADDIV_CONTENT:String = 
			"document.insertScript = function ()" +
			"{ " +
				"if (document.loadDivContent==null)" +
				"{" +
					"loadDivContent = function (frameID, iframeID, content)" +
					"{" +
						"document.getElementById(frameID).innerHTML = \"<div id='\"+iframeID+\"' frameborder='0'>\"+content+\"</div>\";" +
					"}" +
				"}" +
			"}";
		
		public static const FUNCTION_CALLIFRAMEFUNCTION:String = 
			"document.insertScript = function ()" +
			"{ " +
				"if (document.callIFrameFunction==null)" +
				"{" +
					"callIFrameFunction = function (iframeID, functionName, args)" +
					"{" +
						"var iframeRef=document.getElementById(iframeID);" +
						"var iframeDoc;" +
						"if (iframeRef.contentDocument) {" +
							"iframeDoc = iframeRef.contentDocument;" +
						"} else if (iframeRef.contentWindow) {" +
							"iframeDoc = iframeRef.contentWindow.document;" +
						"} else if (iframeRef.document) {" +
							"iframeDoc = iframeRef.document;" +
						"}" +
						"if (iframeDoc.wrappedJSObject != undefined) {" +
							"iframeDoc = iframeDoc.wrappedJSObject;" +
						"}" +
						"return iframeDoc[functionName](args);" +
					"}" +
				"}" +
			"}";
	}
}