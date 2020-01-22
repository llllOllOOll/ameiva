import 'dart:html';

class Canvas {
  CanvasElement canvas;

  static CanvasRenderingContext2D context2D;
  static CanvasElement canvasInstance;

  createCanvas([int width, int height, Map attributes]) {
    width ??= 300;
    height ??= 150;

    attributes ??= {'id': 'screen', 'class': 'main'};

    canvas = CanvasElement(width: width, height: height);
    canvasInstance = canvas;
    canvas.context2D;
    attributes.forEach((name, value) {
      canvas.setAttribute(name, value);
    });

    document.body.innerHtml = '';
    document.body.append(canvas);
    context2D = canvas.context2D;
  }

  getContext2D() {
    return context2D;
  }

  getCanvasIntance() {
    return canvasInstance;
  }
}
