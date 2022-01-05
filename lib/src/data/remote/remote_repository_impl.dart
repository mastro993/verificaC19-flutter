import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:verificac19/src/data/model/crl.dart';
import 'package:verificac19/src/data/model/crl_status.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';
import 'package:verificac19/src/data/remote/api_client.dart';
import 'package:verificac19/src/data/remote/remote_repository.dart';
import 'package:verificac19/verificac19.dart';

@Environment(Environment.prod)
@LazySingleton(as: RemoteRepository)
class RemoteRepositoryImpl implements RemoteRepository {
  final ApiClient _client;

  RemoteRepositoryImpl({Dio? dio}) : _client = ApiClient(dio ?? Dio());

  @factoryMethod
  static RemoteRepository create() => RemoteRepositoryImpl();

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
  Future<CRL> getRevokeListChunk({
    int? version,
    int? chunk,
  }) async {
    try {
      final HttpResponse<CRL> response = await _client.getRevokeList(
        version: version,
        chunk: chunk,
      );
      final CRL data = response.data;
      return data;
    } catch (e) {
      throw ServiceException('Unable to get revoke list chunk from server');
    }
  }

  @override
  Future<CRLStatus> getRevokeListStatus({
    int? version,
  }) async {
    try {
      final HttpResponse<CRLStatus> response = await _client.getCRLStatus(
        version: version,
      );
      final CRLStatus data = response.data;
      return data;
    } catch (e) {
      throw ServiceException('Unable to get revoke list status from server');
    }
  }
}
