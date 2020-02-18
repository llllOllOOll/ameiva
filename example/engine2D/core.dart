import 'dart:html';

class Engine {
  static _EngineCore Core = _EngineCore();
}

class _EngineCore {
  CanvasElement _mCanvas;
  CanvasRenderingContext2D mContext;
  int mWidth = 800, mHeight = 450;

  _EngineCore() {
    _mCanvas = window.document.createElement('canvas');
    document.body.append(_mCanvas);

    _mCanvas.width = mWidth;
    _mCanvas.height = mHeight;

    mContext = _mCanvas.context2D;
  }
}
