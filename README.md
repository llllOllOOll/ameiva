## Ameiva **Lib**

[![Build Status](https://travis-ci.org/ravencodde/ameiva.svg?branch=master)][(https://travis-ci.org/dart-lang/shelf))

## Introduction

**Ameiva** makes it easy to create html5 / canvas animation. How?

* Expose a small set of simple types.
* You don't be care about game loop and keyboard input.

## Example

See FallingStars at `example/main.dart` 

![alt FallingStars](https://github.com/ameiva/blob/master/fallingstars.png)



```dart
  
import 'package:ameiva/ameiva.dart' as ameiva;

import 'src/fallingstar.dart';
import 'src/helpers.dart';

void main() => fallingStars();

void fallingStars() {

  final stage = ameiva.Setup(400,400);

  List<FallingStar> fallingStarsData = List.generate(100, (_)=> FallingStar(getRandomNumber, 400,100));
 

  stage.update((){

    for (var fallingStar in fallingStarsData) {

      if(fallingStar.x < 0 || fallingStar.y > 400){

            fallingStar.x = getRandomNumber(0, 400);
            fallingStar.y = getRandomNumber(0, 100);
            fallingStar.timeToFall  = getRandomNumber(1, 7500);
      }
      
      if (fallingStar.timeToFall != 0) {

            fallingStar.timeToFall -= 1;

      } else {

            fallingStar.x  += 1 * fallingStar.directionToFall;
            fallingStar.y += fallingStar.velocityToFall;

      }

    }

  });

  stage.renderScreen((){

        for (var fallingStar in fallingStarsData) {

          stage.shape.ellipse( fallingStar.x, fallingStar.y, fallingStar.diameter, 0, 360, lineColor: fallingStar.color );
          
        }

  });   

}

```

## Inspiration

Learn how to create a lib in Dart Language.