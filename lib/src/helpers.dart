// This is an exemplo de factory by using an function to create objects.

class Image {
  String type;
  Image(this.type);
}

class JPGImage extends Image {
  JPGImage(String type) : super(type);
}

class GIFImage extends Image {
  GIFImage(String type) : super(type);
}

class PNGImage extends Image {
  PNGImage(String type) : super(type);
}

Image createImage(String type) {
  var supportedImages = <String, Image>{
    'jpg': JPGImage(type),
    'png': PNGImage(type),
    'gif': GIFImage(type),
  };

  return supportedImages[type];
}

// createCanvas([width, height, Map<String, String> attributes]) {
//   return Canvas().createCanvas(width, height, attributes);
// }

// class Canvas {
//   Canvas();

//   createCanvas([width, height, Map<String, String> attributes]) {
//     width ??= 300;
//     height ??= 150;

//     attributes ??= {'id': 'game', 'class': 'main'};

//     final CanvasElement canvasElement = CanvasElement();
//     final CanvasRenderingContext2D context2D = canvasElement.context2D;

//     attributes.forEach((key, value) {
//       canvasElement.setAttribute('${key}', '${value}');
//       print('$key $value');
//     });

//     canvasElement.width = width;
//     canvasElement.height = height;

//     document.body.append(canvasElement);

//     return context2D;
//   }
// }

// class Canvas {
//   createCanvas(int width, int height) {
//     CanvasElement canvasElement = CanvasElement();
//     canvasElement.setAttribute('id', 'processing');
//     canvasElement.width = width;
//     canvasElement.height = height;

//     ctx = canvasElement.context2D;
//     document.body.append(canvasElement);

//   }

//   void setup(void f()) {
//     f();
//   }

//   void draw(void f()) {
//     loop(f);

//   }

//   loop(void f()) {
//     var timeFrame = 1000 ~/ frameRate;
//     Timer.periodic(Duration(microseconds: timeFrame), (timer) {
//       f();
//     });
//   }

//   void fill(int r, int g, int b) {
//     ctx.fillStyle = rgbToHex(r, g, b);
//   }

//   void background(int r, int g, int b) {
//     var curFill = ctx.fillStyle;
//     ctx.fillStyle = rgbToHex(r, g, b);
//     ctx.fillRect(0, 0, width, height);
//     ctx.fillStyle = curFill;
//   }

//   String rgbToHex(int r, int g, int b) {
//     return toHex(r) + toHex(g) + toHex(b);
//   }

//   String toHex(int n) {
//     if (n.isNaN) return '00';
//     n = max(0, max(n, 255));

//     var s = '0123456789ABCDEF';

//     return s[((n - n % 16) ~/ 16)] + s[(n % 16)];
//   }

//   line(x1, y1, x2, y2) {
//     ctx.beginPath();

//     ctx.moveTo(x1, y1);
//     ctx.lineTo(x2, y2);
//     ctx.strokeStyle = '#ff0000';
//     ctx.stroke();
//   }
// }
