import 'dart:math' as math;

final math.Random _rnd = math.Random();
int getRandomNumber(int min, int max) => min + _rnd.nextInt(max - min);

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

// Subtracts two points and returns the vector.
// with the result of the subtraction
Vector subPoints(Point a, Point b) {
  var v = Vector(); // Create a new vector in memory.

  v.x = a.x - b.x;
  v.y = a.y - b.y;

  return v;
}
