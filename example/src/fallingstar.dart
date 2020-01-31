import 'dart:math';

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

class FallingStar {
  
  static  int _generateStarId = 0;
  final Function _randNumber;

  int id;
  
  //Point position;
  int x, y;
  int timeToFall;
  int directionToFall;
  int velocityToFall;
  int diameter;
  String color;

  FallingStar(this._randNumber, int width, int height): id = null {
    
    _generateStarId ++;  

    var newStarId = _generateStarId;

    var positionX  = _randNumber(0,width) as int;
    var positionY  = _randNumber(0,height) as int;

    var newVelocityToFall  = _randNumber(1, 5);
    var newTimeToFall      = _randNumber(1, 7500);
    var newDirectionToFall = _randNumber( -1, 1 );

    
    id = newStarId;
    //position = Point(x, y);
    x = positionX;
    y = positionY;

    directionToFall = newDirectionToFall;
    velocityToFall = newVelocityToFall;
    timeToFall = newTimeToFall;
 
    diameter = STAR_DIAMETER;
    color =  COLOR_PALLETE[_randNumber( 0, COLOR_PALLETE.length )];

  }
  
}