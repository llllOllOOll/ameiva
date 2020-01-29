  
import 'dart:math';
import 'package:ameiva/ameiva.dart' as ameiva;


const STAR_DIAMETER = 1;

const COLOR_PALLETE = [
	'white',
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

int getRandomNumber(min, max) {
  
  Random random = new Random();
  int r = min + random.nextInt(max - min);
  
  return r;

}

class FallingStar {

  String id;

  int x;
  int y;

  int diameter;
  String color;

  int timeToFall;
  int velocityToFall;
  int directionToFall;

}

class FactoryFallingStars {
  
  static void createFallingStar(List<FallingStar> l, int n) {
    
      List<FallingStar> listFallingStars = l;

      for (int i = 0; i < n; i++) {
      
        final newFallingStar = FallingStar();
        
        final id = 'fallingStar' + i.toString();

        newFallingStar.id = id;

        newFallingStar.x = getRandomNumber(0, 400);
        newFallingStar.y = getRandomNumber(0, 100);

        newFallingStar.velocityToFall  = getRandomNumber(1, 5);
        newFallingStar.timeToFall      = getRandomNumber(1, 7500);
        newFallingStar.directionToFall =	getRandomNumber( -1, 1 );

        newFallingStar.diameter = STAR_DIAMETER;

        newFallingStar.color =  COLOR_PALLETE[getRandomNumber( 0, COLOR_PALLETE.length )];
      
        listFallingStars.add(newFallingStar);
        
      }

  }

}

void main() => fallingStars();

void fallingStars() {

  final stage = ameiva.Setup(400,400);

  List<FallingStar> fallingStarsData = [];
 
  FactoryFallingStars.createFallingStar(fallingStarsData, 100);

  stage.update((){

      fallingStarsData.forEach((currentStar) {

          if(currentStar.x < 0 || currentStar.y > 400){
            currentStar.x = getRandomNumber(0, 400);
            currentStar.y = getRandomNumber(0, 100);
            currentStar.timeToFall  = getRandomNumber(1, 7500);
          }

          final currentPositionX      = currentStar.x;
          final currentPositionY      = currentStar.y;
          final currentTimeToFall     = currentStar.timeToFall;
          final currentVelocityToFall = currentStar.velocityToFall;
          final currentAngleToFall	  = currentStar.directionToFall;


          if (currentStar.timeToFall != 0) {
            currentStar.timeToFall = currentTimeToFall - 1;
          }else{
            currentStar.x = currentPositionX + 1 * currentAngleToFall;
            currentStar.y = currentPositionY + currentVelocityToFall;
          }
      });

  });

  stage.renderScreen((){

        fallingStarsData.forEach((fallingStar) {
          stage.shape.ellipse( fallingStar.x, fallingStar.y, fallingStar.diameter, 0, 360, lineColor: fallingStar.color );
        });

  });   

}