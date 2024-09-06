import 'package:ex3_front_api/consts.dart';
import 'package:flutter/material.dart';

class MyPadding extends Padding {
  const MyPadding({super.key, required super.child}): super(padding: defaultPadding);
}

class MyText extends Text {
  const MyText(super.data, {super.key}): super(style: defaulTextStyle);
}

String? stringNotEmptyValidator (value, message) {
  if (value == null || value.trim().isEmpty) {
    return message;
  }
  return null;
}

showNetworkErrorDialog(context, {message}) =>
    showDialog(context: context, builder: (BuildContext context) => AlertDialog(
      content: MyText(message ?? 'Erreur de communication avec le serveur'),
      actions: [
        ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const MyText('OK'))
      ],
    ));