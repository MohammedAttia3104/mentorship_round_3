import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'ACCESS_TOKEN', obfuscate: true)
  static final String accessToken = _Env.accessToken;
}
