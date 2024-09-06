import 'package:ex2_pages_database/components.dart';
import 'package:flutter/material.dart';

class SayHelloPage extends StatefulWidget {
  final String name;

  const SayHelloPage(this.name, {super.key});

  @override
  State<SayHelloPage> createState() => _SayHelloPageState();
}

class _SayHelloPageState extends State<SayHelloPage> {
  @override
  Widget build(BuildContext context) {
    return Material(child: Scaffold(
      appBar: AppBar(
        title: const Text('Dire bonjour'),
      ),
    body: Center(
      child: MyText('Bonjour, ${widget.name} !'),
    )));
  }

}