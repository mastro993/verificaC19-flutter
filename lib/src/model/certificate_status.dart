enum CertificateStatus {
  /// Certificate is not a valid EU DCC
  notEuDCC,

  /// Certicate is expired or revoked
  notValid,

  /// Certificate is not yet valid
  notValidYet,

  /// Certifica is valid and active
  valid,
}
