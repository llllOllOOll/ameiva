import 'package:ameiva/ameiva.dart';
import 'dart:math';

void main() => fallingStars();


const STAR_DIAMETER = 3;

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


void fallingStars() {

  final ameiva = Ameiva(400, 400);

  List<FallingStar> fallingStarsData = [];
 
  FactoryFallingStars.createFallingStar(fallingStarsData, 100);

  ameiva.update((){

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

  ameiva.renderScreen((){

        fallingStarsData.forEach((fallingStar) {
          ameiva.shape.ellipse(fallingStar.x, fallingStar.y, fallingStar.diameter, 0, 360, lineColor: fallingStar.color);
        });

  });   

}


void luna() {
  final ameiva = Ameiva(400, 400);

  ameiva.renderScreen(() {
    ameiva.shape.ellipse(200, 200, 130, 0, 360,
        fillColor: 'green', lineColor: '#ffcc99');
    ameiva.shape
        .ellipse(140, 170, 30, 0, 180, fillColor: 'red', lineColor: 'black');
    ameiva.shape
        .ellipse(240, 170, 30, 0, 180, fillColor: 'red', lineColor: 'black');
    ameiva.shape.line(110, 171, 270, 171);
    ameiva.shape.line(110, 171, 81, 150);
    ameiva.shape.line(270, 171, 319, 150);

    ameiva.shape
        .ellipse(200, 230, 30, 0, 180, fillColor: 'red', lineColor: 'black');
    ameiva.shape.line(170, 230, 230, 230, color: 'black');
  });
}

void julia() {
  final ameiva = Ameiva(400, 400);

  var y = 0;
  var x = 200;

  var rectanglePositionX = 200;
  var rectanglePositionY = 200;

  ameiva.update(() {
    rectanglePositionX = ameiva.input['x'];
    rectanglePositionY = ameiva.input['y'];

    y = y - 1;
    y < 0 ? y = 400 : null;

    x = x + 1;
    x > 400 ? x = 0 : null;
  });

  var face = {
    'ellipses': [
      //Head
      {
        'x': 200,
        'y': 200,
        'radius': 140,
        'startAngle': 0,
        'endAngle': 360,
        'lineColor': 'lavenderblush',
        'fillColor': 'darkindianred',
      },
      {
        'x': 150,
        'y': 150,
        'radius': 40,
        'startAngle': 0,
        'endAngle': 180,
        'lineColor': 'lavenderblush',
        'fillColor': 'lightsalmon',
      },
      {
        'x': 150,
        'y': 150,
        'radius': 30,
        'startAngle': 0,
        'endAngle': 360,
        'lineColor': 'lavenderblush',
        'fillColor': 'lightsalmon',
      },
      {
        'x': 250,
        'y': 150,
        'radius': 40,
        'startAngle': 0,
        'endAngle': 180,
        'lineColor': 'lavenderblush',
        'fillColor': 'lightsalmon',
      },
      {
        'x': 250,
        'y': 150,
        'radius': 30,
        'startAngle': 0,
        'endAngle': 360,
        'lineColor': 'lavenderblush',
        'fillColor': 'lightsalmon',
      },
      {
        'x': 200,
        'y': 260,
        'radius': 40,
        'startAngle': 0,
        'endAngle': 180,
        'lineColor': 'lavenderblush',
        'fillColor': 'coral',
      },
      {
        'x': 200,
        'y': 200,
        'radius': 20,
        'startAngle': 0,
        'endAngle': 360,
        'lineColor': 'mistyrose',
        'fillColor': 'lightsalmon'
      },
      {
        'x': 170,
        'y': 150,
        'radius': 10,
        'startAngle': 0,
        'endAngle': 360,
        'lineColor': 'mistyrose',
        'fillColor': 'lightsalmon',
      },
      {
        'x': 270,
        'y': 150,
        'radius': 10,
        'startAngle': 0,
        'endAngle': 360,
        'lineColor': 'mintyrose',
        'fillColor': 'ligthsalmon',
      },
    ]
  };

  var anticlockwise = false;

  ameiva.renderScreen(() {
    face['ellipses'].forEach((field) {
      ameiva.shape.ellipse(field['x'], field['y'], field['radius'],
          field['startAngle'], field['endAngle'],
          fillColor: field['fillColor'],
          lineColor: field['lineColor'],
          anticlockwise: anticlockwise);
    });
    ameiva.shape.line(
      0,
      y,
      400,
      y,
    );
    ameiva.shape.line(
      x,
      0,
      x,
      400,
    );

    ameiva.shape
        .rectangle(rectanglePositionX, rectanglePositionY, 50, 50, 'gray');
  });
}
