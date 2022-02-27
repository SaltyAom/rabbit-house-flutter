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
      ..bg = Colors.white
      ..rounded = 16);

  static final searchBox = n.TextFormField(null)
    ..textAlignVertical = TextAlignVertical.center
    ..hintText = "Find a menu"
    ..borderColor = Colors.transparent
    ..bg = Colors.grey.shade200
    ..contentPadding = n.EdgeInsets.all(0)
    ..prefixIcon = Icon(Icons.search, color: Colors.grey.shade500)
    ..px = 16
    ..py = 0
    ..mb = 16
    ..useParent((v) => v..rounded = 8);
}
