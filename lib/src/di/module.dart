import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:verificac19/src/core/constants.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';

@module
abstract class InjectionModule {
  @preResolve
  @singleton
  Future<HiveInterface> get hive async {
    await Hive.initFlutter();
    Hive.registerAdapter(ValidationRuleAdapter());

    await Hive.openBox<dynamic>(DbKeys.dbData);
    await Hive.openBox<String>(DbKeys.dbRevokeList);
    await Hive.openBox<DateTime>(DbKeys.dbUpdates);
    return Hive;
  }

  @singleton
  Dio get dio => Dio();
}
