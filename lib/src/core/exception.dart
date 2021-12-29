class _Exception implements Exception {
  String reason;
  _Exception(this.reason);
  @override
  String toString() {
    return reason;
  }
}

class CertificateException extends _Exception {
  CertificateException([String reason = '']) : super(reason);
}

class ParseException extends _Exception {
  ParseException([String reason = '']) : super(reason);
}

class ValidationException extends _Exception {
  ValidationException([String reason = '']) : super(reason);
}

class ServiceException extends _Exception {
  ServiceException([String reason = '']) : super(reason);
}

class CacheException extends _Exception {
  CacheException([String reason = '']) : super(reason);
}
