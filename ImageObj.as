package {

	import flash.display.*;
	import flash.net.*;
	import flash.events.*;
	import flash.text.*;
	import XML;
	import XMLList;
	import flash.ui.Mouse;
	
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	
	import globals;
	
	public class ImageObj extends Sprite {
	
		// instance variables
		var xmlLoader: URLLoader = new URLLoader();
		var xmlData: XML = new XML();
		var imgType: String;
		var imgX, imgY: Number;
		var imgID: Number;
		var imgFilePath: String;
		var imgTitle: String;
		
		public function ImageObj(
			inID: Number = 2424, 
			inType: String = "thumb", 
			inX: Number = 0, 
			inY: Number = 0): void {
			
			imgID = inID;
			
			if (inType == "thumb") {
				imgType = "thumbnails";
			} else {
				imgType = "full";
			}
			
			imgX = inX;
			imgY = inY;
			
			xmlLoader.addEventListener(Event.COMPLETE, loadedXML);
			xmlLoader.load(new URLRequest("http://mia-web.zhdk.ch/sobjekte/xml/" + imgID));
			
			addEventListener(MouseEvent.CLICK, onClick);
			addEventListener(MouseEvent.ROLL_OVER, onRoll);
			addEventListener(MouseEvent.ROLL_OUT, onRoll);
		
		}
		
		public function loadedXML(inEvent: Event): void {
		
			xmlData = new XML(inEvent.target.data);
			drawImage(xmlData);
		
		}
		
		public function drawImage(xmlData): void {
		
			imgFilePath = xmlData.bildpfad;
			imgTitle = xmlData.titel;
			var imgPath: String = "http://sammlungen-archive.zhdk.ch/media/" + imgType + "/" + imgFilePath;
			
			var newImage: Loader = new Loader();
			var customRequest: URLRequest = new URLRequest(imgPath);
			newImage.load(customRequest);
			
			newImage.x = imgX;
			newImage.y = imgY;
			
			newImage.alpha = 0;
			addChild(newImage);
			TweenLite.to(newImage, 1, {alpha:1});
		
		}
		
		public function onClick(inEvent: Event): void {
		
			var newSingleImage: SingleImage = new SingleImage(imgFilePath, imgTitle, imgID);
			globals.singleImage.push(newSingleImage);
			globals.myStage.addChild(newSingleImage);
		
		}
		
		public function onRoll(inEvent: Event) {
			switch (inEvent.type) {
				case "rollOver":
					Mouse.cursor="button";
					break;
				case "rollOut":
					Mouse.cursor="auto";
					break;
			}
		}
		
	}
	
}