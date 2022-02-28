import 'package:flutter/material.dart';

import 'package:niku/niku.dart';
import 'package:niku/namespace.dart' as n;

class S {
  static final col = n.Column(const [])
    ..crossStart
    ..w100;

  static final inline = n.ListView()
    ..shrinkWrap = true
    ..neverScroll;

  static final inlineList = inline.copied
    ..useSeparatorBuilder(
      (context, index) => const Divider(height: 1),
    )
    ..shrinkWrap = true
    ..neverScroll
    ..p = 0
    ..useParent((v) => v
      ..useThemeSelector(
        light: (v) => v..bg = Colors.white,
        dark: (v) => v..bg = Colors.grey.shade800,
      )
      ..rounded = 16);

  static searchBox(BuildContext context) => n.TextFormField.hint("Find a menu")
    ..textAlignVertical = TextAlignVertical.center
    ..borderColor = Colors.transparent
    ..useThemeSelector(
      context,
      light: (v) => v..bg = Colors.grey.shade200,
      dark: (v) => v..bg = Colors.grey.shade800,
    )
    ..contentPadding = n.EdgeInsets.all(0)
    ..prefixIcon = Icon(Icons.search, color: Colors.grey.shade500)
    ..px = 16
    ..py = 0
    ..mb = 16
    ..useParent((v) => v..rounded = 8);
}
