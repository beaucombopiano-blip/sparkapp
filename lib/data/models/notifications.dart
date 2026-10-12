import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications.freezed.dart';
part 'notifications.g.dart';

/// One locally scheduled notification from `getNotificationPlan`.
@freezed
abstract class NotificationPlanItem with _$NotificationPlanItem {
  const factory NotificationPlanItem({
    required String id,

    /// dailyQuote | sessionReminder | ...
    @Default('dailyQuote') String type,
    required DateTime fireAt,
    @Default('') String title,
    @Default('') String body,

    /// App route to open when tapped (e.g. "/focus?sessionId=abc").
    String? route,
  }) = _NotificationPlanItem;

  factory NotificationPlanItem.fromJson(Map<String, dynamic> json) => _$NotificationPlanItemFromJson(json);
}

@freezed
abstract class NotificationPlan with _$NotificationPlan {
  const factory NotificationPlan({
    @Default(<NotificationPlanItem>[]) List<NotificationPlanItem> items,
    DateTime? generatedAt,
  }) = _NotificationPlan;

  factory NotificationPlan.fromJson(Map<String, dynamic> json) => _$NotificationPlanFromJson(json);
}
