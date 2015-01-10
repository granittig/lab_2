package game.objects;
/*
	Спрайт игровой доски
*/

// подключим зависимости
import flash.display.*;
import flash.events.*;
import game.data.*;

class Paddle extends Sprite {
	public function new(){
		super();
		// отрисуем доску
		graphics.beginFill(0x5577FF);
		graphics.drawRect(-30,-5,60,10);
		graphics.endFill();

		// слушаем события
		addEventListener(Event.ENTER_FRAME, onFrame);
		addEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
	}

	private function onFrame(event:Event):Void {
		// позиционируем по координате курсора мыши
		x = stage.mouseX;

		// сделаем так, чтобы доска не выходила за границы экрана
		if(stage.mouseX < width / 2){
			x = width / 2;
		}

		if(stage.mouseX > Gameplay.SCREEN_WIDTH - width / 2){
			x = Gameplay.SCREEN_WIDTH - width / 2;
		}
	}

	private function onRemoved(event:Event):Void {
		// когда доска удаляется при проигрыше, необходимо удалить слушатели
		removeEventListener(Event.ENTER_FRAME, onFrame);
		removeEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
	}
}