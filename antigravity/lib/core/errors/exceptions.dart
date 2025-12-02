/// Base exception class for the application
class AppException implements Exception {
  final String? message;
  const AppException({this.message});

  @override
  String toString() => message ?? 'An error occurred';
}

/// Server-related exceptions
class ServerException extends AppException {
  const ServerException({super.message});
}

/// Network-related exceptions
class NetworkException extends AppException {
  const NetworkException({super.message});
}

/// Cache-related exceptions
class CacheException extends AppException {
  const CacheException({super.message});
}

// Authentication-specific exceptions
class EmailAlreadyInUseException extends AppException {
  const EmailAlreadyInUseException({super.message});
}

class InvalidCredentialsException extends AppException {
  const InvalidCredentialsException({super.message});
}

class WeakPasswordException extends AppException {
  const WeakPasswordException({super.message});
}

class UserNotFoundException extends AppException {
  const UserNotFoundException({super.message});
}

class UserDisabledException extends AppException {
  const UserDisabledException({super.message});
}

class CancelledException extends AppException {
  const CancelledException({super.message});
}

class TooManyRequestsException extends AppException {
  const TooManyRequestsException({super.message});
}

class OperationNotAllowedException extends AppException {
  const OperationNotAllowedException({super.message});
}
