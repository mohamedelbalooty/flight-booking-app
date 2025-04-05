abstract class AppException implements Exception {
  final String message;
  final int? statusCode;

  const AppException(this.message, {this.statusCode});

  @override
  String toString() => "$runtimeType: $message (Status: $statusCode)";
}

class BadRequestException extends AppException {
  const BadRequestException({String message = 'Bad request'})
    : super(message, statusCode: 400);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException({String message = 'Unauthorized'})
    : super(message, statusCode: 401);
}

class ForbiddenException extends AppException {
  const ForbiddenException({String message = 'Forbidden'})
    : super(message, statusCode: 403);
}

class NotFoundException extends AppException {
  const NotFoundException({String message = 'Not found'})
    : super(message, statusCode: 404);
}

class ConflictException extends AppException {
  const ConflictException({String message = 'Conflict'})
    : super(message, statusCode: 409);
}

class InternalServerErrorException extends AppException {
  const InternalServerErrorException({String message = 'Internal Server Error'})
    : super(message, statusCode: 500);
}

class ServiceUnavailableException extends AppException {
  const ServiceUnavailableException({String message = 'Service Unavailable'})
    : super(message, statusCode: 503);
}

class TimeoutException extends AppException {
  const TimeoutException([super.message = 'Connection Timeout']);
}

class CancelException extends AppException {
  const CancelException([super.message = 'Request Canceled']);
}

class NetworkException extends AppException {
  const NetworkException([super.message = 'No Internet Connection']);
}

class UnknownException extends AppException {
  const UnknownException([super.message = 'Unknown error occurred']);
}

AppException mapStatusCodeToException(int? statusCode, {String? message}) {
  switch (statusCode) {
    case 400:
      return BadRequestException(message: message ?? 'Bad request');
    case 401:
      return UnauthorizedException(message: message ?? 'Unauthorized');
    case 403:
      return ForbiddenException(message: message ?? 'Forbidden');
    case 404:
      return NotFoundException(message: message ?? 'Not found');
    case 409:
      return ConflictException(message: message ?? 'Conflict');
    case 500:
      return InternalServerErrorException(
        message: message ?? 'Internal Server Error',
      );
    case 503:
      return ServiceUnavailableException(
        message: message ?? 'Service Unavailable',
      );
    default:
      return UnknownException(message ?? 'Unknown Error');
  }
}
