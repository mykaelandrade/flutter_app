import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sample/model/Pic.dart';

class PicCard extends StatelessWidget {
  final Pic item;
  final _random = Random();

  PicCard({this.item});

  int randomInt(int min, int max) => min * _random.nextInt(max - min);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3.0,
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2.5)),
                    image: DecorationImage(
                        image: NetworkImage(item.avatar), fit: BoxFit.cover)),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 10.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.remove_red_eye,
                    size: 20.0,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    randomInt(10, 10000).toString(),
                    style: Theme.of(context)
                        .textTheme
                        .display4
                        .copyWith(fontSize: 16),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
