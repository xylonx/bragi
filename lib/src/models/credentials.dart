import 'package:hive/hive.dart';

part 'credentials.g.dart';

@HiveType(typeId: 1)
class HiveCredentials {
  @HiveField(0)
  late String endpoint;

  @HiveField(1)
  late String token;

  HiveCredentials();
}

class CredentialRepository {
  static storeCredential() {}
}
