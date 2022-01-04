import 'package:freezed_annotation/freezed_annotation.dart';

part 'certificate_info.freezed.dart';

@freezed
class CertificateInfo with _$CertificateInfo {
  const CertificateInfo._();

  const factory CertificateInfo({
    required String country,
    required bool extendedKeyUsage,
  }) = _CertificateInfo;

  factory CertificateInfo.empty() => const CertificateInfo(
        country: '',
        extendedKeyUsage: false,
      );
}
