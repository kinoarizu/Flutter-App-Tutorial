import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_app/model/warrior.dart';

class MockWarrior extends Mock implements Warrior {}

void main() {
  MockWarrior warrior = MockWarrior();

  test("Verify Demo", () {
    warrior.rest();
    warrior.training();
    verifyInOrder([warrior.rest(), warrior.training()]);
  });

  test("Null Demo", () {
    expect(warrior.name, isNull);
  });

  test("thenReturn Demo", () {
    when(warrior.name).thenReturn("no name");
    expect(warrior.name, equals("no name"));
  });

  test("thenAnswer Demo", () async {
    when(warrior.training()).thenAnswer((_) => Future.value(true));
    bool result = await warrior.training();
    expect(result, equals(true));
  });
}