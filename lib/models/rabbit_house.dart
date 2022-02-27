// restaurant.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rabbit_house.freezed.dart';
part 'rabbit_house.g.dart';

@freezed
class RabbitHouseModel with _$RabbitHouseModel {
  factory RabbitHouseModel({
    required final List<RabbitHouseMenu> coffee,
    @JsonKey(name: 'straight coffee')
        required final List<RabbitHouseMenu> straightCoffee,
    @JsonKey(name: 'arrange coffee')
        required final List<RabbitHouseMenu> arrangeCofee,
    required final List<RabbitHouseMenu> others,
    required final List<RabbitHouseMenu> food,
  }) = _RabbitHouseModel;

  factory RabbitHouseModel.fromJson(Map<String, dynamic> json) =>
      _$RabbitHouseModelFromJson(json);
}

extension JsonUtils on RabbitHouseModel {
  List<String> get keys => [
        "coffee",
        "straightCoffee",
        "arrangeCoffee",
        "others",
        "food",
      ];

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  String formatKey(String key) {
    switch (key) {
      case "straightCoffee":
        return "Straight Coffee";
      case "arrangeCoffee":
        return "Arrange Coffee";
      default:
        return capitalize(key);
    }
  }

  List<RabbitHouseMenu>? by(String key) {
    switch (key) {
      case "coffee":
        return coffee;
      case "straightCoffee":
        return straightCoffee;
      case "arrangeCoffee":
        return arrangeCofee;
      case "others":
        return others;
      case "food":
        return food;
      default:
        throw Exception("Invalid Rabbit House Menu key");
    }
  }
}

@freezed
class RabbitHouseMenu with _$RabbitHouseMenu {
  factory RabbitHouseMenu({
    required RabbitHouseName name,
    required RabbitHousePrice price,
  }) = _RabbitHouseMenu;

  factory RabbitHouseMenu.fromJson(Map<String, dynamic> json) =>
      _$RabbitHouseMenuFromJson(json);
}

@freezed
class RabbitHouseName with _$RabbitHouseName {
  factory RabbitHouseName({
    required String en,
    required String jp,
  }) = _RabbitHouseName;

  factory RabbitHouseName.fromJson(Map<String, dynamic> json) =>
      _$RabbitHouseNameFromJson(json);
}

@freezed
class RabbitHousePrice with _$RabbitHousePrice {
  factory RabbitHousePrice({
    required double usd,
    required int jpy,
  }) = _RabbitHousePrice;

  factory RabbitHousePrice.fromJson(Map<String, dynamic> json) =>
      _$RabbitHousePriceFromJson(json);
}
