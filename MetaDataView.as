package {

	import flash.display.*;
	import flash.net.*;
	import flash.events.*;
	import flash.text.*;
	
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	
	import globals;
	
	public class MetaDataView extends Sprite {
	
		// instance variables
		var imgID: Number;
		var imgName, imgCountry, imgDate, imgTechnology: String;
		var imgContent, imgPeople: Array = new Array();
		var xmlLoader: URLLoader = new URLLoader();
		var xmlData: XML = new XML();
		var customFormat: TextFormat = new TextFormat();
		var customTextField: TextField = new TextField();
	
		public function MetaDataView(inID): void {
		
			imgID = inID;
			
			xmlLoader.addEventListener(Event.COMPLETE, loadedXML);
			xmlLoader.load(new URLRequest("http://mia-web.zhdk.ch/sobjekte/xml/" + imgID));
		
		}
		
		public function loadedXML(inEvent: Event): void {
		
			xmlData = new XML(inEvent.target.data);
			
			imgName = xmlData.titel.toString();
			imgCountry = xmlData.marken_liste.marke.(schluessel == "Land").wert;
			imgDate = xmlData.marken_liste.marke.(schluessel == "Datum Erfassung").wert;
			imgTechnology = xmlData.marken_liste.marke.(schluessel == "Medium").wert;
			imgContent = [];
			imgPeople = [];
			
			for each (var thisContent in xmlData.marken_liste.marke.(schluessel == "Stichwort Bildinhalt").wert) {
				imgContent.push(thisContent.toString());
			}
			
			for each (var thisPeople in xmlData.marken_liste.marke.(schluessel == "GestalterIn").wert) {
				imgPeople.push(thisPeople.toString());
			}
			
			createMetaView();
		
		}
		
		public function createMetaView(): void {
		
			// create meta area
			var areaMeta: Shape = new Shape();
			areaMeta.graphics.lineStyle(1, 0x7A7A7A);
			areaMeta.graphics.beginFill(0xEDEDED);
			areaMeta.graphics.drawRoundRect(320, 50, 692, 703, 5);
			areaMeta.graphics.endFill();

			addChild(areaMeta);
		
			// close meta view button
			var customButton: Loader = new Loader();
			var customRequest: URLRequest = new URLRequest("img/close.png");
			customButton.load(customRequest);
			customButton.x = 985;
			customButton.y = 58;
			
			customButton.addEventListener(MouseEvent.CLICK, onCloseClick);
			addChild(customButton);
		
			// standard format values
			customFormat.color = 0x7A7A7A;
			customFormat.size = 12;
			customFormat.font = "Helvetica";
			customFormat.align = "left";
			customTextField.antiAliasType = AntiAliasType.ADVANCED;
			customTextField.type = TextFieldType.DYNAMIC;
			customTextField.selectable = false;
		
			createName();
			createCountry();
			createDate();
			createTechnology();
			createPeople();
			createContent()
		
		}
		
		public function createName(): void {
		
			if (imgName.length > 50) {
				imgName = imgName.substr(0, 50) + " [...]";
			}
			
			// create name label
			customFormat.size = 18;
			var customTextField1: TextField = new TextField();
			customTextField1.defaultTextFormat = customFormat;
			customTextField1.text = "Title";
			customTextField1.x = 330;
			customTextField1.y = 100;
			customTextField1.autoSize = TextFieldAutoSize.LEFT;
			
			addChild(customTextField1);
			
			// horizontal rule
			var horizontalRule: Shape = new Shape();
			horizontalRule.graphics.lineStyle(1, 0x7A7A7A);
			horizontalRule.graphics.moveTo(customTextField1.x, customTextField1.y + 20);
			horizontalRule.graphics.lineTo(1002, customTextField1.y + 20);

			addChild(horizontalRule);
			
			// tag
			customFormat.size = 12;
			var customTextField2: TextField = new TextField();
			customTextField2.defaultTextFormat = customFormat;
			customTextField2.text = imgName + "      323";
			customTextField2.x = customTextField1.x + 500;
			customTextField2.y = customTextField1.y + 30;
			customTextField2.autoSize = TextFieldAutoSize.RIGHT;
			
			addChild(customTextField2);
			
			// add button
			var customButton1: Loader = new Loader();
			var customRequest1: URLRequest = new URLRequest("img/add.png");
			customButton1.load(customRequest1);
			customButton1.x = customTextField1.x + 610;
			customButton1.y = customTextField1.y + 26;
			
			customButton1.addEventListener(MouseEvent.CLICK, onNameAddClick);
			addChild(customButton1);
			
			// new search button
			var customButton2: Loader = new Loader();
			var customRequest2: URLRequest = new URLRequest("img/search.png");
			customButton2.load(customRequest2);
			customButton2.x = customButton1.x + 30;
			customButton2.y = customButton1.y;
			
			customButton1.addEventListener(MouseEvent.CLICK, onNameSearchClick);
			addChild(customButton2);
			
		}
		
		public function createCountry(): void {
		
			if (imgCountry.length > 50) {
				imgCountry = imgCountry.substr(0, 50) + " [...]";
			}
			
			// create country label
			customFormat.size = 18;
			var customTextField1: TextField = new TextField();
			customTextField1.defaultTextFormat = customFormat;
			customTextField1.text = "Country";
			customTextField1.x = 330;
			customTextField1.y = 200;
			customTextField1.autoSize = TextFieldAutoSize.LEFT;
			
			addChild(customTextField1);
			
			// horizontal rule
			var horizontalRule: Shape = new Shape();
			horizontalRule.graphics.lineStyle(1, 0x7A7A7A);
			horizontalRule.graphics.moveTo(customTextField1.x, customTextField1.y + 20);
			horizontalRule.graphics.lineTo(1002, customTextField1.y + 20);

			addChild(horizontalRule);
			
			// tag
			customFormat.size = 12;
			var customTextField2: TextField = new TextField();
			customTextField2.defaultTextFormat = customFormat;
			customTextField2.text = imgCountry + "      33";;
			customTextField2.x = customTextField1.x + 500;
			customTextField2.y = customTextField1.y + 30;
			customTextField2.autoSize = TextFieldAutoSize.RIGHT;
			
			addChild(customTextField2);
			
			// add button
			var customButton1: Loader = new Loader();
			var customRequest1: URLRequest = new URLRequest("img/add.png");
			customButton1.load(customRequest1);
			customButton1.x = customTextField1.x + 610;
			customButton1.y = customTextField1.y + 26;
			
			customButton1.addEventListener(MouseEvent.CLICK, onCountryAddClick);
			addChild(customButton1);
			
			// new search button
			var customButton2: Loader = new Loader();
			var customRequest2: URLRequest = new URLRequest("img/search.png");
			customButton2.load(customRequest2);
			customButton2.x = customButton1.x + 30;
			customButton2.y = customButton1.y;
			
			customButton1.addEventListener(MouseEvent.CLICK, onCountrySearchClick);
			addChild(customButton2);
			
		}
		
		public function createDate(): void {
		
			if (imgDate.length > 50) {
				imgDate = imgDate.substr(0, 50) + " [...]";
			}
			
			// create date label
			customFormat.size = 18;
			var customTextField1: TextField = new TextField();
			customTextField1.defaultTextFormat = customFormat;
			customTextField1.text = "Date";
			customTextField1.x = 330;
			customTextField1.y = 300;
			customTextField1.autoSize = TextFieldAutoSize.LEFT;
			
			addChild(customTextField1);
			
			// horizontal rule
			var horizontalRule: Shape = new Shape();
			horizontalRule.graphics.lineStyle(1, 0x7A7A7A);
			horizontalRule.graphics.moveTo(customTextField1.x, customTextField1.y + 20);
			horizontalRule.graphics.lineTo(1002, customTextField1.y + 20);

			addChild(horizontalRule);
			
			// tag
			customFormat.size = 12;
			var customTextField2: TextField = new TextField();
			customTextField2.defaultTextFormat = customFormat;
			customTextField2.text = imgDate + "      16";;
			customTextField2.x = customTextField1.x + 500;
			customTextField2.y = customTextField1.y + 30;
			customTextField2.autoSize = TextFieldAutoSize.RIGHT;
			
			addChild(customTextField2);
			
			// add button
			var customButton1: Loader = new Loader();
			var customRequest1: URLRequest = new URLRequest("img/add.png");
			customButton1.load(customRequest1);
			customButton1.x = customTextField1.x + 610;
			customButton1.y = customTextField1.y + 26;
			
			customButton1.addEventListener(MouseEvent.CLICK, onDateAddClick);
			addChild(customButton1);
			
			// new search button
			var customButton2: Loader = new Loader();
			var customRequest2: URLRequest = new URLRequest("img/search.png");
			customButton2.load(customRequest2);
			customButton2.x = customButton1.x + 30;
			customButton2.y = customButton1.y;
			
			customButton1.addEventListener(MouseEvent.CLICK, onDateSearchClick);
			addChild(customButton2);
			
		}
		
		public function createTechnology(): void {
		
			if (imgTechnology.length > 50) {
				imgTechnology = imgTechnology.substr(0, 50) + " [...]";
			}
			
			// create technology label
			customFormat.size = 18;
			var customTextField1: TextField = new TextField();
			customTextField1.defaultTextFormat = customFormat;
			customTextField1.text = "Technology";
			customTextField1.x = 330;
			customTextField1.y = 400;
			customTextField1.autoSize = TextFieldAutoSize.LEFT;
			
			addChild(customTextField1);
			
			// horizontal rule
			var horizontalRule: Shape = new Shape();
			horizontalRule.graphics.lineStyle(1, 0x7A7A7A);
			horizontalRule.graphics.moveTo(customTextField1.x, customTextField1.y + 20);
			horizontalRule.graphics.lineTo(1002, customTextField1.y + 20);

			addChild(horizontalRule);
			
			// tag
			customFormat.size = 12;
			var customTextField2: TextField = new TextField();
			customTextField2.defaultTextFormat = customFormat;
			customTextField2.text = imgTechnology + "      113";;
			customTextField2.x = customTextField1.x + 500;
			customTextField2.y = customTextField1.y + 30;
			customTextField2.autoSize = TextFieldAutoSize.RIGHT;
			
			addChild(customTextField2);
			
			// add button
			var customButton1: Loader = new Loader();
			var customRequest1: URLRequest = new URLRequest("img/add.png");
			customButton1.load(customRequest1);
			customButton1.x = customTextField1.x + 610;
			customButton1.y = customTextField1.y + 26;
			
			customButton1.addEventListener(MouseEvent.CLICK, onTechnologyAddClick);
			addChild(customButton1);
			
			// new search button
			var customButton2: Loader = new Loader();
			var customRequest2: URLRequest = new URLRequest("img/search.png");
			customButton2.load(customRequest2);
			customButton2.x = customButton1.x + 30;
			customButton2.y = customButton1.y;
			
			customButton1.addEventListener(MouseEvent.CLICK, onTechnologySearchClick);
			addChild(customButton2);
			
		}
		
		public function createPeople(): void {
			
			// create people label
			customFormat.size = 18;
			var customTextField1: TextField = new TextField();
			customTextField1.defaultTextFormat = customFormat;
			customTextField1.text = "People";
			customTextField1.x = 330;
			customTextField1.y = 500;
			customTextField1.autoSize = TextFieldAutoSize.LEFT;
			
			addChild(customTextField1);
			
			// horizontal rule
			var horizontalRule: Shape = new Shape();
			horizontalRule.graphics.lineStyle(1, 0x7A7A7A);
			horizontalRule.graphics.moveTo(customTextField1.x, customTextField1.y + 20);
			horizontalRule.graphics.lineTo(1002, customTextField1.y + 20);

			addChild(horizontalRule);
			
			// tag
			customFormat.size = 12;
			var customTextField2: TextField = new TextField();
			customTextField2.defaultTextFormat = customFormat;
			customTextField2.text = imgPeople[0] + "      54";;
			customTextField2.x = customTextField1.x + 500;
			customTextField2.y = customTextField1.y + 30;
			customTextField2.autoSize = TextFieldAutoSize.RIGHT;
			
			addChild(customTextField2);
			
			// add button
			var customButton1: Loader = new Loader();
			var customRequest1: URLRequest = new URLRequest("img/add.png");
			customButton1.load(customRequest1);
			customButton1.x = customTextField1.x + 610;
			customButton1.y = customTextField1.y + 26;
			
			customButton1.addEventListener(MouseEvent.CLICK, onNameAddClick);
			addChild(customButton1);
			
			// new search button
			var customButton2: Loader = new Loader();
			var customRequest2: URLRequest = new URLRequest("img/search.png");
			customButton2.load(customRequest2);
			customButton2.x = customButton1.x + 30;
			customButton2.y = customButton1.y;
			
			customButton1.addEventListener(MouseEvent.CLICK, onNameSearchClick);
			addChild(customButton2);
			
		}
		
		public function createContent(): void {
			
			// create content label
			customFormat.size = 18;
			var customTextField1: TextField = new TextField();
			customTextField1.defaultTextFormat = customFormat;
			customTextField1.text = "Content";
			customTextField1.x = 330;
			customTextField1.y = 600;
			customTextField1.autoSize = TextFieldAutoSize.LEFT;
			
			addChild(customTextField1);
			
			// horizontal rule
			var horizontalRule: Shape = new Shape();
			horizontalRule.graphics.lineStyle(1, 0x7A7A7A);
			horizontalRule.graphics.moveTo(customTextField1.x, customTextField1.y + 20);
			horizontalRule.graphics.lineTo(1002, customTextField1.y + 20);

			addChild(horizontalRule);
			
			// tag
			customFormat.size = 12;
			var customTextField2: TextField = new TextField();
			customTextField2.defaultTextFormat = customFormat;
			customTextField2.text = imgContent[0] + "      14";;
			customTextField2.x = customTextField1.x + 500;
			customTextField2.y = customTextField1.y + 30;
			customTextField2.autoSize = TextFieldAutoSize.RIGHT;
			
			addChild(customTextField2);
			
			// add button
			var customButton1: Loader = new Loader();
			var customRequest1: URLRequest = new URLRequest("img/add.png");
			customButton1.load(customRequest1);
			customButton1.x = customTextField1.x + 610;
			customButton1.y = customTextField1.y + 26;
			
			customButton1.addEventListener(MouseEvent.CLICK, onNameAddClick);
			addChild(customButton1);
			
			// new search button
			var customButton2: Loader = new Loader();
			var customRequest2: URLRequest = new URLRequest("img/search.png");
			customButton2.load(customRequest2);
			customButton2.x = customButton1.x + 30;
			customButton2.y = customButton1.y;
			
			customButton1.addEventListener(MouseEvent.CLICK, onNameSearchClick);
			addChild(customButton2);
			
		}
		
		public function onCloseClick(inEvent: MouseEvent): void {
				
			// show content
			for each (var newImg in globals.imgList) {
				TweenLite.to(newImg, 1, {alpha:1});
			}
			
			TweenLite.to(globals.guiObjects["labelTotalResults"], 1, {alpha:1});
			TweenLite.to(globals.guiObjects["labelPage"], 1, {alpha:1});
			TweenLite.to(globals.guiObjects["buttonPageBack"], 1, {alpha:1});
			TweenLite.to(globals.guiObjects["labelPageCurrent"], 1, {alpha:1});
			TweenLite.to(globals.guiObjects["buttonPageForward"], 1, {alpha:1});
			TweenLite.to(globals.guiObjects["labelPageOf"], 1, {alpha:1});
			TweenLite.to(globals.guiObjects["labelPageTotal"], 1, {alpha:1});
			TweenLite.to(globals.guiObjects["infoRule"], 1, {alpha:1});
			
			globals.myStage.destroyMetaView();
		
		}
		
		public function onNameAddClick(inEvent: MouseEvent): void {
		
			
		
		}
		
		public function onNameSearchClick(inEvent: MouseEvent): void {
		
			
		
		}
		
		public function onCountryAddClick(inEvent: MouseEvent): void {
		
			
		
		}
		
		public function onCountrySearchClick(inEvent: MouseEvent): void {
		
			
		
		}
		
		public function onDateAddClick(inEvent: MouseEvent): void {
		
			
		
		}		
		
		public function onDateSearchClick(inEvent: MouseEvent): void {
		
			
		
		}
		
		public function onTechnologyAddClick(inEvent: MouseEvent): void {
		
			
		
		}		
		
		public function onTechnologySearchClick(inEvent: MouseEvent): void {
		
			
		
		}
		
	}
	
}