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
	
		public function MetaDataView(inID): void {
		
			imgID = inID;
			
			xmlLoader.addEventListener(Event.COMPLETE, loadedXML);
			xmlLoader.load(new URLRequest("http://mia-web.zhdk.ch/sobjekte/xml/" + imgID));
		
		}
		
		public function loadedXML(inEvent: Event): void {
		
			xmlData = new XML(inEvent.target.data);
			
			imgName = xmlData.titel;
			imgCountry = xmlData.marken_liste.marke.(schluessel == "Land").wert;
			imgDate = xmlData.marken_liste.marke.(schluessel == "Datum Erfassung").wert;
			
			var searchContent: XMLList = xmlData.marken_liste.marke.(schluessel == "Stichwort Bildinhalt").wert;
			for each (var thisContent: String in searchContent) {
				// BIG TODO pushing string to array throws error
				imgContent.push(thisContent.toString());
			}
		
		}
		
	}
	
}