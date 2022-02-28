import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:niku/namespace.dart' as n;
import 'package:rabbit_house/stores/stores.dart';
import 'package:rabbit_house/styles/styles.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  build(context, ref) {
    final language = ref.watch(languageProvider);

    useEffect(() {
      ref.read(languageProvider.notifier).init();

      return () {};
    }, []);

    updateLanguage(String? v) async {
      if (v == null) return;

      ref.read(languageProvider.notifier).update(languageMap[v] as Languages);
    }

    return n.Column([
      n.Text("Settings")
        ..bold
        ..fontSize = 32,
      n.Column([
        n.Row([
          n.Text("Language")..fontSize = 16,
          n.DropdownButton(languageMap[language] as String)
            ..onChanged = updateLanguage
            ..elevation = 2
            ..itemsValue = [Languages.en, Languages.jp]
                .map((v) => languageMap[v] as String)
                .toList()
            ..noUnderline,
        ])
          ..mainBetween
          ..crossCenter,
      ])
        ..w100
        ..px = 16
        ..useParent((v) => v
          ..useThemeSelector(
            light: (v) => v..bg = Colors.white,
            dark: (v) => v..bg = Colors.grey.shade800,
          )
          ..rounded = 8),
    ])
      ..crossStart
      ..gap = 16
      ..w100
      ..useParent((v) => v
        ..px = 16
        ..pt = 16
        ..safeTop);
  }
}
