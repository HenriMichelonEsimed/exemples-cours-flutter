import 'package:ex1_hello_world/components.dart';
import 'package:ex1_hello_world/consts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final TextEditingController _nameController;
  //String? _nameError;
  final _formKey = GlobalKey<FormState>();
  late String _name;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  /*_validate() {
    _nameError = null;
    _name = _nameController.text.trim();
    if (_name.isEmpty) {
      _nameError = 'Veuillez saisir un nom';
    }
    setState(() {});
    return (_nameError == null);
  }*/

  _sayHello(BuildContext context) {
    //if (!_validate()) return;
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState?.save();
    showDialog(context: context, builder: (BuildContext context) => AlertDialog(
      content: MyText('Bonjour, $_name !'),
      actions: [
        ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const MyText('Merci !'))
      ],
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Text('Hello, World!')
            /*Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
              child: Text('Hello, World!', style: TextStyle(fontSize: 20),)
            )*/
            //MyPadding(child: MyText('Hello, World!'))
            MyPadding(
              /*child: TextField(
                decoration: InputDecoration(
                  errorText: _nameError,
                  hintText: 'Votre nom'
                ),
                controller: _nameController)),*/
              child: TextFormField(
                onSaved: (value) => _name = value.toString(),
                /*validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Veuillez saisir un nom';
                  }
                  return null;
                },*/
                validator: (v) => stringNotEmptyValidator(v, 'Veuillez saisir un nom'),
              )),
            SizedBox(
              width: double.infinity,
              child: MyPadding(child: ElevatedButton(
                onPressed: () => _sayHello(context),
                child: const MyText('Dire bonjour'))))
          ],
        ),
      // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}
