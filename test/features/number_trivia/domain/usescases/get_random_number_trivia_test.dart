import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia_app/core/usecases/usecase.dart';
import 'package:number_trivia_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia_app/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:number_trivia_app/features/number_trivia/domain/usecases/get_random_number_trivia.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetRandomNumberTrivia usecase;
  NumberTriviaRepository repository;

  setUp(() {
    repository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(repository);
  });

  final tNumberTrivia = NumberTrivia(number: 1, text: 'number trivia');

  test('Should get random number trivia', () async {
    when(repository.getRandomNumberTrivia())
        .thenAnswer((realInvocation) async => Right(tNumberTrivia));

    var result = await usecase(NoParams());
    expect(result, Right(tNumberTrivia));

    verify(repository.getRandomNumberTrivia());
    verifyNoMoreInteractions(repository);
  });
}
