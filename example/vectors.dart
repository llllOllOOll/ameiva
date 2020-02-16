// Copyright (c) 2020, Raven Code.  MIT LICENSE
// @dart = 2.7

/**
 * Author: Raven Code
 * 
 *
 * Math for game developers
 */

// How to use vector to move objects on games and animation.
// The main function of vectors in game is control velocity and direction.
// We can use it to determine the distance between elements. (Vector length)
//
// Inversion of vectors
//
// We can invert a vector in the simple way, where is head becames tail and tail becames head
// To do that  in programming we just add -1  to the vector.

import 'dart:html';

// Create a Canvas and add it to the DOM  and get 2D context
// ths we will use their methods to draw on canvas.
var canvas = CanvasElement();
var context2D = canvas.context2D;

// Define a start Point for our box, x and y.
// Our velocity and direction will be set by a vector, boxVelocity, x and y.
// x positive the head is to the RIGTH, negativa to the LEFT
// the value inside x detemine the velocity.
var boxPosition = Point(0, 0);
var boxVelocity = Vector(3, 1);

// Start the main loop of animation / game
// call update, draw and loop again.
run() async {
  await window.requestAnimationFrame(loop);
}

loop(num timestamp) {
  update();
  draw();
  run();
}

// The vector is added to our boxPositon, a Point(x,y),
//
// boxPosition and boxVelocity (vector) details:
//
// boxPosition.x = 0;
// boxPositon.y = 0;
//
// boxVelocity.x = 3;
// boxVelocity.y = 1;
//
//  This operation : boxPosition += boxVelocity;
// to do that:
// boxPosition.x =  boxPosition.x  + boxVelocity.x
//             3                0  +             3
// boxPosition.y =  boxPosition.y  + boxVelocity.y
//             1                0  +             1
update() {
  boxPosition += boxVelocity;

  if (boxPosition.x >= 368 || boxPosition.x <= 0)
    boxVelocity.x = -boxVelocity.x; // Invertion of the vector -1

  if (boxPosition.y >= 368 || boxPosition.y <= 0)
    boxVelocity.y = -boxVelocity.y; // Invertion of the vector -1
}

draw() {
  context2D
    ..clearRect(0, 0, 400, 400)
    ..fillStyle = 'green'
    ..fillRect(boxPosition.x, boxPosition.y, 32, 32);
}

class Vector {
  num x, y;
  Vector([this.x, this.y]);

  String toString() => 'Vector($x, $y)';
}

class Point {
  double x, y;
  Point(this.x, this.y);

  // Operator Overlay
  // Allow us change an operato like ===, or, + , -
  // Here we change the minus to allow it adde a Vector to the current point
  // The x and y the will be adde to x and y to the point and will be returned a new point.
  Point operator -(Vector vector) {
    Point potision = Point(0, 0);

    potision.x = x - vector.x;
    potision.y = y - vector.y;

    return potision;
  }

  Point operator +(Vector vector) {
    Point position = Point(0, 0);

    position.x = x + vector.x;
    position.y = y + vector.y;

    return position;
  }
}

// Subtracting two points / vectors
// return a new vector with a result of the subtract.
Vector subPoints(Point a, Point b) {
  var v = Vector(); // Create a new vector in memory.

  v.x = a.x - b.x;
  v.y = a.y - b.y;

  return v;
}

void vectorSetup() {
  document.body.append(canvas);

  canvas
    ..setAttribute('width', '400')
    ..setAttribute('style', 'border: solid red')
    ..setAttribute('height', '400');

  var vector = subPoints(Point(0, -1), Point(1, 1));
  print(vector);

  run();
}
