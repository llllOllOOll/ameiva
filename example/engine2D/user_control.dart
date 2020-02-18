import 'dart:html';
import 'dart:math' as math;

import 'core.dart';

var width = Engine.Core.mWidth;
var height = Engine.Core.mHeight;
var context = Engine.Core.mContext;

userControl() {
  window.onKeyDown.listen((KeyboardEvent event) {
    var keycode = event.key;

    if (keycode == 'g') {
      print(keycode);

      context
        ..fillStyle = 'red'
        ..strokeRect(
            math.Random().nextInt(1) * width * 0.8,
            math.Random().nextInt(1) * height * 0.8,
            math.Random().nextInt(1) * 30 + 10,
            math.Random().nextInt(1) * 30 + 10)
        ..closePath()
        ..stroke();
    }
  });
}
