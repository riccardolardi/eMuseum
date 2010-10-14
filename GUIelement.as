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
					
				case "areaSuggestions":
					areaSuggestions();
					break;
					
				case "labelSort":
					labelSort();
					break;
					
				case "buttonSortDate":
					buttonSortDate();
					break;
					
				case "buttonSortName":
					buttonSortName();
					break;
					
				case "buttonSortCountry":
					buttonSortCountry();
					break;
					
				case "labelPage":
					labelPage();
					break;
					
				case "buttonPageBack":
					buttonPageBack();
					break;
			
				case "labelPageCurrent":
					labelPageCurrent();
					break;
					
				case "buttonPageForward":
					buttonPageForward();
					break;
					
				case "labelPageOf":
					labelPageOf();
					break;
					
				case "labelPageTotal":
					labelPageTotal();
					break;
			
			}
		
		}
		
		public function labelAppTitle(): void {
		
			customFormat.size = 18;
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
			
			globals.guiObjects[elementName] = customTextField;
			globals.myStage.addChild(customTextField);
			
			// button
			var customButton: Loader = new Loader();
			var customRequest: URLRequest = new URLRequest("img/search.png");
			customButton.load(customRequest);
			customButton.x = 5 + customTextField.x + customTextField.width;
			customButton.y = customTextField.y - 3;
			
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
		
			var areaFilter: Shape = new Shape();
			areaFilter.graphics.lineStyle(1, 0x7A7A7A);
			areaFilter.graphics.beginFill(0xEDEDED);
			areaFilter.graphics.drawRoundRect(10, 50, 300, 400, 5);
			areaFilter.graphics.endFill();

			globals.myStage.addChild(areaFilter);
		
		}
		
		public function inputNewFilter(): void {
		
			// border
			customBackground.graphics.beginFill(0xFFFFFF);
			customBackground.graphics.lineStyle(1, 0x7A7A7A);
			customBackground.graphics.drawRoundRect(20, 385, 255, 18, 5);
			customBackground.graphics.endFill();
			
			globals.myStage.addChild(customBackground);
			
			// textfield
			customTextField.defaultTextFormat = customFormat;
			customTextField.selectable = true;
			customTextField.type = TextFieldType.INPUT;
			customTextField.text = "New filter";
			customTextField.x = 22;
			customTextField.y = 388;
			customTextField.width = 255;
			customTextField.height = 18;
			customTextField.autoSize = TextFieldAutoSize.NONE;
			
			globals.guiObjects[elementName] = customTextField;
			globals.myStage.addChild(customTextField);
			
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
			var customButton: Loader = new Loader();
			var customRequest: URLRequest = new URLRequest("img/refresh.png");
			customButton.load(customRequest);
			customButton.x = 20;
			customButton.y = 415;
			
			customButton.addEventListener(MouseEvent.CLICK, function(){onClick(elementName);});
			globals.myStage.addChild(customButton);
		
			// label
			customFormat.color = 0xFFFFFF;
			customTextField.defaultTextFormat = customFormat;
			customTextField.text = "Refresh";
			customTextField.x = 130;
			customTextField.y = 418;
			customTextField.autoSize = TextFieldAutoSize.LEFT;
			
			globals.guiObjects[elementName] = customTextField;
			customTextField.addEventListener(MouseEvent.CLICK, function(){onClick(elementName);});
			globals.myStage.addChild(customTextField);
		
		}
		
		public function areaSuggestions(): void {
		
			var areaSuggestions: Shape = new Shape();
			areaSuggestions.graphics.lineStyle(1, 0x7A7A7A);
			areaSuggestions.graphics.beginFill(0xEDEDED);
			areaSuggestions.graphics.drawRoundRect(10, 465, 300, 288, 5);
			areaSuggestions.graphics.endFill();
			
			globals.myStage.addChild(areaSuggestions);
		
		}
		
		public function labelSort(): void {
		
			customTextField.defaultTextFormat = customFormat;
			customTextField.text = "Sort";
			customTextField.x = 350;
			customTextField.y = 50;
			customTextField.autoSize = TextFieldAutoSize.LEFT;
			
			globals.guiObjects[elementName] = customTextField;
			globals.myStage.addChild(customTextField);
		
		}
		
		public function buttonSortDate(): void {
		
			customFormat.color = 0x009FE3;
			customTextField.defaultTextFormat = customFormat;
			customTextField.text = "Date";
			customTextField.x = 380;
			customTextField.y = 50;
			customTextField.autoSize = TextFieldAutoSize.LEFT;
			
			globals.guiObjects[elementName] = customTextField;
			customTextField.addEventListener(MouseEvent.CLICK, function(){onClick(elementName);});
			globals.myStage.addChild(customTextField);
		
		}
		
		public function buttonSortName(): void {
		
			customFormat.color = 0x009FE3;
			customTextField.defaultTextFormat = customFormat;
			customTextField.text = "Name";
			customTextField.x = 410;
			customTextField.y = 50;
			customTextField.autoSize = TextFieldAutoSize.LEFT;
			
			globals.guiObjects[elementName] = customTextField;
			customTextField.addEventListener(MouseEvent.CLICK, function(){onClick(elementName);});
			globals.myStage.addChild(customTextField);
		
		}
		
		public function buttonSortCountry(): void {
		
			customFormat.color = 0x009FE3;
			customTextField.defaultTextFormat = customFormat;
			customTextField.text = "Country";
			customTextField.x = 448;
			customTextField.y = 50;
			customTextField.autoSize = TextFieldAutoSize.LEFT;
			
			globals.guiObjects[elementName] = customTextField;
			customTextField.addEventListener(MouseEvent.CLICK, function(){onClick(elementName);});
			globals.myStage.addChild(customTextField);
		
		}
		
		public function labelPage(): void {
		
			customFormat.color = 0x7A7A7A;
			customTextField.defaultTextFormat = customFormat;
			customTextField.text = "Page";
			customTextField.x = 800;
			customTextField.y = 50;
			customTextField.autoSize = TextFieldAutoSize.LEFT;
			
			globals.guiObjects[elementName] = customTextField;
			globals.myStage.addChild(customTextField);
		
		}
		
		public function buttonPageBack(): void {
		
			customFormat.color = 0x009FE3;
			customTextField.defaultTextFormat = customFormat;
			customTextField.text = "<";
			customTextField.x = 840;
			customTextField.y = 50;
			customTextField.autoSize = TextFieldAutoSize.LEFT;
			
			globals.guiObjects[elementName] = customTextField;
			customTextField.addEventListener(MouseEvent.CLICK, function(){onClick(elementName);});
			globals.myStage.addChild(customTextField);
		
		}
		
		public function labelPageCurrent(): void {
		
			customTextField.defaultTextFormat = customFormat;
			customTextField.text = "1";
			customTextField.x = 860;
			customTextField.y = 50;
			customTextField.autoSize = TextFieldAutoSize.LEFT;
			
			globals.guiObjects[elementName] = customTextField;
			globals.guiObjects[elementName] = customTextField;
			globals.myStage.addChild(customTextField);
		
		}
		
		public function buttonPageForward(): void {
		
			customFormat.color = 0x009FE3;
			customTextField.defaultTextFormat = customFormat;
			customTextField.text = ">";
			customTextField.x = 880;
			customTextField.y = 50;
			customTextField.autoSize = TextFieldAutoSize.LEFT;
			
			globals.guiObjects[elementName] = customTextField;
			customTextField.addEventListener(MouseEvent.CLICK, function(){onClick(elementName);});
			globals.myStage.addChild(customTextField);
		
		}
		
		public function labelPageOf(): void {
		
			customTextField.defaultTextFormat = customFormat;
			customTextField.text = "of";
			customTextField.x = 900;
			customTextField.y = 50;
			customTextField.autoSize = TextFieldAutoSize.LEFT;
			
			globals.guiObjects[elementName] = customTextField;
			globals.myStage.addChild(customTextField);
		
		}
		
		public function labelPageTotal(): void {
		
			customTextField.defaultTextFormat = customFormat;
			customTextField.text = "1";
			customTextField.x = 920;
			customTextField.y = 50;
			customTextField.autoSize = TextFieldAutoSize.LEFT;
			
			globals.guiObjects[elementName] = customTextField;
			globals.myStage.addChild(customTextField);
		
		}
		
		// function to react on clicks
		public function onClick(elementName): void {
		
			switch (elementName) {
			
				case "inputNewSearch":
					globals.myStage.destroyActiveFilters();
					var newSearch: NewSearch = new NewSearch(globals.guiObjects[elementName].text);
					break;
					
				case "inputNewFilter":
					var newSearchFilter: SearchFilter = new SearchFilter(globals.guiObjects[elementName].text);
					globals.myStage.addChild(newSearchFilter);
					break;
					
				case "refreshButton":
					// TODO
					break;
					
				case "buttonSortDate":
					// TODO
					break;
					
				case "buttonSortName":
					// TODO
					break;
					
				case "buttonSortCountry":
					// TODO
					break;
					
				case "buttonPageBack":
					if (globals.currentPage < 2) {
						// nuthin'
					} else {
						globals.currentPage --;
						globals.myStage.destroyImgList();
						globals.guiObjects["labelPageCurrent"].text = globals.currentPage;
						var newImageDisplay: ImageDisplay = new ImageDisplay(globals.searchIDs, true, "back");
					}
					break;
					
				case "buttonPageForward":
					if (globals.currentPage == globals.guiObjects["labelPageTotal"].text) {
						// nuthin'
					} else {
						globals.currentPage ++;
						globals.myStage.destroyImgList();
						globals.guiObjects["labelPageCurrent"].text = globals.currentPage;
						var newImageDisplay: ImageDisplay = new ImageDisplay(globals.searchIDs, true, "forward");
					}
					break;
			
			}
		
		}
	
	}
	
}