class ServerException implements Exception
{
  final String message;

  ServerException(this.message);
}//500

class EmptyCacheException implements Exception{
  final String message;

  EmptyCacheException(this.message);
}

class OfflineException implements Exception{
  final String message;

  OfflineException(this.message);
}

class BadRequestException implements Exception{
  final String message;

  BadRequestException(this.message);
}//400

class UnauthorizedException implements Exception{
  final String message;

  UnauthorizedException(this.message);
}//401
