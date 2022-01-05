// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i4;
import 'package:hive_flutter/hive_flutter.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;

import '../data/local/local_repository.dart' as _i5;
import '../data/local/local_repository_impl.dart' as _i6;
import '../data/remote/remote_repository.dart' as _i8;
import '../data/remote/remote_repository_impl.dart' as _i9;
import '../data/updater.dart' as _i10;
import '../data/updater_impl.dart' as _i11;
import '../logic/certificate_validator.dart' as _i12;
import '../logic/certificate_validator_impl.dart' as _i13;
import 'module.dart' as _i14;

const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectionModule = _$InjectionModule();
  gh.singleton<_i3.Dio>(injectionModule.dio);
  await gh.singletonAsync<_i4.HiveInterface>(() => injectionModule.hive,
      preResolve: true);
  gh.lazySingleton<_i5.LocalRepository>(
      () => _i6.LocalRepositoryImpl(get<_i7.HiveInterface>()),
      registerFor: {_prod});
  gh.lazySingleton<_i8.RemoteRepository>(
      () => _i9.RemoteRepositoryImpl(dio: get<_i3.Dio>()),
      registerFor: {_prod});
  gh.lazySingleton<_i10.Updater>(
      () => _i11.UpdaterImpl(
          get<_i8.RemoteRepository>(), get<_i5.LocalRepository>()),
      registerFor: {_prod});
  gh.lazySingleton<_i12.CertificateValidator>(
      () => _i13.CertificateValidatorImpl(get<_i5.LocalRepository>()),
      registerFor: {_prod});
  return get;
}

class _$InjectionModule extends _i14.InjectionModule {}
