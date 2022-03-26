import 'package:isar/isar.dart';

part 'revoked_cert.g.dart';

@Collection()
class RevokedCert {
  int id = Isar.autoIncrement;
  @Index()
  late String cert;
}
