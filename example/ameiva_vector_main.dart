import 'dart:html';

import 'package:ameiva/ameiva.dart' as ameiva;

var stage = ameiva.Setup(400, 400);

var boxPosition = Point(50, 0);
var boxVelocity = Point(1, 0); // Representation our vector direction

///var bulletPosition = Point(200, 0);

main() {
  var p1 = Point(1, 1); // Box
  var p2 = Point(0.90, 0); // Vector / velocity / direction

  var p = p1.addPoint(p2);

  print('${p.x} ${p.y}');

  stage.update(() {
    if (ameiva.keyboard.isPressed(KeyCode.RIGHT)) {
      //boxPosition += boxVelocity;
    }
    if (ameiva.keyboard.isPressed(KeyCode.LEFT)) {
      //boxPosition -= boxVelocity;
    }
    if (ameiva.keyboard.isPressed(KeyCode.DOWN)) {
      //boxVelocity = Point(0, 1);
      //boxPosition += boxVelocity;
    }

    boxPosition = boxPosition.addPoint(boxVelocity);
    print(boxPosition.x);
    // bulletPosition = Point(bulletPosition.x - boxVelocity.x, 0);

    if (boxPosition.x >= 350 || boxPosition.x <= 50)
      boxVelocity.x = -boxVelocity.x;
  });

  stage.renderScreen(() {
    stage.shape.rectangle(boxPosition.x, boxPosition.y, 32, 32);
    //stage.shape
    //  .rectangle(bulletPosition.x, 0, 32, 32, color: 'red');
  });
}

class Vector {
  num x, y;
  Vector(this.x, this.y);
}

class Point {
  double x, y;
  Point(this.x, this.y);

  Point addPoint(Point point) {
    Point newP = Point(0, 0);
    newP.x = x + point.x;
    newP.y = y + point.y;

    return newP;
  }
}
