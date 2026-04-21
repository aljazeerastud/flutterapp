class ApiError {
  final String message;
  final String? field;

  ApiError({required this.message, this.field});

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      message: json['message'] as String,
      field: json['field'] as String?,
    );
  }
}