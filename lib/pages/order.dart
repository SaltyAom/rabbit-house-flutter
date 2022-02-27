import 'package:flutter/material.dart';

import 'package:niku/namespace.dart' as n;

import 'package:rabbit_house/models/rabbit_house.dart';

import 'package:rabbit_house/styles/styles.dart';

import '../components/menu_item.dart';

import 'package:rabbit_house/components/menu_item.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({
    Key? key,
    required this.title,
    required this.menus,
  }) : super(key: key);

  final String title;
  final List<RabbitHouseMenu> menus;

  @override
  build(context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 8,
        title: n.Button(
          n.Row([
            n.Icon(Icons.chevron_left_rounded)..size = 36,
            n.Text("Rabbit House"),
          ])
            ..crossCenter,
        )
          ..onPressed = () {
            Navigator.pop(context);
          }
          ..w400
          ..fontSize = 16
          ..splash = Colors.transparent
          ..p = 0
          ..useParent((v) => v..w = 140),
      ),
      body: n.Column([
        n.Text(title)
          ..color = Colors.grey.shade500
          ..ml = 8
          ..mb = 8,
        n.ListView.separated()
          ..of(S.inlineList)
          ..total = menus.length
          ..useItemBuilder((context, index) => MenuItem(menus[index])),
      ])
        ..crossStart
        ..px = 16,
    );
  }
}
