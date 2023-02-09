// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:verificac19/src/data/local/local_repository.dart' as _i5;
import 'package:verificac19/src/data/local/local_repository_impl.dart' as _i6;
import 'package:verificac19/src/data/remote/remote_repository.dart' as _i9;
import 'package:verificac19/src/data/remote/remote_repository_impl.dart'
    as _i10;
import 'package:verificac19/src/data/updater.dart' as _i13;
import 'package:verificac19/src/data/updater_impl.dart' as _i14;
import 'package:verificac19/src/logic/certificate_validator.dart' as _i17;
import 'package:verificac19/src/logic/certificate_validator_impl.dart' as _i18;
import 'package:verificac19/src/logic/exemption_validator.dart' as _i3;
import 'package:verificac19/src/logic/exemption_validator_impl.dart' as _i4;
import 'package:verificac19/src/logic/recovery_statement_validator.dart' as _i7;
import 'package:verificac19/src/logic/recovery_statement_validator_impl.dart'
    as _i8;
import 'package:verificac19/src/logic/test_validator.dart' as _i11;
import 'package:verificac19/src/logic/test_validator_impl.dart' as _i12;
import 'package:verificac19/src/logic/vaccine_validator.dart' as _i15;
import 'package:verificac19/src/logic/vaccine_validator_impl.dart' as _i16;

const String _prod = 'prod';

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
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
      () => _i8.RecoveryStatementValidatorImpl(gh<_i5.LocalRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i9.RemoteRepository>(
      _i10.RemoteRepositoryImpl.create(),
      registerFor: {_prod},
    );
    gh.factory<_i11.TestValidator>(
      () => _i12.TestValidatorImpl(gh<_i5.LocalRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i13.Updater>(
      () => _i14.UpdaterImpl(
        gh<_i9.RemoteRepository>(),
        gh<_i5.LocalRepository>(),
      ),
      registerFor: {_prod},
    );
    gh.factory<_i15.VaccineValidator>(
      () => _i16.VaccineValidatorImpl(gh<_i5.LocalRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i17.CertificateValidator>(
      () => _i18.CertificateValidatorImpl(
        gh<_i5.LocalRepository>(),
        gh<_i15.VaccineValidator>(),
        gh<_i7.RecoveryStatementValidator>(),
        gh<_i11.TestValidator>(),
        gh<_i3.ExemptionValidator>(),
      ),
      registerFor: {_prod},
    );
    return this;
  }
}
