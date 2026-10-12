// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationPlanItem _$NotificationPlanItemFromJson(
  Map<String, dynamic> json,
) => _NotificationPlanItem(
  id: json['id'] as String,
  type: json['type'] as String? ?? 'dailyQuote',
  fireAt: DateTime.parse(json['fireAt'] as String),
  title: json['title'] as String? ?? '',
  body: json['body'] as String? ?? '',
  route: json['route'] as String?,
);

Map<String, dynamic> _$NotificationPlanItemToJson(
  _NotificationPlanItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'fireAt': instance.fireAt.toIso8601String(),
  'title': instance.title,
  'body': instance.body,
  'route': ?instance.route,
};

_NotificationPlan _$NotificationPlanFromJson(Map<String, dynamic> json) =>
    _NotificationPlan(
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) => NotificationPlanItem.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <NotificationPlanItem>[],
      generatedAt: json['generatedAt'] == null
          ? null
          : DateTime.parse(json['generatedAt'] as String),
    );

Map<String, dynamic> _$NotificationPlanToJson(_NotificationPlan instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'generatedAt': ?instance.generatedAt?.toIso8601String(),
    };
