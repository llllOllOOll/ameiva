import 'package:ameiva/ameiva.dart';

void main() {
  var ameiva = Ameiva();

  var y = 0;
  var x = 200;

  var rectanglePositionX = 200;
  var rectanglePositionY = 200;

  ameiva.createCanvas(400, 400);

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

  // });
  // ellipse(200, 200, 140, 0 * pi, 2 * pi);
  // ellipse(150, 150, 30, 0 * pi, 2 * pi);
  // ellipse(250, 150, 30, 0 * pi, 2 * pi);
  // ellipse(250, 150, 40, 0 * pi, 1 * pi);
  // ellipse(150, 150, 40, 0 * pi, 1 * pi);
  // ellipse(200, 260, 40, 0 * pi, 1 * pi);
  // ellipse(200, 200, 20, 0 * pi, 2 * pi);
  // ellipse(170, 150, 10, 0 * pi, 2 * pi);
  // ellipse(270, 150, 10, 0 * pi, 2 * pi);
//  anticlockwise == false ? anticlockwise = true : anticlockwise = false;

  var anticlockwise = false;

  ameiva.renderScreen(() {
    face['ellipses'].forEach((field) {
      ellipse(field['x'], field['y'], field['radius'], field['startAngle'],
          field['endAngle'],
          fillColor: field['fillColor'],
          lineColor: field['lineColor'],
          anticlockwise: anticlockwise);
    });
    line(0, y, 400, y, 'blue');
    line(x, 0, x, 400, 'red');

    rectangle(rectanglePositionX, rectanglePositionY, 50, 50, 'gray');
  });
}
