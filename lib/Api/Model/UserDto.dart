class UserDto {
  final String id;
  final String email;
  final String lastName;
  final String firstName;
  final String birthday;
  final String phoneNumber;
  final String region;
  final String adresse1;
  final String adresse2;
  final String token;
  final DateTime tokenDate;
  final bool activated;
  final String verificationCode;
  final String passwordVerification;

  UserDto({
    required this.id,
    required this.email,
    required this.lastName,
    required this.firstName,
    required this.birthday,
    required this.phoneNumber,
    required this.region,
    required this.adresse1,
    required this.adresse2,
    required this.token,
    required this.tokenDate,
    required this.activated,
    required this.verificationCode,
    required this.passwordVerification,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
      email: json['email'],
      lastName: json['lastName'],
      firstName: json['firstName'],
      birthday: json['birthday'],
      phoneNumber: json['phoneNumber'] ?? '',
      region: json['region'] ?? '',
      adresse1: json['adresse1'] ?? '',
      adresse2: json['adresse2'] ?? '',
      token: json['token'],
      tokenDate: DateTime(json['tokenDate'][0], json['tokenDate'][1], json['tokenDate'][2]),
      activated: json['activated'],
      verificationCode: json['verificationCode'],
      passwordVerification: json['passwordVerification'],
    );
  }
}