import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:niku/niku.dart';
import 'package:niku/namespace.dart' as n;

import 'package:rabbit_house/models/rabbit_house.dart';
import 'package:rabbit_house/stores/stores.dart';

class MenuItem extends HookConsumerWidget {
  const MenuItem(
    this.menu, {
    Key? key,
  }) : super(key: key);

  final RabbitHouseMenu menu;

  @override
  build(context, ref) {
    final language = ref.watch(languageProvider);

    final _intl = useMemoized(
      () => {
        Languages.en: {
          'title': menu.name.en,
          'subtitle': menu.name.jp,
          'price': "\$${menu.price.usd}",
        },
        Languages.jp: {
          "title": menu.name.jp,
          "subtitle": menu.name.en,
          "price": "${menu.price.jpy}円",
        }
      },
      [menu],
    );

    final intl = useMemoized(() => _intl[language], [language])!;

    return n.Column([
      n.Text(intl['subtitle'])
        ..color = Colors.grey.shade500
        ..fontSize = 11,
      n.Row([
        n.Text(intl['title'])
          ..fontSize = 16
          ..w400,
        n.Text(intl['price'])
          ..color = Colors.grey
          ..w300,
      ])
        ..mainBetween,
    ])
      ..crossStart
      ..gap = 4
      ..useParent((v) => v
        ..px = 16
        ..py = 12);
  }
}
