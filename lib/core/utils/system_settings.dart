import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

/// Opens the OS notification settings for SPARK.
Future<bool> openNotificationSettings() async {
  if (kIsWeb) return false;
  if (defaultTargetPlatform == TargetPlatform.iOS) {
    return launchUrl(Uri.parse('app-settings:'));
  }
  if (defaultTargetPlatform == TargetPlatform.android) {
    try {
      await const MethodChannel('app.sparkteens.spark/system').invokeMethod<void>('openNotificationSettings');
      return true;
    } on PlatformException {
      return false;
    } on MissingPluginException {
      return false;
    }
  }
  return false;
}
