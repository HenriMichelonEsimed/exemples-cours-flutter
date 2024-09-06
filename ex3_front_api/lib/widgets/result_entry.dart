import 'package:ex3_front_api/components.dart';
import 'package:ex3_front_api/model/favorite.dart';
import 'package:ex3_front_api/model/features.dart';
import 'package:ex3_front_api/widgets/favorite_button.dart';
import 'package:flutter/material.dart';

class ResultEntry extends StatelessWidget {
  final Features feature;
  const ResultEntry({required this.feature, super.key});

  @override
  Widget build(BuildContext context) {
    if (feature.properties?.label == null) return Container();
    final label = feature.properties!.label!;
    final cont = feature.properties?.context ?? '-';
    //return MyPadding(child: MyText(label));
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: MyPadding(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(label),
            /*Text(cont,
              style: const TextStyle(fontSize: 12),
            )*/
            Row(children: [
              Expanded(child: Text(cont,
                style: const TextStyle(fontSize: 12),
              )),
              FavoriteButton(Favorite(label, cont))
            ],)
    ]))));
  }
}