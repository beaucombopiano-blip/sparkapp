// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterDef _$CharacterDefFromJson(Map<String, dynamic> json) =>
    _CharacterDef(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      sampleNotification: json['sampleNotification'] as String?,
      assetKey: json['assetKey'] as String?,
      isPremium: json['isPremium'] as bool? ?? false,
      unlockRule: json['unlockRule'] as String?,
      color: json['color'] as String?,
      order: (json['order'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CharacterDefToJson(_CharacterDef instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'sampleNotification': ?instance.sampleNotification,
      'assetKey': ?instance.assetKey,
      'isPremium': instance.isPremium,
      'unlockRule': ?instance.unlockRule,
      'color': ?instance.color,
      'order': instance.order,
    };

_ThemeDef _$ThemeDefFromJson(Map<String, dynamic> json) => _ThemeDef(
  id: json['id'] as String,
  name: json['name'] as String? ?? '',
  kind: json['kind'] as String? ?? 'preset',
  palette:
      (json['palette'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Map<String, String>.from(e as Map)),
      ) ??
      const <String, Map<String, String>>{},
  availability: json['availability'] as String? ?? 'free',
  seasonStart: json['seasonStart'] as String?,
  seasonEnd: json['seasonEnd'] as String?,
  decoration: json['decoration'] as String?,
  order: (json['order'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ThemeDefToJson(_ThemeDef instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'kind': instance.kind,
  'palette': instance.palette,
  'availability': instance.availability,
  'seasonStart': ?instance.seasonStart,
  'seasonEnd': ?instance.seasonEnd,
  'decoration': ?instance.decoration,
  'order': instance.order,
};
