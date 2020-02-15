import 'dart:async';
import 'dart:html';

import 'components/canvas.dart';
import 'components/shapes.dart';
import 'keyboard.dart';

var keyboard = Keyboard();

var p = Point(0, 0);

class Setup {
  final int frameRate = 30;
  Function updateReference;
  Function renderScreenReference;
  Canvas canvas;
  Shape shape;
  //Keyboard keyboard;

  static const num GAME_SPEED = 50;
  num _lastTimeStamp = 0;

  var input = {'x': 0, 'y': 0, 'speed': 1};

  var stateKey;

  Setup(canvasWidth, canvasHeight) {
    this.canvas = Canvas(canvasWidth, canvasHeight);
    this.shape = Shape(this.canvas);
    //this.keyboard = Keyboard(this.movePlayer);
    //this.run();
    this.loopDraw(1);
  }

  updateState(move) {}

  keyPressed(void f()) {}

//   void  movePlayer(command){
//     // final currentPlayer =   players[ command['playerId'] ] ;
//     //print( 'Move ${command['playerId']} with ${command['keypressed']}' );

//     print(command);

//     Map<String, num> keys = Map<String, num>();

//     if(command['keypressed'] != ''){
//       keys.putIfAbsent(command['keypressed'], () =>  command['eventTimeStamp']);
//     } else {
//     keys.remove(command['keypressed']);
//     }

//     print(keys.toString());
//     var nState = input;// ['x'];

//     if ( keys.containsKey('ArrowRight')  ) {
//        print(input['x']);
//       if (input['x'] < canvas.canvasInstance.width - 50) {
//         //input['x'] += input['speed'];
//         //{'x':0, 'y':0};

//         nState['x'] += input['speed'];

//         cKeypressed(nState);
//       }
//       return;
//     }

//     if (keys.containsKey('ArrowLeft') ) {
//       if (input['x'] > 0) {

//         //input['x'] -= input['speed'];
//         nState['x'] -= input['speed'];

//         cKeypressed(nState);

//       }
//       return;
//     }

//     if (keys.containsKey('ArrowUp')) {
//       if (input['y'] > 0) {
//         //input['y'] -= input['speed'];
//         nState['y'] -= input['speed'];

//         cKeypressed(nState);

//       }
//       return;
//     }

//     if (keys.containsKey('ArrowDown')) {
//       if (input['y'] < canvas.canvasInstance.height - 50) {
//         //input['y'] += input['speed'];

//         nState['y'] += input['speed'];

//         cKeypressed(nState);
//       }
//       return;
//     }
//   }

//  cKeypressed([newState]){
//      if(newState != null)  input = newState;
//  }

  update(void f()) {
    updateReference = f;
  }

  //renderScreen(void f()) => loop(f);
  renderScreen(void f()) {
    renderScreenReference = f;
  }

  loopDraw(num number) {
    // var timeFrame = 1000 ~/ frameRate;

    //Timer.periodic(Duration(microseconds: timeFrame), (timer) {

    //cKeypressed();

    if (updateReference != null) updateReference();

    shape.clearScreen(color: 'black');

    if (renderScreenReference != null) renderScreenReference();

    window.requestAnimationFrame(loopDraw);

    // });
  }

  Future run() async {
    gameLoop(await window.animationFrame);
    //gameLoop(await window.requestAnimationFrame(callback));
  }

  void gameLoop(num delta) {
    final num diff = delta - _lastTimeStamp;

    if (diff > GAME_SPEED) {
      _lastTimeStamp = delta;
      //clear();
      //drawBoard();
      //drawCell(_food, "red");
      //_snake.update();
      //_checkForCollisions();

      updateReference();

      shape.clearScreen(color: 'black');

      renderScreenReference();
      print('Raven');
    }

    // keep looping
    run();
  }

//   checkInput() {
//     if (keyboard.isPressed(KeyCode.RIGHT)) {
//       if (input['x'] < canvas.canvasInstance.width - 50) {
//         input['x'] += 1;
//       }
//       return;
//     }

//     if (keyboard.isPressed(KeyCode.LEFT)) {
//       if (input['x'] > 0) {
//         input['x'] -= 1;
//       }
//       return;
//     }

//     if (keyboard.isPressed(KeyCode.UP)) {
//       if (input['y'] > 0) {
//         input['y'] -= 1;
//       }
//       return;
//     }

//     if (keyboard.isPressed(KeyCode.DOWN)) {
//       if (input['y'] < canvas.canvasInstance.height - 50) {
//         input['y'] += 1;
//       }
//       return;
//     }
//   }
}
