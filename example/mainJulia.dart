import 'package:ameiva/ameiva.dart' as ameiva;

void main() => julia();

void julia() {

  final stage = ameiva.Setup(400, 400);

  var y = 0;
  var x = 200;

  var rectanglePositionX = 200;
  var rectanglePositionY = 200;

  stage.update(() {
    rectanglePositionX = stage.input['x'];
    rectanglePositionY = stage.input['y'];

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

  stage.renderScreen(() {
    
    face['ellipses'].forEach((field) {
    
      stage.shape.ellipse(field['x'], field['y'], field['radius'],
          field['startAngle'], field['endAngle'],
          fillColor: field['fillColor'],
          lineColor: field['lineColor'],
          anticlockwise: anticlockwise);

    });
    
    stage.shape.line(0, y, 400, y, );
    stage.shape.line( x, 0, x, 400, );

    stage.shape.rectangle(rectanglePositionX, rectanglePositionY, 50, 50, 'gray');

  });

}
