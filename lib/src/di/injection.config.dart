// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/local/local_repository.dart' as _i5;
import '../data/local/local_repository_impl.dart' as _i6;
import '../data/remote/remote_repository.dart' as _i9;
import '../data/remote/remote_repository_impl.dart' as _i10;
import '../data/updater.dart' as _i13;
import '../data/updater_impl.dart' as _i14;
import '../logic/certificate_validator.dart' as _i17;
import '../logic/certificate_validator_impl.dart' as _i18;
import '../logic/exemption_validator.dart' as _i3;
import '../logic/exemption_validator_impl.dart' as _i4;
import '../logic/recovery_statement_validator.dart' as _i7;
import '../logic/recovery_statement_validator_impl.dart' as _i8;
import '../logic/test_validator.dart' as _i11;
import '../logic/test_validator_impl.dart' as _i12;
import '../logic/vaccine_validator.dart' as _i15;
import '../logic/vaccine_validator_impl.dart' as _i16;

const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.ExemptionValidator>(
    () => _i4.ExemptionValidatorImpl(),
    registerFor: {_prod},
  );
  await gh.singletonAsync<_i5.LocalRepository>(
    () => _i6.LocalRepositoryImpl.create(),
    registerFor: {_prod},
    preResolve: true,
  );
  gh.factory<_i7.RecoveryStatementValidator>(
    () => _i8.RecoveryStatementValidatorImpl(get<_i5.LocalRepository>()),
    registerFor: {_prod},
  );
  gh.singleton<_i9.RemoteRepository>(
    _i10.RemoteRepositoryImpl.create(),
    registerFor: {_prod},
  );
  gh.factory<_i11.TestValidator>(
    () => _i12.TestValidatorImpl(get<_i5.LocalRepository>()),
    registerFor: {_prod},
  );
  gh.lazySingleton<_i13.Updater>(
    () => _i14.UpdaterImpl(
      get<_i9.RemoteRepository>(),
      get<_i5.LocalRepository>(),
    ),
    registerFor: {_prod},
  );
  gh.factory<_i15.VaccineValidator>(
    () => _i16.VaccineValidatorImpl(get<_i5.LocalRepository>()),
    registerFor: {_prod},
  );
  gh.lazySingleton<_i17.CertificateValidator>(
    () => _i18.CertificateValidatorImpl(
      get<_i5.LocalRepository>(),
      get<_i15.VaccineValidator>(),
      get<_i7.RecoveryStatementValidator>(),
      get<_i11.TestValidator>(),
      get<_i3.ExemptionValidator>(),
    ),
    registerFor: {_prod},
  );
  return get;
}
