import 'package:ex3_front_api/components.dart';
import 'package:ex3_front_api/consts.dart';
import 'package:ex3_front_api/repositories/favorites.dart';
import 'package:ex3_front_api/widgets/favorite_button.dart';
import 'package:ex3_front_api/widgets/favorites_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(child: Scaffold(
        appBar: AppBar(
        title: const Text('Favoris'),
    ),
    body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Consumer<FavoritesRepository>(
          builder: (context, favorites, child) =>
            Expanded(child: ListView.builder(
              padding: defaultPadding,
              itemCount: favorites.count,
              itemBuilder: (context, index){
                final favorite = favorites.get(index);
                return Row(children:[
                  FavoriteButton(favorite),
                  MyText(favorite.label)
                ]);
              }))),
      const FavoritesBar()])
    ));
  }
}