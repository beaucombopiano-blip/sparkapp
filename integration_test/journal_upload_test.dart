import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:integration_test/integration_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:spark/app/routes.dart';

import 'helpers/driver.dart';
import 'helpers/emulator.dart';

/// Picks a photo (a generated PNG stands in for the gallery), uploads it to
/// the Storage emulator, and waits for the backend to process the entry.
class _FakeImagePicker extends ImagePickerPlatform {
  _FakeImagePicker(this.path);
  final String path;

  @override
  Future<XFile?> getImageFromSource({required ImageSource source, ImagePickerOptions options = const ImagePickerOptions()}) async =>
      XFile(path, mimeType: 'image/png');
}

Future<String> _writeTestPhoto() async {
  final recorder = ui.PictureRecorder();
  ui.Canvas(recorder).drawColor(const ui.Color(0xFF65B4C1), ui.BlendMode.src);
  final image = await recorder.endRecording().toImage(640, 480);
  final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
  final file = File('${Directory.systemTemp.createTempSync('spark').path}/photo.png');
  await file.writeAsBytes(bytes!.buffer.asUint8List());
  return file.path;
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final admin = EmulatorAdmin();

  setUp(admin.reset);

  testWidgets('add a photo to the journal', (tester) async {
    ImagePickerPlatform.instance = _FakeImagePicker(await _writeTestPhoto());
    await launchApp(tester);
    await signUp(tester, admin, email: 'journal@example.com');
    await onboardPathB(tester);

    routerOf(tester).go(Routes.journal);
    await tapWhenReady(tester, find.byKey(const Key('journal-add')));
    await tapWhenReady(tester, find.text(l10n.journalLibrary));
    await pumpUntil(tester, find.byType(TextField));
    await tester.enterText(find.byType(TextField).last, 'Integration test photo');
    await tapWhenReady(tester, find.byKey(const Key('journal-upload')));

    // The entry appears once the backend has processed the upload.
    await pumpUntil(tester, find.text('Integration test photo'), timeout: const Duration(minutes: 2));
  });
}
