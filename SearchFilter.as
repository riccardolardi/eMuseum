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
		var filterItemsRedo: Array = new Array();
	
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
		
			var filterCount: Number = globals.activeFilters.length;
		
			customFormat.color = 0x7A7A7A;
			customFormat.size = 12;
			customFormat.font = "Helvetica";
			customFormat.align = "left";
			customTextField.antiAliasType = AntiAliasType.ADVANCED;
			customTextField.type = TextFieldType.DYNAMIC;
			customTextField.selectable = false;
			
			customTextField.defaultTextFormat = customFormat;
			customTextField.text = filterName + "      " + resultCount;
			customTextField.x = 170;
			customTextField.y = 100 + (filterCount * 30);
			customTextField.autoSize = TextFieldAutoSize.RIGHT;
			
			addChild(customTextField);
			
			var customButton: Loader = new Loader();
			var customRequest: URLRequest = new URLRequest("img/del.png");
			customButton.load(customRequest);
			customButton.x = 282;
			customButton.y = customTextField.y - 3;
			
			customButton.addEventListener(MouseEvent.CLICK, onClick);
			addChild(customButton);
			globals.activeFilters.push(this);
			
			feedFilterIDs();
		
		}
		
		public function feedFilterIDs(): void {
		
			switch (globals.activeFilters.length) {
				case 1:
					globals.filterIDs1 = [];
					break;
				case 2:
					globals.filterIDs2 = [];
					break;
				case 3:
					globals.filterIDs3 = [];
					break;
				case 4:
					globals.filterIDs4 = [];
					break;
				case 5:
					globals.filterIDs5 = [];
					break;
			}
		
			for each (var newID in xmlData.objekte_liste.objekt.attribute("id")) {
				switch (globals.activeFilters.length) {
					case 1:
						globals.filterIDs1.push(newID);
						break;
					case 2:
						globals.filterIDs2.push(newID);
						break;
					case 3:
						globals.filterIDs3.push(newID);
						break;
					case 4:
						globals.filterIDs4.push(newID);
						break;
					case 5:
						globals.filterIDs5.push(newID);
						break;
				}
			}
			
			globals.searchIDs = [];
			switch (globals.activeFilters.length)
				{
					case 0 :
						globals.myStage.createRandomImages();
					case 1 : 
						globals.searchIDs = globals.filterIDs1;
						break;
					case 2 :
						var result2 = schnitt(globals.filterIDs1, globals.filterIDs2);
						globals.searchIDs = result2;
						break;
					case 3 :
						var result2 = schnitt(globals.filterIDs1, globals.filterIDs2);
						var result3 = schnitt(result2, globals.filterIDs3);
						globals.searchIDs = result3;
						break;
					case 4 :
						var result2 = schnitt(globals.filterIDs1, globals.filterIDs2);
						var result3 = schnitt(result2, globals.filterIDs3);
						var result4 = schnitt(result3, globals.filterIDs4);
						globals.searchIDs = result4;
						break;
					case 5 :
						var result2 = schnitt(globals.filterIDs1, globals.filterIDs2);
						var result3 = schnitt(result2, globals.filterIDs3);
						var result4 = schnitt(result3, globals.filterIDs4);
						var result5 = schnitt(result4, globals.filterIDs5);
						globals.searchIDs = result5;
						break;
				}
				
				globals.guiObjects["labelTotalResults"].text = "Current total results   " + globals.searchIDs.length;
				
				// create images
				globals.myStage.destroyImgList();
				var newImageDisplay: ImageDisplay = new ImageDisplay(globals.searchIDs);
				
			//trace(globals.filterIDs1);
			//trace(globals.activeFilters.length);
		
		}
		
		public function onClick(inEvent: Event): void {
		
			globals.activeFilters.splice(globals.activeFilters.indexOf(this), 1);
			globals.myStage.removeChild(this);
			
			for each (var currentFilter in globals.activeFilters) {
				filterItemsRedo.push(currentFilter.customTextField.text.substr(0, currentFilter.customTextField.text.indexOf(" ")));
			}
			
			var newRedoFilterList: RedoFilterList = new RedoFilterList(filterItemsRedo);
			
			if (globals.activeFilters.length == 0) {
				globals.myStage.createRandomImages();
			}
		
		}
		
		public function schnitt(ina, inb)
		{
			var schnittlist: Array = new Array();
			for (var i:Number = 0; i < ina.length; i++)
			{
				for (var p:Number = 0; p < inb.length; p++)
				{
					if (ina[i] == inb[p])
					{
						schnittlist.push(ina[i]);
					}
				}
			}
			return schnittlist;

		}
		
	}
	
}