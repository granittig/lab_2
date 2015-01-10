package game.graphics;
/*
	Спрайт с отображением текста "Уровень: Х Жизни: У Очки: УХ"
	Он отображается в самом низу экрана
*/

// подключим зависимости
import flash.display.*;
import flash.events.*;
import flash.text.*;
import game.data.*;

class ScoreText extends Sprite {
	private var gameplay:Gameplay;
	private var textField:TextField;

	public function new(gameplay:Gameplay) {
		super();
		// сохраним ссылку на объект геймплея, чтобы иметь
		// к нему доступ в событии updateTextFields
		this.gameplay = gameplay;

		// позиционирование внизу экрана
		y = Gameplay.SCREEN_HEIGHT * (3.0/4.0)
			+ Gameplay.SCREEN_HEIGHT * (1.0/4.0) * (3.0/4.0)
			+ 5;
		x = Gameplay.SCREEN_WIDTH / 2.0;

		// настроим шрифт
		var format:TextFormat = new TextFormat();
		format.size = 15;
		format.align = TextFormatAlign.CENTER;
		format.font = "Arial";

		// создадим текстовое поле
		textField = new TextField();
		textField.textColor = 0xFFFFFF;
		textField.border = false;
		textField.wordWrap = false;
		textField.width = 256;
		textField.height = 22;
		textField.selectable = false;
		textField.x = -128;
		textField.defaultTextFormat = format;
		textField.embedFonts = false;
		textField.antiAliasType = AntiAliasType.ADVANCED;
		addChild(textField);

		// слушаем событие отрисовки экрана
		addEventListener(Event.ENTER_FRAME, updateTextFields);
	}

	private function updateTextFields(event:Event):Void {
		// обновим текст
		textField.text =
		Texts.Level + gameplay.level + "  " +
		Texts.Lives + gameplay.lives + "  " +
		Texts.Score + gameplay.score + "  ";
	}
}