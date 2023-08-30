import 'package:test/test.dart';
import 'package:testingsample1/counter.dart';

void main() {
  // a single test

  // test('Counter should be incremented by 1', () {
  //   final counter = Counter();

  //   counter.increment();

  //   expect(counter.value, 1);
  // });

  // group of tests

  group('Counter', () {
    test('starting value should be 0', () {
      expect(Counter().value, 0);
    });

    test('value should be incremented by 1', () {
      var counter = Counter();
      counter.increment();
      expect(counter.value, 1);
    });

    test('value should be decremented by 1', () {
      var counter = Counter();
      counter.decrement();
      expect(counter.value, -1);
    });
  });
}
