package {

	import flash.display.*;
	import flash.net.*;
	import flash.events.*;
	import flash.text.*;
	
	import globals;
	
	public class GUIelement extends Sprite {
		
		// instance variables
		var customFormat: TextFormat = new TextFormat();
		var customTextField: TextField = new TextField();
		var customBackground: Shape = new Shape();
		var elementName: String;
	
		public function GUIelement(inType): void {
		
			// standard format values
			customFormat.color = 0x7A7A7A;
			customFormat.size = 12;
			customFormat.font = "Helvetica";
			customFormat.align = "left";
			customTextField.antiAliasType = AntiAliasType.ADVANCED;
			customTextField.type = TextFieldType.DYNAMIC;
			customTextField.selectable = false;
		
			// the elements name
			elementName = inType;
		
			switch (elementName) {
			
				case "labelAppTitle":
					labelAppTitle();
					break;
					
				case "inputNewSearch":
					inputNewSearch();
					break;
					
				case "horizontalRule":
					horizontalRule();
					break;
					
				case "areaFilter":
					areaFilter();
					break;
					
				case "inputNewFilter":
					inputNewFilter();
					break;
					
				case "buttonRefresh":
					buttonRefresh();
					break;
			
			}
		
		}
		
		public function labelAppTitle(): void {
		
			customTextField.defaultTextFormat = customFormat;
			customTextField.text = "ZHdK eMuseum Gallery Browser";
			customTextField.x = 10;
			customTextField.y = 10;
			customTextField.autoSize = TextFieldAutoSize.LEFT;
			
			globals.myStage.addChild(customTextField);
		
		}
		
		public function inputNewSearch(): void {
		
			// border
			customBackground.graphics.beginFill(0xFFFFFF);
			customBackground.graphics.lineStyle(1, 0x7A7A7A);
			customBackground.graphics.drawRoundRect(798, 7, 180, 18, 5);
			customBackground.graphics.endFill();
			globals.myStage.addChild(customBackground);
			
			// textfield
			customTextField.defaultTextFormat = customFormat;
			customTextField.selectable = true;
			customTextField.type = TextFieldType.INPUT;
			customTextField.text = "New search";
			customTextField.x = 800;
			customTextField.y = 10;
			customTextField.width = 180;
			customTextField.height = 18;
			customTextField.autoSize = TextFieldAutoSize.NONE;
			
			globals.myStage.addChild(customTextField);
			globals.guiObjects[elementName] = customTextField;
			
			// button
			var customButton: Loader = new Loader();
			var customRequest: URLRequest = new URLRequest("img/search.png");
			customButton.load(customRequest);
			customButton.x = 5 + customTextField.x + customTextField.width;
			customButton.y = customTextField.y;
			
			customButton.addEventListener(MouseEvent.CLICK, function(){onClick(elementName);});
			globals.myStage.addChild(customButton);
		
		}
		
		public function horizontalRule(): void {
		
			var horizontalRule: Shape = new Shape();
			horizontalRule.graphics.lineStyle(1, 0x7A7A7A);
			horizontalRule.graphics.moveTo(10, 35);
			horizontalRule.graphics.lineTo(1013, 35);
			globals.myStage.addChild(horizontalRule);
		
		}
		
		public function areaFilter(): void {
		
			var filterArea: Shape = new Shape();
			filterArea.graphics.lineStyle(1, 0x7A7A7A);
			filterArea.graphics.beginFill(0xEDEDED);
			filterArea.graphics.drawRoundRect(10, 50, 300, 400, 5);
			filterArea.graphics.endFill();
			globals.myStage.addChild(filterArea);
		
		}
		
		public function inputNewFilter(): void {
		
			// border
			customBackground.graphics.beginFill(0xFFFFFF);
			customBackground.graphics.lineStyle(1, 0x7A7A7A);
			customBackground.graphics.drawRoundRect(20, 385, 250, 18, 5);
			customBackground.graphics.endFill();
			globals.myStage.addChild(customBackground);
			
			// textfield
			customTextField.defaultTextFormat = customFormat;
			customTextField.selectable = true;
			customTextField.type = TextFieldType.INPUT;
			customTextField.text = "New filter";
			customTextField.x = 22;
			customTextField.y = 388;
			customTextField.width = 250;
			customTextField.height = 18;
			customTextField.autoSize = TextFieldAutoSize.NONE;
			
			globals.myStage.addChild(customTextField);
			globals.guiObjects[elementName] = customTextField;
			
			// button
			var customButton: Loader = new Loader();
			var customRequest: URLRequest = new URLRequest("img/add.png");
			customButton.load(customRequest);
			customButton.x = 5 + customTextField.x + customTextField.width;
			customButton.y = customTextField.y - 3;
			
			customButton.addEventListener(MouseEvent.CLICK, function(){onClick(elementName);});
			globals.myStage.addChild(customButton);
		
		}
		
		public function buttonRefresh(): void {
		
			// background
			var refreshButton: Loader = new Loader();
			var customRequest: URLRequest = new URLRequest("img/refresh.png");
			refreshButton.load(customRequest);
			refreshButton.x = 20;
			refreshButton.y = 413;
			
			globals.myStage.addChild(refreshButton);
			refreshButton.addEventListener(MouseEvent.CLICK, function(){onClick(elementName);});
		
			// label
			customFormat.color = 0xFFFFFF;
			customTextField.defaultTextFormat = customFormat;
			customTextField.text = "Refresh";
			customTextField.x = 130;
			customTextField.y = 418;
			customTextField.autoSize = TextFieldAutoSize.LEFT;
			
			customTextField.addEventListener(MouseEvent.CLICK, function(){onClick(elementName);});
			globals.myStage.addChild(customTextField);
		
		}
		
		// function to react on clicks
		public function onClick(elementName): void {
		
			switch (elementName) {
			
				case "inputNewSearch":
					// TODO
					break;
					
				case "inputNewFilter":
					// TODO
					break;
					
				case "refreshButton":
					// TODO
					break;
			
			}
		
		}
	
	}
	
}