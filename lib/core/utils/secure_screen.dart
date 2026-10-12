import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';

/// Android FLAG_SECURE (blocks screenshots and screen recording) for
/// scrapbook screens. iOS cannot fully block screenshots; see
/// docs/FRONTEND_DECISIONS.md.
abstract final class SecureScreen {
  static const MethodChannel _channel = MethodChannel('app.sparkteens.spark/secure_screen');

  static bool get _supported => !kIsWeb && defaultTargetPlatform == TargetPlatform.android;

  static Future<void> enable() async {
    if (!_supported) return;
    try {
      await _channel.invokeMethod<void>('enable');
    } on MissingPluginException {
      // Running in a test or a host without the channel.
    }
  }

  static Future<void> disable() async {
    if (!_supported) return;
    try {
      await _channel.invokeMethod<void>('disable');
    } on MissingPluginException {
      // Running in a test or a host without the channel.
    }
  }
}

/// Enables [SecureScreen] while this widget is mounted.
class SecureScreenScope extends StatefulWidget {
  const SecureScreenScope({super.key, required this.child});

  final Widget child;

  @override
  State<SecureScreenScope> createState() => _SecureScreenScopeState();
}

class _SecureScreenScopeState extends State<SecureScreenScope> {
  @override
  void initState() {
    super.initState();
    SecureScreen.enable();
  }

  @override
  void dispose() {
    SecureScreen.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
