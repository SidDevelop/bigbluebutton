package org.bigbluebutton.modules.videoconf.views
{
    import flash.display.Loader;
    import flash.events.Event;
    import flash.net.URLRequest;
    import mx.events.FlexEvent;
    import mx.utils.ObjectUtil;

    public class UserAvatar extends UserGraphic {

      private var _imageLoader:Loader = null;
      private var _completed:Boolean;

      public function UserAvatar() {
      }

      public function load(avatarUrl:String):void {
          _imageLoader = new Loader;
          _completed = false;

          _imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadingComplete);
          addChild(_imageLoader);
          var request:URLRequest = new URLRequest(avatarUrl);
          _imageLoader.load(request);
      }

      private function onLoadingComplete(event:Event):void {
//          trace("=============> onLoadingComplete " + _imageLoader.width + " " + _imageLoader.height);
          setOriginalDimensions(_imageLoader.width, _imageLoader.height);
          _completed = true;
      }

      override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
          super.updateDisplayList(unscaledWidth, unscaledHeight);

          if (_completed) {
              resetGraphicDimensions(_imageLoader, unscaledWidth, unscaledHeight);
          }
      }

    }
}