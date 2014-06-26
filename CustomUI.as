package {
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.net.URLRequest;

	import ValveLib.Globals;
	import ValveLib.ResizeManager;
	
	public class CustomUI extends MovieClip{
		
		public var gameAPI:Object;
		public var globals:Object;
		public var elementName:String;
						
		public function CustomUI() : void {
		}
				
		public function onLoaded() : void {			
			visible = true;
			
			Globals.instance.resizeManager.AddListener(this);
		}
				
		public function onResize(re:ResizeManager) : * {
			//handle the resize event - thanks to SinZ
			var resWidth:int = 0;
			var resHeight:int = 0;
			if (re.IsWidescreen()) {
				if (re.Is16by9()) {
					//16:9
					resWidth = 1600;
					resHeight = 900;
				} else {
					//16:10
					resWidth = 1280;
					resHeight = 768;
				}
			} else {
				//4:3
				resWidth = 1024;
				resHeight = 768;
			}

			var maxStageHeight:int = re.ScreenHeight / re.ScreenWidth * resWidth;
			var maxStageWidth:int = re.ScreenWidth / re.ScreenHeight * resHeight;
            // Scale hud to screen
            this.scaleX = re.ScreenWidth/maxStageWidth;
            this.scaleY = re.ScreenHeight/maxStageHeight;
		}
	}
}