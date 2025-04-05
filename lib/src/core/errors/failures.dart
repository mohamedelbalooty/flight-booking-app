import 'exceptions.dart';

enum FailureType {
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  serverError,
  network,
  timeout,
  cancel,
  unknown,
}

class Failure {
  final String message;
  final FailureType type;

  Failure({required this.message, this.type = FailureType.unknown});

  @override
  String toString() => 'Failure($type): $message';
}

Failure mapExceptionToFailure(AppException exception) {
  switch (exception) {
    case BadRequestException():
      return Failure(message: exception.message, type: FailureType.badRequest);
    case UnauthorizedException():
      return Failure(
        message: exception.message,
        type: FailureType.unauthorized,
      );
    case ForbiddenException():
      return Failure(message: exception.message, type: FailureType.forbidden);
    case NotFoundException():
      return Failure(message: exception.message, type: FailureType.notFound);
    case InternalServerErrorException():
      return Failure(message: exception.message, type: FailureType.serverError);
    case NetworkException():
      return Failure(message: exception.message, type: FailureType.network);
    case TimeoutException():
      return Failure(message: exception.message, type: FailureType.timeout);
    case CancelException():
      return Failure(message: exception.message, type: FailureType.cancel);
    default:
      return Failure(message: exception.message);
  }
}
