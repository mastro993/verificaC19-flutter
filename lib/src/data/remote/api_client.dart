import 'package:dio/dio.dart' show Dio, Options, RequestOptions, ResponseType;
import 'package:retrofit/retrofit.dart';
import 'package:verificac19/src/data/model/crl.dart';
import 'package:verificac19/src/data/model/crl_status.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://get.dgc.gov.it/v1/dgc')
abstract class ApiClient {
  static const _headers = <String, dynamic>{
    'User-Agent': 'verificac19-flutter/1.4.2',
  };

  factory ApiClient(Dio dio) = _ApiClient;

  @GET("/signercertificate/update")
  @Headers(_headers)
  Future<HttpResponse<String>> getCertUpdate(
    @Header('x-resume-token') int resumeToken,
  );

  @GET("/signercertificate/status")
  @Headers(_headers)
  Future<HttpResponse<List<String>>> getCertStatus();

  @GET("/settings")
  @Headers(_headers)
  Future<HttpResponse<List<ValidationRule>>> getValidationRules();

  @GET("/drl/check")
  @Headers(_headers)
  Future<HttpResponse<CRLStatus>> getCRLStatus({
    @Query("version") int? version,
  });

  @GET("/drl")
  @Headers(_headers)
  Future<HttpResponse<CRL>> getCRL({
    @Query("version") int? version,
    @Query("chunk") int? chunk,
  });
}
