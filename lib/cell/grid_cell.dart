import 'dart:ui';

import 'package:flutter/material.dart';
import '../model/kata.dart';

class KataCell extends StatelessWidget {
  @required
  final Kata kata;

  const KataCell(this.kata);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Hero(
                      tag: "image${kata.id}",
                      child: FadeInImage.assetNetwork(
                        placeholder: "assets/images/ic-user.png",
                        image: kata.gambar!,
                        width: 100,
                        height: 100,
                      ),
                    ))),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        kata.bing!,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)
                      )
                    )
          ],
        ),
      ),
    );
  }
}
