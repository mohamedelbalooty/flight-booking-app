import 'package:dio/dio.dart';

import 'exceptions.dart';

AppException handleDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.badCertificate:
      return BadRequestException();
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return TimeoutException();
    case DioExceptionType.connectionError:
      return NetworkException();
    case DioExceptionType.badResponse:
      return mapStatusCodeToException(
        e.response?.statusCode,
        message: e.message,
      );
    case DioExceptionType.cancel:
      return CancelException();
    case DioExceptionType.unknown:
      return UnknownException(e.message ?? 'Unknown Error');
  }
}
