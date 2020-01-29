import 'dart:async';
import 'dart:html';

import 'components/canvas.dart';
import 'components/shapes.dart';
import 'keyboard.dart';

class Setup {
  final int frameRate = 30;
  Function updateReference;

  Canvas canvas;
  Shape shape;
  Keyboard keyboard;

  var input = {'x': 0, 'y': 0};

  Setup(canvasWidth, canvasHeight) {
    this.canvas = Canvas(canvasWidth, canvasHeight);
    this.shape = Shape(this.canvas);
    this.keyboard = Keyboard();
  }

  update(void f()) {
    updateReference = f;
  }

  renderScreen(void f()) => loop(f);

  loop(void f()) {
    var timeFrame = 1000 ~/ frameRate;
    Timer.periodic(Duration(microseconds: timeFrame), (timer) {
      checkInput();
      
      updateReference == null ? null:   updateReference();

      shape.clearScreen(color: 'black');
      f();
    });
  }


  checkInput() {
    if (keyboard.isPressed(KeyCode.RIGHT)) {
      if (input['x'] < canvas.canvasInstance.width - 50) {
        input['x'] += 1;
      }
      return;
    }

    if (keyboard.isPressed(KeyCode.LEFT)) {
      if (input['x'] > 0) {
        input['x'] -= 1;
      }
      return;
    }

    if (keyboard.isPressed(KeyCode.UP)) {
      if (input['y'] > 0) {
        input['y'] -= 1;
      }
      return;
    }

    if (keyboard.isPressed(KeyCode.DOWN)) {
      if (input['y'] < canvas.canvasInstance.height - 50) {
        input['y'] += 1;
      }
      return;
    }
  }
}
