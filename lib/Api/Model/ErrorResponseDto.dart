class ErrorResponseDto {
  final String message;

  ErrorResponseDto({required this.message});

  factory ErrorResponseDto.fromJson(Map<String, dynamic> json) {
    return ErrorResponseDto(
      message: json['message'],
    );
  }
}