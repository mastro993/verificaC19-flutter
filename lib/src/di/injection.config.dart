// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/local/local_repository.dart' as _i3;
import '../data/local/local_repository_impl.dart' as _i4;
import '../data/remote/remote_repository.dart' as _i7;
import '../data/remote/remote_repository_impl.dart' as _i8;
import '../data/updater.dart' as _i9;
import '../data/updater_impl.dart' as _i10;
import '../logic/certificate_validator.dart' as _i13;
import '../logic/certificate_validator_impl.dart' as _i14;
import '../logic/exemption_validator.dart' as _i16;
import '../logic/recovery_statement_validator.dart' as _i5;
import '../logic/recovery_statement_validator_impl.dart' as _i6;
import '../logic/test_validator.dart' as _i15;
import '../logic/vaccine_validator.dart' as _i11;
import '../logic/vaccine_validator_impl.dart' as _i12;

const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  await gh.singletonAsync<_i3.LocalRepository>(
      () => _i4.LocalRepositoryImpl.create(),
      registerFor: {_prod},
      preResolve: true);
  gh.lazySingleton<_i5.RecoveryStatementValidator>(
      () => _i6.RecoveryStatementValidatorImpl(get<_i3.LocalRepository>()),
      registerFor: {_prod});
  gh.singleton<_i7.RemoteRepository>(_i8.RemoteRepositoryImpl.create(),
      registerFor: {_prod});
  gh.lazySingleton<_i9.Updater>(
      () => _i10.UpdaterImpl(
          get<_i7.RemoteRepository>(), get<_i3.LocalRepository>()),
      registerFor: {_prod});
  gh.lazySingleton<_i11.VaccineValidator>(
      () => _i12.VaccineValidatorImpl(get<_i3.LocalRepository>()),
      registerFor: {_prod});
  gh.lazySingleton<_i13.CertificateValidator>(
      () => _i14.CertificateValidatorImpl(
          get<_i3.LocalRepository>(),
          get<_i11.VaccineValidator>(),
          get<_i5.RecoveryStatementValidator>(),
          get<_i15.TestValidator>(),
          get<_i16.ExemptionValidator>()),
      registerFor: {_prod});
  return get;
}
