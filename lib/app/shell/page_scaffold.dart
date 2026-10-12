import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../routes.dart';
import 'spark_top_bar.dart';

/// Scaffold for full-screen pages outside the tab shell (companion, settings,
/// check-ins…). Keeps the same SparkTopBar: logo upper left (back arrow next
/// to it), title, settings gear upper right.
class SparkPageScaffold extends StatelessWidget {
  const SparkPageScaffold({
    super.key,
    required this.title,
    required this.body,
    this.showSettings = true,
    this.trailing,
    this.bottomBar,
    this.floatingActionButton,
    this.onBack,
    this.resizeToAvoidBottomInset = true,
    this.endDrawer,
    this.scaffoldKey,
  });

  final String title;
  final Widget body;
  final bool showSettings;
  final Widget? trailing;
  final Widget? bottomBar;
  final Widget? floatingActionButton;

  /// Defaults to popping, or going to the Dashboard when nothing to pop.
  final VoidCallback? onBack;
  final bool resizeToAvoidBottomInset;
  final Widget? endDrawer;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return Scaffold(
      key: scaffoldKey,
      endDrawer: endDrawer,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: SparkTopBar(
        title: title,
        onLogoTap: () => context.go(Routes.dashboard),
        onSettingsTap: showSettings ? () => context.push(Routes.settings) : null,
        onBack: onBack ?? () => router.canPop() ? context.pop() : context.go(Routes.dashboard),
        trailing: trailing,
      ),
      body: body,
      bottomNavigationBar: bottomBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
