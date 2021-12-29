library verificac19;

import 'package:verificac19/src/verificac19.dart';
import 'package:verificac19/src/verificac19_impl.dart';

export 'src/core/exception.dart';
export 'src/model/certificate.dart';
export 'src/model/certificate_status.dart';
export 'src/model/dcc.dart';
export 'src/model/person.dart';
export 'src/model/recovery_statement.dart';
export 'src/model/test.dart';
export 'src/model/vaccination.dart';
export 'src/model/validation_result.dart';
export 'src/verificac19.dart';

// ignore: non_constant_identifier_names
VerificaC19Interface VerificaC19 = VerificaC19Impl();
