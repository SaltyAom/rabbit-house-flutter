// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rabbit_house.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RabbitHouseModel _$$_RabbitHouseModelFromJson(Map<String, dynamic> json) =>
    _$_RabbitHouseModel(
      coffee: (json['coffee'] as List<dynamic>)
          .map((e) => RabbitHouseMenu.fromJson(e as Map<String, dynamic>))
          .toList(),
      straightCoffee: (json['straight coffee'] as List<dynamic>)
          .map((e) => RabbitHouseMenu.fromJson(e as Map<String, dynamic>))
          .toList(),
      arrangeCofee: (json['arrange coffee'] as List<dynamic>)
          .map((e) => RabbitHouseMenu.fromJson(e as Map<String, dynamic>))
          .toList(),
      others: (json['others'] as List<dynamic>)
          .map((e) => RabbitHouseMenu.fromJson(e as Map<String, dynamic>))
          .toList(),
      food: (json['food'] as List<dynamic>)
          .map((e) => RabbitHouseMenu.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RabbitHouseModelToJson(_$_RabbitHouseModel instance) =>
    <String, dynamic>{
      'coffee': instance.coffee,
      'straight coffee': instance.straightCoffee,
      'arrange coffee': instance.arrangeCofee,
      'others': instance.others,
      'food': instance.food,
    };

_$_RabbitHouseMenu _$$_RabbitHouseMenuFromJson(Map<String, dynamic> json) =>
    _$_RabbitHouseMenu(
      name: RabbitHouseName.fromJson(json['name'] as Map<String, dynamic>),
      price: RabbitHousePrice.fromJson(json['price'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RabbitHouseMenuToJson(_$_RabbitHouseMenu instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
    };

_$_RabbitHouseName _$$_RabbitHouseNameFromJson(Map<String, dynamic> json) =>
    _$_RabbitHouseName(
      en: json['en'] as String,
      jp: json['jp'] as String,
    );

Map<String, dynamic> _$$_RabbitHouseNameToJson(_$_RabbitHouseName instance) =>
    <String, dynamic>{
      'en': instance.en,
      'jp': instance.jp,
    };

_$_RabbitHousePrice _$$_RabbitHousePriceFromJson(Map<String, dynamic> json) =>
    _$_RabbitHousePrice(
      usd: (json['usd'] as num).toDouble(),
      jpy: json['jpy'] as int,
    );

Map<String, dynamic> _$$_RabbitHousePriceToJson(_$_RabbitHousePrice instance) =>
    <String, dynamic>{
      'usd': instance.usd,
      'jpy': instance.jpy,
    };
