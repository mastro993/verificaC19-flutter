import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path/path.dart' as path;

String getRandomName() {
  var random = Random().nextInt(pow(2, 32) as int).toString();
  return '${random}_tmp';
}

Future<Isar> openTempIsar({
  required List<CollectionSchema<dynamic>> schemas,
  String? name,
}) async {
  await Isar.initializeIsarCore(download: true);

  return Isar.open(
    schemas,
    name: name ?? getRandomName(),
  );
}
