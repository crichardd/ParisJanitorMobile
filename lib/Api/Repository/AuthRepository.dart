import 'package:dio/dio.dart';
import 'package:paris_janitor/Api/Commons/ApiConstants.dart';
import 'package:paris_janitor/Api/Model/ErrorResponseDto.dart';
import 'package:paris_janitor/Api/Model/SignUpDto.dart';
import 'package:paris_janitor/Api/Model/UserDto.dart';

class AuthRepository {
  final Dio _dio = Dio();

  Future<dynamic> loginUser(String email, String password) async {
    try {
      final response = await _dio.post(
        ApiConstants.loginUrl,
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return UserDto.fromJson(response.data);
      } else {
        return ErrorResponseDto(
            message: 'Erreur ${response.statusCode}: ${response.data}');
      }
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 404) {
        return ErrorResponseDto.fromJson(e.response!.data);
      } else {
        return ErrorResponseDto(
            message: 'Erreur réseau ou autre : ${e.message}');
      }
    }
  }

  Future<dynamic> findUserByMail(String email) async {
    try {
      final response = await _dio.get('${ApiConstants.usersByMailUrl}$email');
      if (response.statusCode == 200) {
        return UserDto.fromJson(response.data);
      } else {
        return ErrorResponseDto.fromJson(response.data);
      }
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 404) {
        return ErrorResponseDto.fromJson(e.response!.data);
      } else {
        return ErrorResponseDto(
            message: 'Erreur réseau ou autre : ${e.message}');
      }
    }
  }

  Future<dynamic> signUpUser(SignUpDto user) async {
    try {
      final response = await _dio.post(
        ApiConstants.signUpUrl,
        data: user.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 201) {
        return UserDto.fromJson(response.data);
      } else {
        return ErrorResponseDto.fromJson(response.data);
      }
    } on DioException catch (e) {
      if (e.response != null ) {
        if (e.response!.statusCode == 409) {
          return ErrorResponseDto(message: "Email already in use");
        } else if (e.response!.statusCode == 404) {
          return ErrorResponseDto.fromJson(e.response!.data);
        }
      } else {
        return ErrorResponseDto(
            message: 'Erreur réseau ou autre : ${e.message}');
      }
    }
  }
}
