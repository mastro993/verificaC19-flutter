import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:verificac19/src/data/model/crl.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';
import 'package:verificac19/src/data/remote/api_client.dart';
import 'package:verificac19/src/data/remote/remote_repository.dart';
import 'package:verificac19/verificac19.dart';

class RemoteRepositoryImpl implements RemoteRepository {
  final ApiClient _client;

  RemoteRepositoryImpl({Dio? dio}) : _client = ApiClient(dio ?? Dio());

  @override
  Future<List<ValidationRule>> getValidationRules() async {
    try {
      final response = await _client.getValidationRules();
      return response.data;
    } catch (e) {
      throw ServiceException('Unable to get rules from server');
    }
  }

  @override
  Future<Map<String, String>> getSignatures() async {
    try {
      final Map<String, String> signatures = {};
      HttpResponse<String> result;
      int resumeToken = 0;

      do {
        result = await _client.getCertUpdate(resumeToken);

        if (result.response.statusCode == 200) {
          final resumeTokenHeader =
              result.response.headers.value('x-resume-token')!;
          final xKid = result.response.headers.value('x-kid')!;

          resumeToken = int.parse(resumeTokenHeader);

          final String signature = result.response.data!;

          signatures[xKid] =
              '-----BEGIN CERTIFICATE-----$signature-----END CERTIFICATE-----';
        }
      } while (result.response.statusCode == 200);

      return signatures;
    } catch (e) {
      throw ServiceException('Unable to get signatures from server');
    }
  }

  @override
  Future<List<String>> getSignaturesList() async {
    try {
      final HttpResponse<List<dynamic>> response =
          await _client.getCertStatus();
      final List<dynamic> data = response.data;
      final List<String> signaturesList = data.cast<String>();
      return signaturesList.toList();
    } catch (e) {
      throw ServiceException('Unable to get signatures list from server');
    }
  }

  @override
  Future<List<String>> getRevokeList() async {
    try {
      int chunk = 1;
      int lastChunk = 0;
      HttpResponse<CRL> crlResponse;
      List<String> revokedCerts = [];

      do {
        crlResponse = await _client.getRevokeList(chunk: chunk);
        revokedCerts.addAll(crlResponse.data.revokedUcvi!);
        lastChunk = crlResponse.data.lastChunk!;
        chunk = chunk + 1;
      } while (chunk <= lastChunk);

      return revokedCerts;
    } catch (e) {
      throw ServiceException('Unable to get revoke list from server');
    }
  }
}
