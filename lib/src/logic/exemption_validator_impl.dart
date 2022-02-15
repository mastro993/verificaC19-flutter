import 'dart:developer';

import 'package:clock/clock.dart';
import 'package:injectable/injectable.dart';
import 'package:verificac19/src/core/extensions.dart';
import 'package:verificac19/src/logic/exemption_validator.dart';
import 'package:verificac19/src/model/exemption.dart';
import 'package:verificac19/src/model/green_certificate_status.dart';
import 'package:verificac19/src/model/validation_mode.dart';

@Environment(Environment.prod)
@Injectable(as: ExemptionValidator)
class ExemptionValidatorImpl implements ExemptionValidator {
  @override
  Future<GreenCertificateStatus> validate(
    Exemption exemption, {
    ValidationMode mode = ValidationMode.normalDGP,
  }) async {
    if (mode == ValidationMode.entryITDGP) {
      log('Exemption is not valid for Italy entry mode');
      return GreenCertificateStatus.notValid;
    }

    try {
      final exemptionFromDay = exemption.certificateValidFrom.withoutTime();
      final exemptionUntilDay = exemption.certificateValidUntil?.withoutTime();

      if (exemptionFromDay > clock.now()) {
        return GreenCertificateStatus.notValidYet;
      }

      if (exemptionUntilDay != null && exemptionUntilDay < clock.now()) {
        return GreenCertificateStatus.notValid;
      }

      if (mode == ValidationMode.boosterDGP) {
        return GreenCertificateStatus.testNeeded;
      }

      return GreenCertificateStatus.valid;
    } catch (e) {
      return GreenCertificateStatus.notEuDCC;
    }
  }
}
