package {

	import flash.display.*;
	import flash.net.*;
	import flash.events.*;
	import flash.text.*;
	
	import globals;
	
	public class RedoFilterList extends Sprite {
	
		// instance variables
		var filterList: Array = new Array();
	
		public function RedoFilterList(inFilterList): void {
		
			filterList = inFilterList;
			
			globals.myStage.destroyActiveFilters();
			
			for each (var currentFilter in filterList) {
				var newSearchFilter: SearchFilter = new SearchFilter(currentFilter);
				globals.myStage.addChild(newSearchFilter);
			}
		
		}
		
	}
	
}