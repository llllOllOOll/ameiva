import 'dart:html';
import 'dart:math';

import '../../ameiva.dart';

CanvasRenderingContext2D context2D = Canvas().getContext2D();
CanvasElement canvasIntance = Canvas().getCanvasIntance();

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
  context2D.clearRect(x, y, canvasIntance.width, canvasIntance.height);
}

ellipse(x, y, radius, startAngle, endAngle,
    {lineColor, fillColor, anticlockwise}) {
  startAngle = startAngle * (pi / 180);
  endAngle = endAngle * (pi / 180);

  lineColor ??= 'green';
  fillColor ??= 'purple';

  context2D.strokeStyle = fillColor;
  context2D.fillStyle = lineColor;
  context2D.lineWidth = 2;

  context2D.beginPath();
  context2D.arc(x, y, radius, startAngle, endAngle, anticlockwise);

  context2D.fill();
  context2D.stroke();
}

line(x1, y1, x2, y2, [color]) {
  context2D.beginPath();
  context2D.moveTo(x1, y1);
  context2D.lineTo(x2, y2);
  context2D.strokeStyle = color;
  context2D.stroke();
}
