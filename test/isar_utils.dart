import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path/path.dart' as path;

String getRandomName() {
  var random = Random().nextInt(pow(2, 32) as int).toString();
  return '${random}_tmp';
}

String? isarTestTempPath;

void registerBinaries() {
  if (!kIsWeb && isarTestTempPath == null) {
    final binDir = path.join(Directory.current.path, 'test', 'binaries');
    isarTestTempPath = path.join(Directory.current.path, 'test', 'tmp');
    try {
      Isar.initializeLibraries(
        libraries: {
          'windows': path.join(binDir, 'libisar_windows_x64.dll'),
          'macos': path.join(binDir, 'libisar_macos_x64.dylib'),
          'linux': path.join(binDir, 'libisar_linux_x64.so'),
        },
      );
    } catch (e) {
      // ignore. maybe this is an instrumentation test
    }
  }
}

Future<Isar> openTempIsar({
  required List<CollectionSchema<dynamic>> schemas,
  String? name,
}) async {
  registerBinaries();

  return Isar.open(
    schemas: schemas,
    name: name ?? getRandomName(),
    directory: kIsWeb ? '' : isarTestTempPath!,
  );
}
