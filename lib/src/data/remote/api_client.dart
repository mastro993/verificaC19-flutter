import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:verificac19/src/data/model/crl.dart';
import 'package:verificac19/src/data/model/crl_status.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://get.dgc.gov.it/v1/dgc')
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET("/signercertificate/update")
  Future<HttpResponse<String>> getCertUpdate(
    @Header('x-resume-token') int resumeToken,
  );

  @GET("/signercertificate/status")
  Future<HttpResponse<List<String>>> getCertStatus();

  @GET("/settings")
  Future<HttpResponse<List<ValidationRule>>> getValidationRules();

  @GET("/drl/check")
  Future<HttpResponse<CRLStatus>> getCRLStatus({
    @Query("version") int? version,
  });

  @GET("/drl")
  Future<HttpResponse<CRL>> getRevokeList({
    @Query("version") int? version,
    @Query("chunk") int? chunk,
  });
}
