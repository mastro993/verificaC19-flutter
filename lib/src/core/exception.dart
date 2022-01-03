class _Exception implements Exception {
  String reason;
  _Exception(this.reason);
  @override
  String toString() {
    return reason;
  }
}

/// Thrown when Certificate contains unsupported data
class CertificateException extends _Exception {
  CertificateException([String reason = '']) : super(reason);
}

/// Thrown when is not possibile to get a Certificate from the provided raw data
class DecodeException extends _Exception {
  DecodeException([String reason = '']) : super(reason);
}

/// Thrown when a problem is encountered during a Certificate validation
class ValidationException extends _Exception {
  ValidationException([String reason = '']) : super(reason);
}

/// Thrown when are encountered problems with remote service
class ServiceException extends _Exception {
  ServiceException([String reason = '']) : super(reason);
}

/// Thrown when are encountered problems interacting with local storage
class CacheException extends _Exception {
  CacheException([String reason = '']) : super(reason);
}
