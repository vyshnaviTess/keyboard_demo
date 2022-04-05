import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textController = new TextEditingController();
  FocusNode _textNode = new FocusNode();

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
    return Scaffold(
      body: SingleChildScrollView(
        // child: SizedBox(
        //   width: double.infinity,
        //   height: 300,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 400, bottom: 10),
              child: RawKeyboardListener(
                focusNode: FocusNode(),
                onKey: (event) => handleKey(event),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                      hintText: 'Enter your name'),
                  // textInputAction: TextInputAction.next,
                  // keyboardType: TextInputType.text,
                  controller: _textController,
                  focusNode: _textNode,
                ),
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
