import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:verificac19/src/data/local/local_repository.dart';
import 'package:verificac19/src/data/remote/remote_repository.dart';

export 'mocks.mocks.dart';

@GenerateMocks([
  HiveInterface,
  Box,
  LocalRepository,
  RemoteRepository,
  HttpClientAdapter,
])
// ignore: unused_element, prefer_typing_uninitialized_variables
var _mocks;
