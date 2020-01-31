## Ameiva **Lib**


## Introduction

**Ameiva**  is a Canvas Lib wwrote in Dart Language.

**Ameiva** makes it easy to create html5 / canvas animation. How?

* Expose a small set of simple types.
* You don't be care about game loop and keyboard input.

## Example

See FallingStars at `example/main.dart` 

![alt FallingStars](https://github.com/ravencodde/ameiva/blob/master/fallingstars.png?raw=true)



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

## Respect
We respect everybody. We don't take for granted that you should know something previously, so feel free to ask questions about things you didn't understand, for this is also a great contribution which will surelly make us review our code and conceptions.


## Issues
Please post bugs in the correct [Issues](https://github.com/ravencodde/ameiva/issues) repository.

Developers, please check out the [Roadmap](https://github.com/ravencodde/ameiva/blob/master/Documents/ROADMAP.md) for more in-depth details about contributing code, our philosofy, bug fixes, etc...


## Contributors
We DO recognize all types of contributions. This project follows the [all-contributors](https://github.com/kentcdodds/all-contributors) specification. Instructions to add yourself or add contribution emojis to your name are to come...



## Inspiration

Learn how to create a lib in Dart Language.

