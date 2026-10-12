import 'package:material_ui/material_ui.dart';

/// Lets widgets from packages that still import `package:flutter/material.dart`
/// (table_calendar, flutter_markdown_plus, pdfx) resolve the app's theme and
/// localisations. The only place the temporary Flutter migration bridge is
/// used; delete once those packages move to `material_ui`.
class LegacyMaterialBridge extends StatelessWidget {
  const LegacyMaterialBridge({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return MaterialUiCompatibilityBridge(child: child);
  }
}
