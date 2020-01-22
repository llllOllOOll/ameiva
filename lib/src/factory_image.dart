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
