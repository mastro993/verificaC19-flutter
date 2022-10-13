import 'package:isar/isar.dart';

part 'revoked_cert.g.dart';

@Collection()
class RevokedCert {
  Id id = Isar.autoIncrement;
  @Index()
  late String cert;
}
