import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:verificac19/src/data/remote/remote_repository_impl.dart';

import './fixtures/fixture_reader.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late RemoteRepositoryImpl remote;

  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    remote = RemoteRepositoryImpl(dio: dio);
  });

  group('Rules', () {
    test('Should fetch rules from server', () async {
      // arrange
      dioAdapter.onGet(
        '/settings',
        (request) {
          return request.reply(200, jsonDecode(fixture('rules.json')));
        },
        data: {},
        headers: {},
        queryParameters: {},
      );
      // act
      final response = await remote.getValidationRules();
      // assert
      assert(response.isNotEmpty);
    });
  });
  group('Signatures', () {
    test('Should fetch signatures from server', () async {
      // arrange
      List<dynamic> tSignaturesRaw = jsonDecode(fixture('DSC_validation.json'));
      List<Map<String, String>> tSignatures = tSignaturesRaw
          .map(
            (e) => <String, String>{...e},
          )
          .toList();

      dioAdapter.onGet(
        '/signercertificate/update',
        (request) {
          return request.reply(
            200,
            tSignatures[0]['raw_data'],
            headers: {
              "X-RESUME-TOKEN": ["1"],
              "X-KID": [tSignatures[0]['kid'] ?? '']
            },
          );
        },
        data: {},
        headers: {},
        queryParameters: {},
      );
      dioAdapter.onGet(
        '/signercertificate/update',
        (request) {
          return request.reply(204, "");
        },
        data: {},
        headers: {"X-RESUME-TOKEN": "1"},
        queryParameters: {},
      );
      // act
      final signatures = await remote.getSignatures();
      // assert
      assert(signatures.length == 1);
    });
  });
  group('Signatures list', () {
    test('Should fetch signatures list from server', () async {
      // arrange
      dioAdapter.onGet(
        '/signercertificate/status',
        (request) {
          return request.reply(
              200, jsonDecode(fixture('signatures_list.json')));
        },
        data: {},
        headers: {},
        queryParameters: {},
      );
      // act
      final response = await remote.getSignaturesList();
      // assert
      assert(response.isNotEmpty);
    });
  });
}
