class ApiConstants {
  static const String baseUrl = 'http://api.weatherapi.com';
  static const String forecast = '/v1/forecast.json?';
  static const String apiKey = '468ef9d014024a4fa0b224007240610';
  
}
//http://api.weatherapi.com/v1/forecast.json?
//key=468ef9d014024a4fa0b224007240610&q=cairo&days=7&lang=ar

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}


