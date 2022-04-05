import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

void main() {
  runApp(const MaterialApp(home: KeyBoardAction()));
}

class KeyBoardAction extends StatefulWidget {
  const KeyBoardAction({Key? key}) : super(key: key);

  @override
  _KeyBoardActionState createState() => _KeyBoardActionState();
}

class _KeyBoardActionState extends State<KeyBoardAction> {
  final _nameFocus = FocusNode();
  final _cardNumberFocus = FocusNode();
  final _cardPinFocus = FocusNode();

  /// Creates the [KeyboardActionsConfig] to hook up the fields
  /// and their focus nodes to our [FormKeyboardActions].
  KeyboardActionsConfig _buildKeyboardActionsConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey,
      actions: [
        KeyboardActionsItem(
          focusNode: _nameFocus,
        ),
        KeyboardActionsItem(
          focusNode: _cardNumberFocus,
        ),
        KeyboardActionsItem(
          focusNode: _cardPinFocus,
          onTapAction: () {
            showDialog(
                context: context,
                builder: (ctx) => const AlertDialog(
                      title: Text('Screen saved'),
                      content: Text(
                          "Probably taking the user to next screen or something now...."),
                    ));
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: KeyboardActions(
          config: _buildKeyboardActionsConfig(context),
          child: ListView(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: "Name"),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                focusNode: _nameFocus,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Card Number"),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _cardNumberFocus,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Card Pin"),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                focusNode: _cardPinFocus,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
