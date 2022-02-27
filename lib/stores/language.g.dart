// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LanguageAdapter extends TypeAdapter<Language> {
  @override
  final int typeId = 1;

  @override
  Language read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Language(
      fields[0] as Languages,
    );
  }

  @override
  void write(BinaryWriter writer, Language obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LanguagesAdapter extends TypeAdapter<Languages> {
  @override
  final int typeId = 2;

  @override
  Languages read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Languages.en;
      case 1:
        return Languages.jp;
      default:
        return Languages.en;
    }
  }

  @override
  void write(BinaryWriter writer, Languages obj) {
    switch (obj) {
      case Languages.en:
        writer.writeByte(0);
        break;
      case Languages.jp:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguagesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
