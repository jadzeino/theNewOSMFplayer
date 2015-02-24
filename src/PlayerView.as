package  
{
	import fl.controls.Slider;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import fl.controls.Button
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import org.osmf.containers.MediaContainer;
	import org.osmf.media.MediaPlayer;
	import org.osmf.layout.LayoutMetadata; 
	import org.osmf.media.MediaElement; 
	import org.osmf.media.MediaFactory; 
	import org.osmf.media.DefaultMediaFactory; 
	import org.osmf.media.URLResource; 
	import org.osmf.net.NetStreamCodes;
	//osmf event imports
	import org.osmf.events.MediaPlayerCapabilityChangeEvent;
	import org.osmf.events.MediaErrorEvent;
	import org.osmf.events.MediaPlayerStateChangeEvent;
	import org.osmf.events.TimeEvent;
	import org.osmf.events.MediaElementEvent;
	/**
	 * ...
	 * @author Ahmad Zeino
	 */
	public class PlayerView extends Sprite
	{
		public var mc_progressBar:Sprite;
		public var _mediaPlayer:MediaPlayer;
		public var _mediaFactory:MediaFactory
		
		public var playerModel:PlayerModel;
		public var playerController:PlayerController;
		public var _mediaElement:MediaElement;

		public var _mediaContainer:MediaContainer;
		public var _layout:LayoutMetadata;
		
		public var btn_pause:Button;
		public function PlayerView(pModel:PlayerModel,pController:PlayerController) 
		{
			playerModel = pModel;
			playerController = pController;
			//
			addEventListener(Event.ADDED_TO_STAGE,addedToStage)
		}
		
		private function addedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			_buildUI()
			_setupOSMF() ;
			_playVideo("MEDIA/video.flv");
		}
		
		private function _buildUI():void 
		{
			//build PlayPauseBTN
			btn_pause = new Button();
			btn_pause.label = "Pause";
			btn_pause.x=5;
			btn_pause.y=375;
			addChild(btn_pause)
			//listen for the mouse click event on the pause button and call onBtnPauseClick
			btn_pause.addEventListener( MouseEvent.CLICK , _onBtnPauseClick );
			
			//build the volume bar
			var sl_volume:Slider = new Slider()
			sl_volume.minimum = 0;
			sl_volume.maximum = 1;
			sl_volume.snapInterval = 0.05;
			sl_volume.tickInterval=0.2
			sl_volume.x = 435
			sl_volume.y=382
			addChild(sl_volume);
			//listen for the change event on the volume slider and call onVolumeSliderChange
			sl_volume.addEventListener( Event.CHANGE , _onVolumeSliderChange );
			
			
			//build the seek bar
			mc_progressBar = new Sprite()
			addChild(mc_progressBar)
			//
			var mc_bg:Sprite = new Sprite()
			mc_bg.name="mc_bg"
			mc_bg.graphics.lineStyle(1)
			mc_bg.graphics.beginFill(0x666666)
			mc_bg.graphics.drawRect(0,0,275,21)
			mc_bg.graphics.endFill()
			mc_progressBar.addChild(mc_bg)
			
			var mc_currentPosition:Sprite = new Sprite()
			mc_currentPosition.name="mc_currentPosition"
			mc_currentPosition.graphics.lineStyle(1)
			mc_currentPosition.graphics.beginFill(0x999999)
			mc_currentPosition.graphics.drawRect(0,0,275,21)
			mc_currentPosition.graphics.endFill()
			mc_progressBar.addChild(mc_currentPosition)
			
			var mc_nub:Sprite = new Sprite()
			mc_nub.name="mc_nub"
			var mc_Inner:Sprite=new Sprite()
			mc_Inner.graphics.lineStyle(1)
			mc_Inner.graphics.beginFill(0xCCCCCC)
			mc_Inner.graphics.drawRect(0,0,21,21)
			mc_Inner.graphics.endFill()
			mc_Inner.x=-(mc_Inner.width/2)
			addChild(mc_nub)
			//
			mc_nub.addChild(mc_Inner)
			mc_progressBar.addChild(mc_nub)
			
			mc_progressBar.buttonMode = true;
			
			mc_progressBar.x = stage.width / 2 - mc_progressBar.width / 2;
			mc_progressBar.y=(stage.stageHeight-mc_progressBar.height)-3;
			//listen for the mouse down event on the progress bar and call onProgressBarMouseDown
			mc_progressBar.addEventListener( MouseEvent.MOUSE_DOWN , _onProgressBarMouseDown );
			
			playerModel.addEventListener(PlayerModel.IS_FINISH,handelfinish)
			
			
		}
		private function _setupOSMF ( ) : void
		{
			_mediaPlayer = new MediaPlayer(); 
			_mediaPlayer.autoRewind = false ;
			_mediaPlayer.addEventListener ( TimeEvent.CURRENT_TIME_CHANGE , _onCurrentTimeChange , false , 0 , true ) ;
			_mediaPlayer.addEventListener ( MediaPlayerCapabilityChangeEvent.CAN_LOAD_CHANGE , _onCanLoadChange , false , 0 , true ) ;
			_mediaPlayer.addEventListener ( MediaPlayerCapabilityChangeEvent.CAN_PLAY_CHANGE , _onCanPlayChange , false , 0 , true ) ;
			_mediaPlayer.addEventListener ( MediaPlayerCapabilityChangeEvent.CAN_SEEK_CHANGE , _onCanSeekChange , false , 0 , true ) ;
			_mediaPlayer.addEventListener ( MediaErrorEvent.MEDIA_ERROR , _onMediaError , false , 0 , true ) ;
			_mediaPlayer.addEventListener ( MediaPlayerStateChangeEvent.MEDIA_PLAYER_STATE_CHANGE , _onMediaPlayerStateChange , false , 0 , true ) ;
			/*_mediaPlayer.autoPlay = false; */
			_mediaFactory = new DefaultMediaFactory(); 
			_layout = new LayoutMetadata(); 
			_layout.width = 550//mc_videoDisplay.width-2; 
			_layout.height = 370//mc_videoDisplay.height-2; 
			
			_mediaContainer = new MediaContainer(); 
			addChild(_mediaContainer); 
		}
		
		private function _onCanSeekChange(e:MediaPlayerCapabilityChangeEvent):void 
		{
			
		}
		
		private function _onCanPlayChange(e:MediaPlayerCapabilityChangeEvent):void 
		{
			
		}
		
		private function _onMediaPlayerStateChange(e:MediaPlayerStateChangeEvent):void 
		{
			trace ( "_onMediaPlayerStateChange () , e.state : " + e.state ) ;
			switch ( e.state )
			{
			 	case "playing":
					break ;
			 	case "loading":
					//_disableControls ( ) ;
					break;
			 	case "buffering":
					break;
			 	case "uninitialized":
					//_disableControls ( ) ;
					break;
			 	case "ready":
					playerController.finishTheVideo(true)
					//_disableControls ( ) ;
					//_cleanUpVideo ( ) ;
					break;
				default :
					break;
			}
		}
		
		private function _onMediaError(e:MediaErrorEvent):void 
		{
			
		}
		
		private function _onCanLoadChange(e:MediaPlayerCapabilityChangeEvent):void 
		{
			
		}
		
		private function _onCurrentTimeChange(e:TimeEvent):void 
		{
			/*trace ( "_onCurrentTimeChange () , evt.time : " + evt.time ) ;*/
			_updateProgressBar ( e.time / _mediaPlayer.duration ) ;
		}
		/*
			updateProgressBar is called to update the visual status of the progress bar
			so the nub and current position indicators remain accurate as the video plays
		*/
		private function _updateProgressBar( percentIn : Number ):void {
			//set the x position of the progress nub
			//and the width of the current position indicator
			//to the product of the progress bar background 
			//and the percentIn (passed in when this function is called)
			//trace("mc_progressBar.getChildByName('mc_nub').x "+ mc_progressBar.getChildByName("mc_nub").x)
			mc_progressBar.getChildByName("mc_nub").x = mc_progressBar.getChildByName("mc_currentPosition").width = Math.floor(percentIn*mc_progressBar.getChildByName("mc_bg").width);
		}
		private function _onProgressBarMouseDown(e:MouseEvent):void 
		{
			//calculate the percentage into our video the user wishes to seek
			//based on where in the progressbar they clicked//mc.bg
			var seekTo : Number = ( e.localX / mc_progressBar.width );
			playerController.seekVideoBar(seekTo);
			playerModel.addEventListener(Event.CHANGE,HandelUpdate)
			
		}
		private function handelfinish(e:Event):void 
		{
			trace("handelfinish")
			//pause the video
			_mediaPlayer.pause( );
			//change the label on the play/pause button to 'Play'
			btn_pause.label="Play";
			
		}
		private function HandelUpdate(e:Event):void 
		{
			trace("HandelUpdate")
			_seekVideo(playerModel.seekValue);
		}
		/*
			seekVideo is called to jump to another part of our video
			with a percentage into the video to seek (e.g., 50% for half way)
		*/
		private function _seekVideo( seekTo : Number ):void {
			//if the player can see to the specified point
			if (_mediaPlayer.canSeekTo(seekTo*_mediaPlayer.duration))
				//tell the MediaPlayer instance to seek to the specified seconds into the video
				//by multiplying the seek percentage times the duration of the currently-loaded video
				_mediaPlayer.seek( seekTo * _mediaPlayer.duration );
		}
		
		private function _onVolumeSliderChange(e:Event):void 
		{
			playerController.updateVolumeVideoBar(e.target.value);
			playerModel.addEventListener(Event.CHANGE,HandelVolumeChange)
		}
		
		private function HandelVolumeChange(e:Event):void 
		{
			//update the volume of the video to the selected value of the slider
			_mediaPlayer.volume=playerModel.volumeValue;
		}
		
		private function _onBtnPauseClick(e:MouseEvent):void 
		{
			_togglePause();
		}
		private function _togglePause ( ) : void
		{
			/*trace ( "_togglePause() " ) ;*/
			//if the video is currently paused
			if (!_mediaPlayer.playing) {
				//play the video
				_mediaPlayer.play( );
				//change the label on the play/pause button to 'Pause'
				btn_pause.label="Pause";
			} else {
				//pause the video
				_mediaPlayer.pause( );
				//change the label on the play/pause button to 'Play'
				btn_pause.label="Play";
			}
		}
		
		/*
			playVideo is called with a specific video to play
			This function
		*/
		private function _playVideo( videoToPlay : String ):void {
			//call cleanUpVideo to clear out the video, in case one 
			//is currently loaded, and to reset the navigation to a disabled state
			//_cleanUpVideo( );
			_mediaElement = _mediaFactory.createMediaElement(new URLResource(videoToPlay)); 
			_mediaElement.addMetadata(LayoutMetadata.LAYOUT_NAMESPACE, _layout); 
			_mediaPlayer.media = _mediaElement; 
			_mediaContainer.addMediaElement(_mediaElement); 
		}
		
		
	}

}