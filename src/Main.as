package src {
	//import src.*;
	import src.PlayerController;
	import src.PlayerModel
	import src.PlayerView
	//import src.playerController.playPause.playPauseModel
	//import src.playerController.playPause.playPauseController
	//import src.playerController.playPause.playPauseView
	import flash.display.Sprite
	//import src.playerController.seekBar.SeekBarController;
	//import src.playerController.seekBar.SeekBarModel;
	//import src.playerController.seekBar.SeekBarView;
	//import src.playerController.volumeBar.VolumeBarController;
	//import src.playerController.volumeBar.VolumeBarModel;
	//import src.playerController.volumeBar.VolumeBarView;
	
	public class Main extends Sprite{

		public function Main() {
			// constructor code
			//var myPlayPauseModel:playPauseModel=new playPauseModel()
			//var myPlayPauseController:playPauseController=new playPauseController(myPlayPauseModel)
			//var myPlayPauseView:playPauseView=new playPauseView(myPlayPauseModel,myPlayPauseController)
			//addChild(myPlayPauseView)
			trace("wow this working");
			///////////////////////////////////
			/*var mySeekBarModel:SeekBarModel=new SeekBarModel()
			var mySeekBarController:SeekBarController=new SeekBarController(mySeekBarModel)
			var mySeekBarView:SeekBarView=new SeekBarView(mySeekBarModel,mySeekBarController)
			addChild(mySeekBarView);*/
			
			/*var myVolumeBarModel:VolumeBarModel=new VolumeBarModel()
			var myVolumeBarController:VolumeBarController=new VolumeBarController(myVolumeBarModel)
			var myVolumeBarView:VolumeBarView=new VolumeBarView(myVolumeBarModel,myVolumeBarController)
			addChild(myVolumeBarView);*/
			
			var myPlayerModel:PlayerModel = new PlayerModel()
			var myPlayerControl:PlayerController = new PlayerController(myPlayerModel);
			var myPlayerView:PlayerView = new PlayerView(myPlayerModel, myPlayerControl);
			addChild(myPlayerView)
			/*var myPlayerModel:PlayerModel=new PlayerModel()
			var myPlayerController:PlayerController=new PlayerController(myPlayerModel)
			var myPlayerView:PlayerView=new PlayerView(myPlayerModel,myPlayerController)
			addChild(myPlayerView);*/
			
			
		}

	}
	
}
