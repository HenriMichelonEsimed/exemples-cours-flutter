import 'package:ex3_front_api/model/favorite.dart';
import 'package:ex3_front_api/repositories/favorites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatelessWidget {

  final Favorite favorite;
  const FavoriteButton(this.favorite, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8),
        child: Consumer<FavoritesRepository>(
            builder: (context, favorites, child) {
              return IconButton(
                  icon: Icon(favorites.isFavorite(favorite) ?
                          Icons.favorite : Icons.favorite_outline),
                  style: ButtonStyle(foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.red)),
                  onPressed: () {
                    if (favorites.isFavorite(favorite)) {
                      favorites.remove(favorite);
                    } else {
                      favorites.add(favorite);
                    }
                  });
            }));
  }
}