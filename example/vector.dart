import 'dart:html';
import 'dart:math';

var canvas = CanvasElement();
var context2D = canvas.context2D;

var boxPosition = Point(0, 0);
var boxVelocity = Point(3, 0);
//var boxVelocity = Vector(3, 1);

run() async {
  await window.requestAnimationFrame(loop);
}

loop(num timestamp) {
  update();
  draw();
  run();
}

update() {
  boxPosition += boxVelocity;

//  if (boxPosition.x >= 368 || boxPosition.x <= 0)
  //boxVelocity.x = -boxVelocity.x; // Invertion of the vector -1
  // box -= boxVelocity;

  // if (boxPosition.y >= 368 || boxPosition.y <= 0)
  //   boxVelocity.y = -boxVelocity.y; // Invertion of the vector -1
}

draw() {
  context2D
    ..clearRect(0, 0, 400, 400)
    ..fillStyle = 'green'
    ..fillRect(boxPosition.x, boxPosition.y, 32, 32);
}

// class Vector {
//   num x, y;
//   Vector(this.x, this.y);
// }

// class Point {
//   double x, y;
//   Point(this.x, this.y);

//   Point operator -(Vector vector) {
//     Point potision = Point(0, 0);

//     potision.x = x - vector.x;
//     potision.y = y - vector.y;

//     return potision;
//   }

//   Point operator +(Vector vector) {
//     Point potision = Point(0, 0);

//     potision.x = x + vector.x;
//     potision.y = y + vector.y;

//     return potision;
//   }
// }

void main() {
  document.body.append(canvas);

  canvas
    ..setAttribute('width', '400')
    ..setAttribute('style', 'border: solid red')
    ..setAttribute('height', '400');

  run();
}
