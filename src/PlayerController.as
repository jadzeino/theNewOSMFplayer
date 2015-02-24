package  
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author Ahmad Zeino
	 */
	public class PlayerController extends EventDispatcher
	{
		public var playerModel:PlayerModel;
		public function PlayerController(pModel:PlayerModel) 
		{
			playerModel = pModel;
			
		}
		
		public function seekVideoBar(val:Number):void
		{
			playerModel.seekValue = val;
		}
		
		public function updateVolumeVideoBar(val:Number):void
		{
			playerModel.volumeValue = val;
		}
		public function finishTheVideo(val:Boolean):void
		{
			playerModel.isFinish=val;
		}
		
	}

}