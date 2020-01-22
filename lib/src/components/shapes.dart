import 'dart:html';

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
  color ??= 'red';
  x ??= 0;
  y ??= 0;
  context2D.fillStyle = color;
  context2D.clearRect(x, y, canvasIntance.width, canvasIntance.height);
}

ellipse(x, y, radius, startAngle, endAngle, [color]) {
  color ??= 'black';
  context2D.beginPath();
  context2D.arc(x, y, radius, startAngle, endAngle);
  context2D.strokeStyle = color;
  context2D.stroke();
}

line(x1, y1, x2, y2, [color]) {
  context2D.beginPath();
  context2D.moveTo(x1, y1);
  context2D.lineTo(x2, y2);
  context2D.strokeStyle = color;
  context2D.stroke();
}
