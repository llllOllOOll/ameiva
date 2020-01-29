import 'dart:html';

class Canvas {
  int canvasWidth;
  int canvasHeight;
  
  Map canvasAttributes;
  CanvasElement canvasInstance;

  Canvas([this.canvasWidth, this.canvasHeight, this.canvasAttributes]) {
    _createCanvas();
  }

  _createCanvas() {
    canvasWidth ??= 300;
    canvasHeight ??= 150;

    canvasAttributes ??= {'id': 'screen', 'class': 'main'};

    canvasInstance = CanvasElement(width: canvasWidth, height: canvasHeight);

    canvasAttributes.forEach((name, value) {
      canvasInstance.setAttribute(name, value);
    });

    canvasInstance.context2D;

    document.body.innerHtml = '';

    document.body.append(canvasInstance);

    return canvasInstance;
  }
}
