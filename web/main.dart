import 'dart:html';
import 'dart:math';

import 'package:ameiva/ameiva.dart';

void main() {
  var ameiva = Ameiva();

  var y = 0;
  var x = 200;

  var positionX = 0;
  var positionY = 0;

  ameiva.createCanvas(400, 400);

  ameiva.update(() {
    var keyPressed = ameiva.checkInput();

    if (keyPressed == KeyCode.RIGHT) {
      positionX = positionX + 1;
    }
    if (keyPressed == KeyCode.LEFT) {
      positionX = positionX - 1;
    }
    if (keyPressed == KeyCode.UP) {
      positionY = positionY - 1;
    }
    if (keyPressed == KeyCode.DOWN) {
      positionY = positionY + 1;
    }

    y = y - 1;
    y < 0 ? y = 400 : null;

    x = x + 1;
    x > 400 ? x = 0 : null;
  });

  face() {
    ellipse(200, 200, 140, 0 * pi, 2 * pi);
    ellipse(150, 150, 30, 0 * pi, 2 * pi);
    ellipse(250, 150, 30, 0 * pi, 2 * pi);
    ellipse(250, 150, 40, 0 * pi, 1 * pi);
    ellipse(150, 150, 40, 0 * pi, 1 * pi);
    ellipse(200, 260, 40, 0 * pi, 1 * pi);
    ellipse(200, 200, 20, 0 * pi, 2 * pi);
    ellipse(170, 150, 10, 0 * pi, 2 * pi);
    ellipse(270, 150, 10, 0 * pi, 2 * pi);
  }

  ameiva.renderScreen(() {
    ameiva.draw(Shape.circle, () {});

    face();
    line(0, y, 400, y, 'blue');
    line(x, 0, x, 400, 'red');

    rectangle(positionX, positionY, 50, 50, 'gray');
  });
}
