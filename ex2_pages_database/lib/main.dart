import 'package:ex2_pages_database/components.dart';
import 'package:ex2_pages_database/consts.dart';
import 'package:ex2_pages_database/database.dart';
import 'package:ex2_pages_database/models/history_entry.dart';
import 'package:ex2_pages_database/pages/say_hello_page.dart';
import 'package:ex2_pages_database/repositories/history_entry.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HistoryDatabase().open();
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
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final String title;
  final repo = HistoryEntryRepository();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<HistoryEntry>> _history;
  late final DateFormat _dateTimeFormat;
  final _formKey = GlobalKey<FormState>();
  late String _name;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting().then((value) =>
      _dateTimeFormat = DateFormat.yMd('fr').add_jm());
    _history = widget.repo.getAll();
  }


  _displayResult() => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SayHelloPage(_name)));

  _sayHello (BuildContext context) {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState?.save();
    widget.repo.insert(HistoryEntry(_name));
    _displayResult().then((value) {
      setState(() {
        _formKey.currentState?.reset();
        _history = widget.repo.getAll();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            MyPadding(child: TextFormField(
              onSaved: (value) => _name = value.toString(),
              validator: (v) => stringNotEmptyValidator(v, 'Veuillez saisir un nom'),
              decoration: const InputDecoration(hintText: 'Votre nom '),
              style: defaulTextStyle)
            ),
            SizedBox(
                width: double.infinity,
                child: MyPadding(child: ElevatedButton(
                onPressed: () => _sayHello(context),
                child: const MyText('Dire bonjour')
            ))),
            Expanded(child: FutureBuilder(
              future: _history,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data!;
                  return ListView.builder(
                    padding: defaultPadding,
                    itemCount: data.length,
                    itemBuilder:(context, index) =>
                        MyText('${_dateTimeFormat.format(data[index].date)} : ${data[index].name}'));
                } else {
                  return const Text('Chargement...');
                }
              }))
      ]),
    )));
  }
}
