import 'package:local_auth/local_auth.dart';

class AuthService {
  static final _localAuth = LocalAuthentication();

  static Future<bool> canAuth() async {
    return await _localAuth.canCheckBiometrics ||
        await _localAuth.isDeviceSupported();
  }

  static Future<bool> authenticate() async {
    try {
      if (!await canAuth()) return false;
      return _localAuth.authenticate(
          options: AuthenticationOptions(
              biometricOnly: true, stickyAuth: true, useErrorDialogs: true),
          localizedReason: 'Login');
    } catch (e) {
      return false;
    }
  }
}
