import 'dart:html';

class Keyboard {
  Map<int, num> _keys = Map<int, num>();

  Keyboard() {
    window.onKeyDown.listen((KeyboardEvent event) {
      _keys.putIfAbsent(event.keyCode, () => event.timeStamp);
    });

    window.onKeyUp.listen((KeyboardEvent event) {
      _keys.remove(event.keyCode);
    });
  }

  bool isPressed(int keyCode) => _keys.containsKey(keyCode);
}
