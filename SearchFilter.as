package {

	import flash.display.*;
	import flash.net.*;
	import flash.events.*;
	import flash.text.*;
	
	import globals;
	
	public class SearchFilter extends Sprite {
	
		// instance variables
		var xmlLoader: URLLoader = new URLLoader();
		var xmlData: XML = new XML();
		var customFormat: TextFormat = new TextFormat();
		var customTextField: TextField = new TextField();
		var filterName: String;
		var resultCount: Number;
	
		public function SearchFilter(inSearchTerm): void {
		
			filterName = inSearchTerm;
			
			// get results for filter
			getResultCount();
			
		}
		
		public function getResultCount(): void {
		
			xmlLoader.addEventListener(Event.COMPLETE, loadedXML);
			xmlLoader.load(new URLRequest("http://mia-web.zhdk.ch/sobjekte/xml_suche/" + filterName));
		
		}
		
		public function loadedXML(inEvent: Event): void {
		
			xmlData = new XML(inEvent.target.data);
			resultCount = (xmlData.objekte_liste.attribute("anzahl"));
			
			// make filter
			createFilter();
		
		}
		
		public function createFilter(): void {
		
			customFormat.color = 0x7A7A7A;
			customFormat.size = 12;
			customFormat.font = "Helvetica";
			customFormat.align = "left";
			customTextField.antiAliasType = AntiAliasType.ADVANCED;
			customTextField.type = TextFieldType.DYNAMIC;
			customTextField.selectable = false;
			
			customTextField.defaultTextFormat = customFormat;
			customTextField.text = filterName + " " + resultCount;
			customTextField.x = 20;
			customTextField.y = 60;
			customTextField.autoSize = TextFieldAutoSize.LEFT;
			
			addChild(customTextField);
			
			var customButton: Loader = new Loader();
			var customRequest: URLRequest = new URLRequest("img/del.png");
			customButton.load(customRequest);
			customButton.x = 5 + customTextField.x + customTextField.width;
			customButton.y = customTextField.y - 3;
			
			customButton.addEventListener(MouseEvent.CLICK, onClick);
			addChild(customButton);
		
		}
		
		public function onClick(inEvent: Event): void {
		
				trace("SearchFilter: remove filter " + filterName);
		
		}
		
	}
	
}