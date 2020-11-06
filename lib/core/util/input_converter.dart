import 'package:dartz/dartz.dart';
import 'package:number_trivia_app/core/error/failures.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String str) {
    try {
      final intNumber = int.parse(str);
      if (intNumber < 0) throw FormatException();
      return Right(intNumber);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure {}
