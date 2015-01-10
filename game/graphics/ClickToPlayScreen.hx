package game.graphics;
/*
	Этот спрайт содержит в себе надпись "Нажмите для старта"
*/

// подключим зависимости
import flash.display.*;
import flash.events.*;
import flash.text.*;
import game.data.*;

class ClickToPlayScreen extends Sprite {
	private var play:Void -> Void;

	public function new(play:Void -> Void) {
		super();

		// сохраним ссылку на функцию старта уровня
		this.play = play;

		// зальем экран цветом, чтобы привлечь внимание
		// также это расширит область реакции на клик мыши
		graphics.beginFill(0xFFAACC, 0.2);
		graphics.drawRect(0,0,Gameplay.SCREEN_WIDTH,Gameplay.SCREEN_HEIGHT);
		graphics.endFill();

		// настроим шрифт
		var format:TextFormat = new TextFormat();
		format.size = 35;
		format.align = TextFormatAlign.CENTER;
		format.font = "Arial";

		// создадим текстовое поле
		var textField = new TextField();
		textField.textColor = 0xFFFFFF;
		textField.border = false;
		textField.wordWrap = false;
		textField.width = Gameplay.SCREEN_WIDTH;
		textField.height = 222;
		textField.selectable = false;
		textField.x = 0;
		textField.y = Gameplay.SCREEN_HEIGHT / 2;
		textField.defaultTextFormat = format;
		textField.embedFonts = false;
		textField.antiAliasType = AntiAliasType.ADVANCED;

		textField.text = Texts.ClickToStart;
		addChild(textField);

		// слушаем нажатие мышки
		addEventListener(MouseEvent.CLICK, onClick);
	}

	private function onClick(event:Event) {
		// уберем текущий спрайт из родителя,
		parent.removeChild(this);
		// и вызовем функцию старта игры
		this.play();
	}
}