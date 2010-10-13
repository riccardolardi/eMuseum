package {

	import flash.display.*;
	import flash.net.*;
	import flash.events.*;
	import flash.text.*;
	
	import globals;
	
	public class Main extends Sprite {
	
		public function Main(): void {
		
			// setup environment
			addEventListener(Event.ADDED_TO_STAGE, initEnd);
		
		}
		
		public function initEnd(inEvent: Event): void {
		
			removeEventListener (Event.ADDED_TO_STAGE, initEnd);
			
			// save stage reference to globals
			globals.myStage = this;
			
			// create gui elements
			createHeader();
			createFilter();
			createSuggestions();
			createContent();
			
			// load random images
			createRandomImages();
		
		}
		
		public function createHeader(): void {
		
			// create app title
			var labelAppTitle: GUIelement = new GUIelement("labelAppTitle");
			
			// create search input field
			var inputNewSearch: GUIelement = new GUIelement("inputNewSearch");
			
			// create horizontal rule
			var horizontalRule: GUIelement = new GUIelement("horizontalRule");
		
		}
		
		public function createFilter(): void {
		
			// create filter area
			var areaFilter: GUIelement = new GUIelement("areaFilter");
			
			// create new filter input field
			var inputNewFilter: GUIelement = new GUIelement("inputNewFilter");
			
			// create refresh button
			var buttonRefresh: GUIelement = new GUIelement("buttonRefresh");
		
		}
		
		public function createSuggestions(): void {
		
			// create suggestions area
			var areaSuggestions: GUIelement = new GUIelement("areaSuggestions");
		
		}
		
		public function createContent(): void {
		
			// create sort label
			var labelSort: GUIelement = new GUIelement("labelSort");
			
			// create sort date button
			var buttonSortDate: GUIelement = new GUIelement("buttonSortDate");
			
			// create sort separator rule 1
			var separatorRule1: GUIelement = new GUIelement("separatorRule1");
			
			// create sort name button
			var buttonSortName: GUIelement = new GUIelement("buttonSortName");
			
			// create sort separator rule 2
			var separatorRule2: GUIelement = new GUIelement("separatorRule2");
			
			// create sort country button
			var buttonSortCountry: GUIelement = new GUIelement("buttonSortCountry");
		
		}
		
		public function createPager(): void {
		
			// create page label
			var labelPage: GUIelement = new GUIelement("labelPage");
			
			// create page back button
			var buttonPageBack: GUIelement = new GUIelement("buttonPageback");
			
			// create label page current
			var labelPageCurrent: GUIelement = new GUIelement("labelPageCurrent");
			
			// create page forward button
			var buttonPageForward: GUIelement = new GUIelement("buttonPageForward");
			
			// create 'of' label
			var labelPageOf: GUIelement = new GUIelement("labelPageOf");
			
			// create page total label
			var labelPageTotal: GUIelement = new GUIelement("labelPageTotal");
		
		}
		
		public function createRandomImages(): void {
		
			// TODO
		
		}
	
	}
	
}