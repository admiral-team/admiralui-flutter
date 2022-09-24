import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:path/path.dart' as path;

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  setUpAll(() async {
    await loadAppFonts();
    await _load(_loadFontFile());

    final Future<ByteData> fontBold =
        rootBundle.load('lib/fonts/SFProDisplay-Bold.ttf');
    final Future<ByteData> fontMedium =
        rootBundle.load('lib/fonts/SFProDisplay-Medium.ttf');
    final Future<ByteData> fontRegular =
        rootBundle.load('lib/fonts/SFProDisplay-Regular.ttf');
    final Future<ByteData> fontSemibold =
        rootBundle.load('lib/fonts/SFProDisplay-Semibold.ttf');

    final FontLoader fontLoader = FontLoader('SFProDisplay')
      ..addFont(fontBold)
      ..addFont(fontRegular)
      ..addFont(fontSemibold)
      ..addFont(fontMedium);
    await fontLoader.load();

    final Future<ByteData> fontIcons =
        rootBundle.load('lib/fonts/AdmiralIcons.ttf');
    final FontLoader fontLoaderIcons = FontLoader('AdmiralIcons')
      ..addFont(fontIcons);
    await fontLoaderIcons.load();

    final Future<ByteData> fluentRegularIcon = rootBundle
        .load('packages/admiralui_flutter/lib/fonts/AdmiralIcons.ttf');

    final FontLoader fluentRegularLoader = FontLoader('AdmiralIcons')
      ..addFont(fluentRegularIcon);

    await fluentRegularLoader.load();
  });

  await testMain();
}

Map<String, List<Future<ByteData>>> _loadFontFile() {
  final Map<String, List<Future<ByteData>>> fontFamilyToData =
      <String, List<Future<ByteData>>>{};
  final String currentDir = path.dirname(Platform.script.path);
  final String fontsDirectory = path.join(
    currentDir,
    'lib',
    'fonts',
  );
  for (final FileSystemEntity file in Directory(fontsDirectory).listSync()) {
    if (file is File) {
      const String prefix = 'packages/admiralui_flutter/';
      final String fontFamily =
          prefix + path.basenameWithoutExtension(file.path).split('-').first;
      (fontFamilyToData[fontFamily] ??= <Future<ByteData>>[]).add(
        file.readAsBytes().then(
          (Uint8List bytes) {
            return ByteData.view(bytes.buffer);
          },
        ),
      );
    }
  }
  return fontFamilyToData;
}

Future<void> _load(Map<String, List<Future<ByteData>>> fontFamilyToData) async {
  final List<Future<void>> waitList = <Future<void>>[];
  for (final MapEntry<String, List<Future<ByteData>>> entry
      in fontFamilyToData.entries) {
    final FontLoader loader = FontLoader(entry.key);
    for (final Future<ByteData> data in entry.value) {
      loader.addFont(data);
    }
    waitList.add(loader.load());
  }
  await Future.wait(waitList);
}
