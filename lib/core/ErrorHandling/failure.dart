abstract class Failure {}

class ServerFailure implements Failure{} //500

class EmptyCacheFailure implements Failure{}

class OfflineFailure implements Failure{}

class BadRequestFailure implements Failure{}//400

class UnauthorizedFailure implements Failure{} //401

class CategoryNotFoundFailure implements Failure{}//404

class ProductNotFoundFailure implements Failure{}//404