import 'dart:html';
import 'dart:math';

import '../../ameiva.dart';

class Shape {
  Canvas canvas;
  CanvasRenderingContext2D context2D;

  Shape(this.canvas) {
    this.context2D = canvas.canvasInstance.context2D;
  }
  rectangle(x, y, width, height, [color]) {
    color ??= 'yellow';

    context2D.beginPath();
    context2D.fillStyle = color;
    context2D.fillRect(x, y, width, height);
  }

  clearScreen({x, y, color}) {
    color ??= 'lightseagreen';
    x ??= 0;
    y ??= 0;
    context2D.fillStyle = color;
    context2D.clearRect(
        x, y, canvas.canvasInstance.width, canvas.canvasInstance.height);
  }

  ellipse(x, y, radius, startAngle, endAngle,
      {lineColor, fillColor, anticlockwise}) {
    startAngle = startAngle * (pi / 180);
    endAngle = endAngle * (pi / 180);

    lineColor ??= 'green';
    fillColor ??= 'purple';

    context2D.strokeStyle = lineColor;
    context2D.fillStyle = fillColor;
    context2D.lineWidth = 2;

    context2D.beginPath();
    context2D.arc(x, y, radius, startAngle, endAngle, anticlockwise);

    context2D.fill();
    context2D.stroke();
  }

  line(x1, y1, x2, y2, {color}) {
    context2D.beginPath();
    context2D.moveTo(x1, y1);
    context2D.lineTo(x2, y2);
    context2D.strokeStyle = color;
    context2D.stroke();
  }
}
