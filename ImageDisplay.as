package {

	import flash.display.*;
	import flash.net.*;
	import flash.events.*;
	import flash.text.*;
	
	import globals;
	
	public class ImageDisplay extends Sprite {
	
		// instance variables
		var searchIDs: Array;
		var paging: Boolean = false;
		var beginSlice: Number;
		var endSlice: Number;
	
		public function ImageDisplay(inIDs, inPaging = false, inPagingDir = "forward"): void {
		
			paging = inPaging;
			searchIDs = inIDs;
		
			if (paging == true && inPagingDir == "forward") {
				
				endSlice = globals.currentPage * 12 - 1;
				beginSlice = endSlice - 11;
				
				searchIDs = searchIDs.slice(beginSlice, endSlice);
				
			} else if (paging == true && inPagingDir == "back") {
				
				endSlice = globals.currentPage * 12 - 13;
				beginSlice = endSlice - 23;
				if (beginSlice < 0) {beginSlice = 0;}
				
				searchIDs = searchIDs.slice(beginSlice, endSlice);
			}
			
			var loopLength = searchIDs.length - 1
			if (loopLength > 11) {loopLength = 11;}
			
			for (var i: Number = 0; i <= loopLength; i++) {
		
				var newImgX, newImgY: Number = 0;
				
				if (i < 4) {
					newImgX = 350 + (i*160);
					newImgY = 100;
				} else if (i < 8) {
					newImgX = 350 + ((i-4)*160);
					newImgY = 330;
				} else if (i < 12) {
					newImgX = 350 + ((i-8)*160);
					newImgY = 550;
				}
				
				// draw image
				var newImage = new ImageObj(searchIDs[i], "thumb", newImgX, newImgY);
				globals.myStage.addChild(newImage);
				globals.imgList.push(newImage);
			
			}
			
			if (paging == false) {
			
				globals.totalResults = searchIDs.length;
				updatePager();
			
			}
			
			// delete suggestions
			globals.myStage.destroyActiveSuggestions();
			
			// create suggestions
			for (var l: Number = 0; l <= 7; l++) {
				var newSuggestion: SearchSuggestion = new SearchSuggestion();
				globals.myStage.addChild(newSuggestion);
			}
		
		}
		
		public function updatePager(): void {
		
			var totalPages: Number;
			totalPages = Math.round(globals.totalResults / 12);
		
			if (totalPages == 0) {totalPages = 1;}
			globals.guiObjects["labelPageTotal"].text = totalPages;
		
		}
		
	}
	
}