package {

	import flash.display.*;
	import flash.net.*;
	import flash.events.*;
	import flash.text.*;
	
	import globals;
	
	public class SearchSuggestion extends Sprite {
	
		// instance variables
		var xmlLoader: URLLoader = new URLLoader();
		var xmlData: XML = new XML();
		var customFormat: TextFormat = new TextFormat();
		var customTextField: TextField = new TextField();
		var newSuggestion: String;
	
		public function SearchSuggestion(): void {
		
			var newID: Number;
			newID = globals.searchIDs[Math.round(Math.random() * 12)];
		
			xmlLoader.addEventListener(Event.COMPLETE, loadedXML);
			xmlLoader.load(new URLRequest("http://mia-web.zhdk.ch/sobjekte/xml/" + newID));
			
		}
		
		public function loadedXML(inEvent: Event): void {
		
			xmlData = new XML(inEvent.target.data);
			newSuggestion = (xmlData.marken_liste.marke.wert.text());
			
			newSuggestion = newSuggestion.substr(0, newSuggestion.indexOf(" "));
			
			if (newSuggestion.length > 25) {
				newSuggestion = newSuggestion.substr(0, 25) + " [...]";
			}
			
			createSuggestion();
		
		}
		
		public function createSuggestion(): void {
		
			var suggestionCount: Number = globals.activeSuggestions.length;
			var suggestionName: String = newSuggestion;
		
			customFormat.color = 0x7A7A7A;
			customFormat.size = 12;
			customFormat.font = "Helvetica";
			customFormat.align = "left";
			customTextField.antiAliasType = AntiAliasType.ADVANCED;
			customTextField.type = TextFieldType.DYNAMIC;
			customTextField.selectable = false;
			
			customTextField.defaultTextFormat = customFormat;
			customTextField.text = suggestionName + "     " + Math.round(Math.random() * 1500);
			customTextField.x = 170;
			customTextField.y = 470 + (suggestionCount * 30);
			customTextField.autoSize = TextFieldAutoSize.RIGHT;
			
			addChild(customTextField);
			
			var customButton: Loader = new Loader();
			var customRequest: URLRequest = new URLRequest("img/add.png");
			customButton.load(customRequest);
			customButton.x = 282;
			customButton.y = customTextField.y - 3;
			
			customButton.addEventListener(MouseEvent.CLICK, onClick);
			addChild(customButton);
			globals.activeSuggestions.push(this);
		
		}
		
		public function onClick(inEvent: Event): void {
		
			// add suggestion to filter
		
		}
		
	}
	
}