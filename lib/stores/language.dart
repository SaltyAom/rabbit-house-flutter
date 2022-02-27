import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'language.g.dart';

final languageProvider = StateNotifierProvider<LanguageState, Languages>(
  (_) => LanguageState(Languages.en),
);

class LanguageState extends StateNotifier<Languages> {
  LanguageState(Languages initialState) : super(initialState);

  void init() async {
    final box = await Hive.openBox<Language>("language");
    final persisted = box.get("language");

    if (persisted != null) {
      state = persisted.value;
    }
  }

  void update(Languages language) async {
    state = language;

    final box = await Hive.openBox<Language>("language");
    box.put("language", Language(language));
  }
}

@HiveType(typeId: 2)
enum Languages {
  @HiveField(0)
  en,

  @HiveField(1)
  jp
}

final languageMap = {
  Languages.en: 'English',
  Languages.jp: '日本語',
  "English": Languages.en,
  "日本語": Languages.jp,
};

@HiveType(typeId: 1)
class Language {
  const Language(this.value);

  @HiveField(0)
  final Languages value;
}
