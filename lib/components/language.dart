import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:niku/namespace.dart' as n;

import 'package:rabbit_house/stores/stores.dart';

class LanguageSwitcher extends HookConsumerWidget {
  const LanguageSwitcher({Key? key}) : super(key: key);

  @override
  build(context, ref) {
    final language = ref.watch(languageProvider);

    useEffect(() {
      ref.read(languageProvider.notifier).init();

      return () {};
    });

    updateLanguage(String? v) async {
      if (v == null) return;

      ref.read(languageProvider.notifier).update(languageMap[v] as Languages);
    }

    return n.Row([
      n.DropdownButton(languageMap[language] as String)
        ..onChanged = updateLanguage
        ..elevation = 2
        ..itemsValue = [Languages.en, Languages.jp]
            .map((v) => languageMap[v] as String)
            .toList()
        ..noUnderline
        ..icon = const SizedBox.shrink()
        ..color = Colors.blue
    ])
      ..mainEnd
      ..px = 4;
  }
}
