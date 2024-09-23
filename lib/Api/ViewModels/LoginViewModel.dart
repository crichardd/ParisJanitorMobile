import 'package:paris_janitor/Api/Model/ErrorResponseDto.dart';
import 'package:paris_janitor/Api/Model/SignUpDto.dart';
import 'package:paris_janitor/Api/Model/UserDto.dart';
import 'package:paris_janitor/Api/Repository/AuthRepository.dart';

class LoginViewModel {
  static final LoginViewModel _instance = LoginViewModel._internal();

  LoginViewModel._internal();

  factory LoginViewModel() {
    return _instance;
  }

  final AuthRepository _authRepository = AuthRepository();

  UserDto? user;
  ErrorResponseDto? error;

  Future<bool> login(String email, String password) async {
    var result = await _authRepository.loginUser(email, password);
    if (result is UserDto) {
      user = result;
      error = null;
      return true;
    } else if (result is ErrorResponseDto) {
      error = result;
      user = null;
      return false;
    }
    return false;
  }

  Future<bool> findUserByMail(String email) async {
    var result = await _authRepository.findUserByMail(email);
    if (result is UserDto) {
      user = result;
      error = null;
      return true;
    } else if (result is ErrorResponseDto) {
      error = result;
      user = null;
      return false;
    }
    return false;
  }

  Future<bool> signUpUser(SignUpDto signUpUser) async {
    var result = await _authRepository.signUpUser(signUpUser);
    if (result is UserDto) {
      user = result;
      error = null;
      return true;
    } else if (result is ErrorResponseDto) {
      error = result;
      user = null;
      return false;
    }
    return false;
  }

  bool isUserInitialized() {
    return user != null;
  }

  bool hasError() {
    return error != null;
  }
}
