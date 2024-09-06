import 'package:ex4_login/components.dart';
import 'package:ex4_login/consts.dart';
import 'package:ex4_login/login_state.dart';
import 'package:ex4_login/models/car.dart';
import 'package:ex4_login/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarDetailsPage extends StatefulWidget {
  Car? car;
  CarDetailsPage({this.car, super.key});

  @override
  State<StatefulWidget> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  String? _titleError;
  String? _descriptionError;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  _insert() {

  }


  @override
  Widget build(BuildContext context) {
    return Material(child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text(appTitle),
        ),
        drawer: const MyDrawer(),
        body: Consumer<LoginState>(
          builder: (context, loginState, child) {
            if (!loginState.connected) return Container();
            return Padding(padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                TextField(
                    controller: _titleController,
                    style: defaulTextStyle,
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: 'Title',
                        errorText: _titleError
                    )),
                TextField(
                    controller: _descriptionController,
                    style: defaulTextStyle,
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: 'Description',
                        errorText: _descriptionError
                    )),
                SizedBox(
                    width: double.infinity,
                    child:MyPadding(
                        child: ElevatedButton(
                            onPressed: _insert,
                            child: MyText(widget.car == null ? 'Create' : 'Update')))),
            ]));
          },
        )));
  }
}