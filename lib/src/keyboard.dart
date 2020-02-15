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

// class Keyboard {
//   static Function _movePlayer;

//   Keyboard(f){
//     _movePlayer = f;
//     window.onKeyDown.listen( _handleKeydown );
//     window.onKeyUp.listen( _handleKeyUp );
//   }

//   static void _handleKeydown(e){
//     final String keyPressed = e.key;
//     final eventTimeStamp =  e.timeStamp;

//     var command = {
//       'playerId':'player2',
//       'keypressed':keyPressed,
//       'eventTimeStamp':eventTimeStamp
//     };

//     Keyboard._movePlayer(command);

//   }

//   static void _handleKeyUp(e){
//     var command = {
//       'playerId':'',
//       'keypressed':'',
//       'eventTimeStamp':0
//     };

//     Keyboard._movePlayer(command);

//   }

// }
