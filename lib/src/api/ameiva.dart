import 'dart:async';
import 'dart:html';

import 'package:ameiva/src/api/keyboard.dart';

import '../../ameiva.dart';

enum Shape { rectangle, ellipse, line, circle }
//CanvasElement canvasIntance = Canvas().getCanvasIntance();

class Ameiva extends Canvas {
  final int frameRate = 30;
  Function updateReference;

  Keyboard keyboard = Keyboard();

  var input = {'x': 0, 'y': 0};

  draw(Shape shape, void f()) {}

  renderScreen(void f()) => loop(f);

  loop(void f()) {
    var timeFrame = 1000 ~/ frameRate;
    Timer.periodic(Duration(microseconds: timeFrame), (timer) {
      checkInput();
      updateReference();
      clearScreen(color: 'black');
      f();
    });
  }

  update(void f()) {
    updateReference = f;
  }

  checkInput() {
    if (keyboard.isPressed(KeyCode.RIGHT)) {
      if (input['x'] < canvasIntance.width - 50) {
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
      if (input['y'] < canvasIntance.height - 50) {
        input['y'] += 1;
      }
      return;
    }
  }
}
