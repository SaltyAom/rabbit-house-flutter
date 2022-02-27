import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:niku/namespace.dart' as n;

import 'package:rabbit_house/components/language.dart';

import 'package:rabbit_house/styles/styles.dart';

class MenuLayout extends HookWidget {
  const MenuLayout({Key? key, required this.child, required this.search})
      : super(key: key);

  final Widget child;
  final ValueNotifier<String> search;

  @override
  build(context) {
    return n.Column([
      const LanguageSwitcher(),
      n.Text("Rabbit House")
        ..bold
        ..fontSize = 36,
      n.TextFormField()
        ..of(S.searchBox(context))
        ..onChanged = (value) {
          search.value = value;
        },
      child,
    ])
      ..of(S.col)
      ..mx = 16
      ..gap = 16
      ..scrollable
      ..safeTop;
  }
}
