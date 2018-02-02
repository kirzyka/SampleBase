package view
{
	import model.AppModel;
	
	import spark.components.NavigatorContent;
	
	public class BaseView extends NavigatorContent
	{
		[Bindable]
		public var appModel:AppModel = AppModel.getInstance();
		
		public function BaseView()
		{
			super();
		}
	}
}