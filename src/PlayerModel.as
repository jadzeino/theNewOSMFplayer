package  
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author Ahmad Zeino
	 */
	public class PlayerModel extends EventDispatcher
	{
		private var _isPlaying:Boolean; 
		private var _mediaToPlay:String;
		private var _seekValue:Number;
		private var _volumeValue:Number;
		private var _isFinish:Boolean;
		
		public static var IS_FINISH:String="IS_FINISH"
		
		public function PlayerModel() 
		{
			
		}
		
		
		
		public function get mediaToPlay():String 
		{
			return _mediaToPlay;
		}
		
		public function set mediaToPlay(value:String):void 
		{
			_mediaToPlay = value;
		}
		
		public function get seekValue():Number 
		{
			return _seekValue;
		}
		
		public function set seekValue(value:Number):void 
		{
			_seekValue = value;
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		public function get isPlaying():Boolean 
		{
			return _isPlaying;
		}
		
		public function set isPlaying(value:Boolean):void 
		{
			_isPlaying = value;
		}
		
		public function get volumeValue():Number 
		{
			return _volumeValue;
		}
		
		public function set volumeValue(value:Number):void 
		{
			_volumeValue = value;
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		public function get isFinish():Boolean 
		{
			return _isFinish;
		}
		
		public function set isFinish(value:Boolean):void 
		{
			_isFinish = value;
			dispatchEvent(new Event(PlayerModel.IS_FINISH));
		}
			
		
	}

}