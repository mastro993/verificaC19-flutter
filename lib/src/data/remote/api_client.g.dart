// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://get.dgc.gov.it/v1/dgc';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<String>> getCertUpdate(resumeToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'User-Agent': 'verificac19-flutter/1.4.2',
      r'x-resume-token': resumeToken
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<String>(
        _setStreamType<HttpResponse<String>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/signercertificate/update',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<List<String>>> getCertStatus() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'User-Agent': 'verificac19-flutter/1.4.2'
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<HttpResponse<List<String>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/signercertificate/status',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!.cast<String>();
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<List<ValidationRule>>> getValidationRules() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'User-Agent': 'verificac19-flutter/1.4.2'
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<HttpResponse<List<ValidationRule>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/settings',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ValidationRule.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CRLStatus>> getCRLStatus({version}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'version': version};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'User-Agent': 'verificac19-flutter/1.4.2'
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<CRLStatus>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/drl/check',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CRLStatus.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CRL>> getCRL({version, chunk}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'version': version,
      r'chunk': chunk
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'User-Agent': 'verificac19-flutter/1.4.2'
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<CRL>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/drl',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CRL.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
