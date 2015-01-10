package game.graphics;
/*
	Спрайт с отображением текста "Уровень: Х Очки: У"
	Он отображается ТОЛЬКО поверх спрайтов с сообщением победы или проигрыша
*/

// подключим зависимости
import flash.display.*;
import flash.events.*;
import flash.text.*;
import game.data.*;

class FinalScore extends Sprite {
	public function new(score:Int, level:Int) {
		super();

		// настроим шрифт
		var format:TextFormat = new TextFormat();
		format.size = 15;
		format.align = TextFormatAlign.CENTER;
		format.font = "Arial";

		// создадим текстовое поле
		var textField = new TextField();
		textField.textColor = 0xFFFFFF;
		textField.border = false;
		textField.wordWrap = false;
		textField.width = 222;
		textField.height = 22;
		textField.selectable = false;
		textField.x = -111;
		textField.defaultTextFormat = format;
		textField.embedFonts = false;
		textField.antiAliasType = AntiAliasType.ADVANCED;
		addChild(textField);

		// установим текст
		textField.text =
		Texts.Level + level + "  " +
		Texts.Score + score + "  ";

		// разместим чуть ниже центра экрана
		x = Gameplay.SCREEN_WIDTH / 2.0;
		y = Gameplay.SCREEN_HEIGHT / 2.0 + 35;
	}
}