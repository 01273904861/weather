class ServerException{
 final ErrorModel errorModel;
 ServerException({required this.errorModel});
}

class ErrorModel {
  final String message;
  final int code;

  ErrorModel({required this.message, required this.code});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
        message: json['error']['message'], 
        code: json['error']['code'],
        );
  }
}
