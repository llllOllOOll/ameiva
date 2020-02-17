import 'dart:html';

import 'vector.dart' as vect;
import 'falling_stars/helpers.dart';

const COLOR_PALLETE = [
  'yellow',
  'blue',
  'red',
  'orange',
  'turquoise',
  'purple',
  'green',
  'lightblue',
  'lightyellow',
  'lightgreen',
  'darkred',
  'darkblue',
  'darkorange',
  'darkturquoise',
  'darkgreen'
];

var canvas = CanvasElement();
var context2D = canvas.context2D;

var boxPosition = vect.Point(0, 0);
var boxVelocity = vect.Vector(0.08, 0.08); // Y velocity equals 1 unit

run() async {
  await window.requestAnimationFrame(loop);
}

num deltaTime = 0;
num lastTimeStamp = 0;
var timeStep = (1000 / 60) / 1000;

loop(num timestamp) {
  deltaTime = (timestamp - lastTimeStamp) / 1000;

  //print(timeStep);
  while (deltaTime >= timeStep) {
    update(timeStep);
    deltaTime -= timeStep;

    var numUpdateSteps = 0;
    if (++numUpdateSteps >= 240) {
      panic();
      break;
    }
  }

  draw();
  lastTimeStamp = timestamp;
  run();
}

void panic() {
  deltaTime = 0.0;
}

// velY = velX + grav * delta;

//print('${boxPosition.y} $delta');
//print(
//    'boxVeloxity : ${boxVelocity.y} boxVelocity  * delta ${boxVelocity * delta} ');

//  boxPosition.y = boxPosition.y + 0.08 * delta;
//boxPosition.y -= delta;
//if (velY > 0) {}

// print('delta: $delta');
//print('Y: ${boxVelocity.y}');

// if (boxPosition.x >= 368 || boxPosition.x <= 0)
//   boxVelocity.x = -boxVelocity.x; // Invertion of the vector -1

// if (boxPosition.y >= 368 || boxPosition.y <= 0)
//   boxVelocity.y = -boxVelocity.y; // Invertion of the vector -1

class Bullet {
  var position;
  var x;
  var velocity;
  var color;

  Bullet() {
    x = getRandomNumber(0, 40);
    position = vect.Point(x, 0); // x, y
    velocity =
        vect.Vector(getRandomNumber(30, 100), getRandomNumber(30, 100)); // x,y
    color = COLOR_PALLETE[getRandomNumber(0, COLOR_PALLETE.length)];
    print('Point:( ${position.x}, ${position.y} )');
  }
  //var color = 'purple';
}

var bullets = List.generate(100, (_) => Bullet());

double velY = 80;
double velX = 80;
var grav = -12.5;
update(num delta) {
  //print('Delta inside update: $delta');

  for (var bullet in bullets) {
    if (bullet.position.y >= 0) {
      bullet.position.y += bullet.velocity.y * delta;
      bullet.velocity.y = bullet.velocity.y + grav * delta;
      bullet.position.x += bullet.velocity.x * delta;
      //print('Point:( ${bullet.position.x}, ${bullet.position.y} )');
    }
  }
}

draw() {
  for (var bullet in bullets) {
    context2D
      //..clearRect(0, 0, 800, 400)
      //..transform(1, 0, 0, -1, 0, canvas.height)
      ..beginPath()
      ..fillStyle = bullet.color
      ..fillRect(bullet.position.x, bullet.position.y, 3, 3)
      ..closePath();
  }
}

start() {
  draw();
  run();
}

void canvasSetup() {
  document.body.append(canvas);

  canvas
    ..setAttribute('width', '800')
    ..setAttribute('style', 'border: solid red')
    ..setAttribute('height', '400');

  context2D.transform(1, 0, 0, -1, 0, canvas.height);
}

main() => {canvasSetup(), start()};
