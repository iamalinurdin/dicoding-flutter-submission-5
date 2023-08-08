class UploadResponse {
  final bool error;
  final String message;

  UploadResponse({
    required this.error,
    required this.message
  });

  factory UploadResponse.fromJson(Map<String, dynamic> json) => UploadResponse(
    error: json['error'], 
    message: json['message']
  );
}