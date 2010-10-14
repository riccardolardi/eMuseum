package {

	import flash.display.*;
	import flash.net.*;
	import flash.events.*;
	import flash.text.*;
	
	import globals;
	
	public class SearchImages extends Sprite {
	
		// instance variables
		var xmlLoader: URLLoader = new URLLoader();
		var xmlData: XML = new XML();
		var searchTerm: String;
	
		public function SearchImages(inSearchTerm): void {
		
			searchTerm = inSearchTerm;
		
			trace("SearchImages: new search started with term: " + searchTerm);
			
			// remove all images
			globals.myStage.destroyImgList();
			
			xmlLoader.addEventListener(Event.COMPLETE, loadedXML);
			xmlLoader.load(new URLRequest("http://mia-web.zhdk.ch/sobjekte/xml_suche/" + searchTerm));
		
		}
		
		public function loadedXML(inEvent: Event): void {
		
			xmlData = new XML(inEvent.target.data);
			getIDs(xmlData);
		
		}
		
		public function getIDs(xmlData) {

			globals.searchIDs = [];
		
			for each (var newID in xmlData.objekte_liste.objekt.attribute("id")) {
				
				globals.searchIDs.push(newID);
				
			}
			
			// create images
			var newImageDisplay: ImageDisplay = new ImageDisplay(globals.searchIDs);
			
			// new filter
			var newSearchFilter: SearchFilter = new SearchFilter(searchTerm);
			globals.myStage.addChild(newSearchFilter);
			globals.activeFilters.push(newSearchFilter);
		
		}
		
	}
	
}