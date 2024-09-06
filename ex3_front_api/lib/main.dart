import 'package:ex3_front_api/components.dart';
import 'package:ex3_front_api/consts.dart';
import 'package:ex3_front_api/database.dart';
import 'package:ex3_front_api/model/results.dart';
import 'package:ex3_front_api/repositories/favorites.dart';
import 'package:ex3_front_api/services/api-adresse.dart';
import 'package:ex3_front_api/widgets/favorites_bar.dart';
import 'package:ex3_front_api/widgets/result_entry.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  /*final api = AdresseAPI();
  final results = await api.search("edmond rostand");*/
  WidgetsFlutterBinding.ensureInitialized();
  await FavoritesDatabase().open();
  runApp(ChangeNotifierProvider(
      create: (context) => FavoritesRepository(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final String title;
  final api = AdresseAPI();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  late String _query;
  late Future<Results> _results;
  var _noInitialSearch = true;

  _search(context) {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState?.save();
    _results = widget.api.search(_query)
      .then((value) {
        setState(() => _noInitialSearch = false);
        return value;
      })
      .catchError((_) => showNetworkErrorDialog(context));
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
          children: [
            Row(children: [
              Expanded(child:
                TextFormField(
                  onSaved: (v) => _query = v.toString(),
                  //validator: (v) => stringNotEmptyValidator(v,  ),
                  validator: (value) {
                    if (value == null || value.length < 3) {
                      return 'Veuillez saisir une adresse d\'au moins 3 caractères';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: 'Adresse à chercher'),
                )),
                IconButton(
                  onPressed: () => _search(context),
                  icon: const Icon(Icons.search)
                )
            ],),
            _noInitialSearch ?
              Expanded(child: Container())
                :
              Expanded(child: FutureBuilder<Results>(
                  future: _results,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data!;
                      if (data.features != null) {
                        final features = data.features!;
                        return ListView.builder(
                            itemCount: features.length,
                            itemBuilder: (context, index) =>
                                ResultEntry(feature: features[index])
                        );
                      }
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                )
            ),
            const FavoritesBar()
          ],
        ),
      // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}
