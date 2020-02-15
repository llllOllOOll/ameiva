import 'package:ameiva/ameiva.dart' as ameiva;

import 'falling_stars/fallingstar.dart';
import 'falling_stars/helpers.dart';

void fallingStars() {
  final stage = ameiva.Setup(400, 400);

  List<FallingStar> fallingStarsData =
      List.generate(100, (_) => FallingStar(getRandomNumber, 400, 100));

  stage.update(() {
    for (var fallingStar in fallingStarsData) {
      if (fallingStar.x < 0 || fallingStar.y > 400) {
        fallingStar.x = getRandomNumber(0, 400);
        fallingStar.y = getRandomNumber(0, 100);
        fallingStar.timeToFall = getRandomNumber(1, 7500);
      }

      if (fallingStar.timeToFall != 0) {
        fallingStar.timeToFall -= 1;
      } else {
        fallingStar.x += 1 * fallingStar.directionToFall;
        fallingStar.y += fallingStar.velocityToFall;
      }
    }
  });

  stage.renderScreen(() {
    for (var fallingStar in fallingStarsData) {
      stage.shape.ellipse(
          fallingStar.x, fallingStar.y, fallingStar.diameter, 0, 360,
          lineColor: fallingStar.color);
    }
  });
}
