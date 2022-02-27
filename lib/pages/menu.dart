import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:niku/niku.dart';
import 'package:niku/namespace.dart' as n;

import 'package:dio/dio.dart';
import 'package:rabbit_house/components/language.dart';
import 'package:rabbit_house/layous/layouts.dart';

import 'package:rabbit_house/pages/order.dart';
import 'package:rabbit_house/components/menu_item.dart';

import 'package:rabbit_house/models/rabbit_house.dart';
import 'package:rabbit_house/styles/styles.dart';

class MenuPage extends HookWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  build(context) {
    final rabbitHouse = useState<RabbitHouseModel?>(null);
    final success = useState<bool?>(null);
    final search = useState<String>("");

    void getRabbitHouse() async {
      success.value = null;

      try {
        final response = await Dio().get(
          'https://is-the-order-a-rabbit-api.onrender.com',
        );

        if (response.statusCode != 200) {
          throw const HttpException('Invalid response');
        }

        rabbitHouse.value = RabbitHouseModel.fromJson(response.data);
        success.value = true;
      } catch (e) {
        success.value = false;
      }
    }

    useEffect(() {
      getRabbitHouse();

      return () {};
    }, []);

    if (success.value == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (success.value == false) {
      return n.Column([
        n.Text("Can't connect to Rabbit House")..fontSize = 21,
        n.Text("Check your internet connection and try again")
          ..color = Colors.grey
          ..w300
          ..mt = 12
          ..mb = 36,
        n.Button(const Text("Reload"))
          ..onPressed = getRabbitHouse
          ..fontSize = 18
          ..w600
          ..fg = Colors.white
          ..bg = Colors.blue
          ..splash = Colors.white.withOpacity(.1)
          ..px = 36
          ..py = 12
          ..rounded = 8,
      ])
        ..of(S.col)
        ..px = 8;
    }

    final menuTypes = rabbitHouse.value!.keys;

    showMenu({
      required String title,
      required List<RabbitHouseMenu> menus,
    }) =>
        () async {
          final page = await Future.microtask(
            () => OrderPage(title: title, menus: menus),
          );

          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => page),
          );
        };

    if (search.value.isNotEmpty) {
      final results = menuTypes
          .map((type) => rabbitHouse.value!.by(type))
          .expand((v) => v!)
          .where(
            (menu) =>
                menu.name.en
                    .toLowerCase()
                    .contains(search.value.toLowerCase()) ||
                menu.name.jp.contains(search.value),
          )
          .toList(growable: false);

      return MenuLayout(
        search: search,
        child: n.Column([
          n.Text("Results for '${search.value}'")
            ..color = Colors.grey.shade500
            ..ml = 8
            ..mb = 4,
          n.ListView.separated()
            ..of(S.inlineList)
            ..total = results.length
            ..useItemBuilder((context, index) => MenuItem(results[index])),
        ])
          ..crossStart,
      );
    }

    return MenuLayout(
      search: search,
      child: n.Column([
        n.Column([
          n.Text("Menu")
            ..color = Colors.grey.shade500
            ..ml = 8
            ..mb = 4,
          n.ListView.separated()
            ..of(S.inlineList)
            ..total = menuTypes.length
            ..useItemBuilder((context, index) {
              final type = menuTypes[index];

              return n.Button(
                n.Row([
                  n.Text(rabbitHouse.value!.formatKey(type))..fontSize = 16,
                  Icon(
                    Icons.chevron_right_outlined,
                    color: Colors.grey.shade400,
                  )
                ])
                  ..mainBetween
                  ..crossCenter,
              )
                ..onPressed = showMenu(
                  title: rabbitHouse.value!.formatKey(type),
                  menus: rabbitHouse.value!.by(type)!,
                )
                ..color = Colors.black
                ..splash = Colors.grey.shade200
                ..px = 16
                ..py = 12;
            }),
        ])
          ..crossStart,
        n.ListView.builder()
          ..of(S.inline)
          ..total = menuTypes.length
          ..useItemBuilder((context, index) {
            final type = menuTypes[index];
            final menus = rabbitHouse.value!.by(type)!;

            return n.Column([
              n.Text(rabbitHouse.value!.formatKey(type))
                ..color = Colors.grey.shade500
                ..ml = 8
                ..mb = 4,
              n.ListView.separated()
                ..of(S.inlineList)
                ..total = menus.length
                ..useItemBuilder((context, index) => MenuItem(menus[index]))
            ])
              ..crossStart
              ..my = 12;
          }),
      ]),
    );
  }
}
