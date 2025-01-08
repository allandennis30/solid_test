import 'package:get/get.dart';
import 'package:solid_project/models/user_model.dart';

class AuthService extends GetxService {
  static UserModel? _loggedUser;
  static UserModel? get loggedUser => _loggedUser;

  Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    if (email == 'test@test.com' && password == 'test123') {
      _loggedUser = UserModel(
        email: 'test@test.com',
        password: 'test123',
        name: 'John Doe',
      );

      return _loggedUser;
    } else {
      throw Exception('Invalid email or password.');
    }
  }
}
