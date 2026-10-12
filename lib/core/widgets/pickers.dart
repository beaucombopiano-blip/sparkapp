import 'package:cupertino_ui/cupertino_ui.dart' show CupertinoDatePicker, CupertinoDatePickerMode;
import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/theme/tokens.dart';
import '../utils/l10n.dart';
import 'spark_button.dart';

bool get _useCupertino =>
    !kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS);

/// Date picker: Cupertino wheel on iOS, Material calendar elsewhere.
/// [selectable] limits days (e.g. only days with availability).
Future<DateTime?> showSparkDatePicker(
  BuildContext context, {
  required DateTime initial,
  required DateTime first,
  required DateTime last,
  bool Function(DateTime day)? selectable,
}) async {
  DateTime clampDate(DateTime d) => d.isBefore(first) ? first : (d.isAfter(last) ? last : d);
  var start = clampDate(initial);
  if (selectable != null && !selectable(start)) {
    for (var d = first; !d.isAfter(last); d = d.add(const Duration(days: 1))) {
      if (selectable(d)) {
        start = d;
        break;
      }
    }
  }

  // The wheel can't disable individual days, so use the calendar when only
  // some days are selectable.
  if (_useCupertino && selectable == null) {
    var value = start;
    final l10n = context.l10n;
    return showModalBottomSheet<DateTime>(
      context: context,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(Space.m, 0, Space.m, Space.m),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 216,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: start,
                  minimumDate: first,
                  maximumDate: last,
                  onDateTimeChanged: (d) => value = d,
                ),
              ),
              SparkButton(
                label: l10n.commonDone,
                onPressed: () => Navigator.of(context).pop(DateUtils.dateOnly(value)),
                expand: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
  return showDatePicker(
    context: context,
    initialDate: start,
    firstDate: first,
    lastDate: last,
    selectableDayPredicate: selectable,
  );
}

/// Time picker: Cupertino wheel on iOS, Material dial elsewhere.
Future<TimeOfDay?> showSparkTimePicker(BuildContext context, {required TimeOfDay initial}) async {
  if (_useCupertino) {
    var value = initial;
    final l10n = context.l10n;
    return showModalBottomSheet<TimeOfDay>(
      context: context,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(Space.m, 0, Space.m, Space.m),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 216,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  minuteInterval: 5,
                  initialDateTime: DateTime(2000, 1, 1, initial.hour, initial.minute - initial.minute % 5),
                  onDateTimeChanged: (d) => value = TimeOfDay(hour: d.hour, minute: d.minute),
                ),
              ),
              SparkButton(label: l10n.commonDone, onPressed: () => Navigator.of(context).pop(value), expand: true),
            ],
          ),
        ),
      ),
    );
  }
  return showTimePicker(context: context, initialTime: initial);
}

String formatTimeOfDay(BuildContext context, TimeOfDay time) =>
    MaterialLocalizations.of(context).formatTimeOfDay(time, alwaysUse24HourFormat: MediaQuery.alwaysUse24HourFormatOf(context));
