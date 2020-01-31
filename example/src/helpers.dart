import 'dart:math' as math;

final math.Random _rnd = math.Random();
int getRandomNumber(int min, int max) => min + _rnd.nextInt(max - min);