package {

	import flash.display.*;
	import flash.net.*;
	import flash.events.*;
	import flash.text.*;
	
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	
	import globals;
	
	public class SingleImage extends Sprite {
	
		// instance variables
		var imgFilePath: String;
		var imgTitle: String;
		var newImage: Loader = new Loader();
		var imgID: Number;
		var customFormat: TextFormat = new TextFormat();
		var customTextField: TextField = new TextField();
	
		public function SingleImage(inPath, inTitle, inID): void {
		
			imgFilePath = inPath;
			imgTitle = inTitle;
			imgID = inID;
			
			if (imgTitle.length > 50) {
				imgTitle = imgTitle.substr(0, 50) + " [...]";
			}
			
			// write title
			customFormat.color = 0x7A7A7A;
			customFormat.size = 12;
			customFormat.font = "Helvetica";
			customFormat.align = "left";
			customTextField.antiAliasType = AntiAliasType.ADVANCED;
			customTextField.type = TextFieldType.DYNAMIC;
			customTextField.selectable = false;
			customTextField.defaultTextFormat = customFormat;
			customTextField.text = imgTitle;
			customTextField.x = 450;
			customTextField.y = 85;
			customTextField.autoSize = TextFieldAutoSize.LEFT;
			customTextField.alpha = 0;
			
			addChild(customTextField);
			TweenLite.to(customTextField, 1, {alpha:1});
			
			var imgPath: String = "http://sammlungen-archive.zhdk.ch/media/full/" + imgFilePath;
			var customRequest: URLRequest = new URLRequest(imgPath);
			newImage.load(customRequest);
			
			// hide content
			for each (var newImg in globals.imgList) {
				TweenLite.to(newImg, 1, {alpha:0});
			}
			
			TweenLite.to(globals.guiObjects["labelPage"], 1, {alpha:0});
			TweenLite.to(globals.guiObjects["buttonPageBack"], 1, {alpha:0});
			TweenLite.to(globals.guiObjects["labelPageCurrent"], 1, {alpha:0});
			TweenLite.to(globals.guiObjects["buttonPageForward"], 1, {alpha:0});
			TweenLite.to(globals.guiObjects["labelPageOf"], 1, {alpha:0});
			TweenLite.to(globals.guiObjects["labelPageTotal"], 1, {alpha:0});
			
			TweenLite.to(globals.guiObjects["labelSort"], 1, {alpha:0});
			TweenLite.to(globals.guiObjects["buttonSortName"], 1, {alpha:0});
			TweenLite.to(globals.guiObjects["buttonSortDate"], 1, {alpha:0});
			TweenLite.to(globals.guiObjects["buttonSortCountry"], 1, {alpha:0});
			
			newImage.x = 450;
			newImage.y = 100;
			newImage.alpha = 0;
			addChild(newImage);
			TweenLite.to(newImage, 1, {alpha:1});
			
			addEventListener(MouseEvent.CLICK, onClick);
		
		}
		
		public function onClick(inEvent: Event): void {
		
			TweenLite.to(newImage, 1, {alpha:0});
			TweenLite.to(customTextField, 1, {alpha:0});
			
			// display meta data view
			var displayMetaDataView: MetaDataView = new MetaDataView(imgID);
			globals.myStage.addChild(displayMetaDataView);
			
			/*
			
			globals.myStage.destroySingleImage();
		
			for each (var newImg in globals.imgList) {
				TweenLite.to(newImg, 1, {alpha:1});
			}
			
			TweenLite.to(globals.guiObjects["labelPage"], 1, {alpha:1});
			TweenLite.to(globals.guiObjects["buttonPageBack"], 1, {alpha:1});
			TweenLite.to(globals.guiObjects["labelPageCurrent"], 1, {alpha:1});
			TweenLite.to(globals.guiObjects["buttonPageForward"], 1, {alpha:1});
			TweenLite.to(globals.guiObjects["labelPageOf"], 1, {alpha:1});
			TweenLite.to(globals.guiObjects["labelPageTotal"], 1, {alpha:1});
			
			TweenLite.to(globals.guiObjects["labelSort"], 1, {alpha:1});
			TweenLite.to(globals.guiObjects["buttonSortName"], 1, {alpha:1});
			TweenLite.to(globals.guiObjects["buttonSortDate"], 1, {alpha:1});
			TweenLite.to(globals.guiObjects["buttonSortCountry"], 1, {alpha:1});
			
			*/
		
		}
		
	}
	
}