import 'dart:async';
import 'dart:html';

import 'package:ameiva/src/api/keyboard.dart';

import '../../ameiva.dart';

enum Shape { rectangle, ellipse, line, circle }

class Ameiva extends Canvas {
  final int frameRate = 30;
  Function updateReference;

  Keyboard keyboard = Keyboard();

  draw(Shape shape, void f()) {}

  renderScreen(void f()) => loop(f);

  loop(void f()) {
    var timeFrame = 1000 ~/ frameRate;
    Timer.periodic(Duration(microseconds: timeFrame), (timer) {
      updateReference();
      clearScreen(color: 'black');
      f();
    });
  }

  update(void f()) {
    updateReference = f;
  }

  checkInput() {
    if (keyboard.isPressed(KeyCode.UP)) {
      print(KeyCode.UP);
      return KeyCode.UP;
    }
    if (keyboard.isPressed(KeyCode.RIGHT)) {
      print(KeyCode.RIGHT);
      return KeyCode.RIGHT;
    }
    if (keyboard.isPressed(KeyCode.DOWN)) {
      print(KeyCode.DOWN);
      return KeyCode.DOWN;
    }
    if (keyboard.isPressed(KeyCode.LEFT)) {
      print(KeyCode.LEFT);
      return KeyCode.LEFT;
    }
  }
}
