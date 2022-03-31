import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verificac19/src/data/local/local_repository.dart';
import 'package:verificac19/src/data/remote/remote_repository.dart';

export 'mocks.mocks.dart';

@GenerateMocks([
  LocalRepository,
  RemoteRepository,
  HttpClientAdapter,
  SharedPreferences,
])
// ignore: unused_element, prefer_typing_uninitialized_variables
var _mocks;
