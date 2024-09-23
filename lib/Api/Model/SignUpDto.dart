class SignUpDto {
  final String email;
  final String password;
  final String lastName;
  final String firstName;
  final String birthday;

  SignUpDto({
    required this.email,
    required this.password,
    required this.lastName,
    required this.firstName,
    required this.birthday,
  });

  factory SignUpDto.fromJson(Map<String, dynamic> json) {
    return SignUpDto(
      email: json['email'],
      password: json['password'],
      lastName: json['lastName'],
      firstName: json['firstName'],
      birthday: json['birthday'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'lastName': lastName,
      'firstName': firstName,
      'birthday': birthday,
    };
  }
}
