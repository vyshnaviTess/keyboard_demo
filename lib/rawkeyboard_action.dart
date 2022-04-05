import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'foo text',
            ),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: KeyboardListener(),
            )
          ],
        ),
      ),
    );
  }
}

class KeyboardListener extends StatefulWidget {
  KeyboardListener();

  @override
  _RawKeyboardListenerState createState() => new _RawKeyboardListenerState();
}

class _RawKeyboardListenerState extends State<KeyboardListener> {
  TextEditingController _textController = new TextEditingController();
  FocusNode _textNode = new FocusNode();

  @override
  initState() {
    super.initState();
  }

  handleKey(RawKeyEvent event) {
    var isEnter = event.logicalKey.keyId == LogicalKeyboardKey.enter.keyId ||
        event.logicalKey.keyId == 1108101563381;
    if (event.runtimeType.toString() == 'RawKeyDownEvent' && isEnter) {
      print('- Text: ' + _textController.text);
      Future.delayed(const Duration(milliseconds: 500), () {
        print('- Text after delay: ' + _textController.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _textNode,
      onKey: (event) => handleKey(event),
      child: TextField(
        controller: _textController,
        focusNode: _textNode,
      ),
    );
  }
}
