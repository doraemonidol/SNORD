import 'package:rehabox/src/models/TimerActivity/timer_activity.dart';
import 'package:test/test.dart';

void main() {
  group('TimerActivity', () {
    test('should create TimerActivity instance from JSON', () {
      final json = {
        'id': '1',
        'userId': 'user1',
        'startAt': DateTime.now().toIso8601String(),
        'expectedDuration': const Duration(minutes: 10).inMicroseconds,
        'actualDuration': const Duration(minutes: 5).inMicroseconds,
      };

      final timerActivity = TimerActivity.fromJson(json);

      expect(timerActivity, isA<TimerActivity>());
      expect(timerActivity.id, '1');
      expect(timerActivity.userId, 'user1');
      expect(timerActivity.startAt, isA<DateTime>());
      expect(timerActivity.expectedDuration, const Duration(minutes: 10));
      expect(timerActivity.actualDuration, const Duration(minutes: 5));
    });

    test('should convert TimerActivity instance to JSON', () {
      final timerActivity = TimerActivity(
        id: '1',
        userId: 'user1',
        startAt: DateTime.now(),
        expectedDuration: const Duration(minutes: 10),
        actualDuration: const Duration(minutes: 5),
      );

      final json = timerActivity.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['id'], '1');
      expect(json['userId'], 'user1');
      expect(json['startAt'], isA<String>());
      expect(json['expectedDuration'], const Duration(minutes: 10).inMicroseconds);
      expect(json['actualDuration'], const Duration(minutes: 5).inMicroseconds);
    });

    test('should throw ArgumentError if expectedDuration is zero', () {
      expect(
        () => TimerActivity(
          id: '1',
          userId: 'user1',
          startAt: DateTime.now(),
          expectedDuration: Duration.zero,
          actualDuration: const Duration(minutes: 5),
        ),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('should throw ArgumentError if actualDuration is greater than expectedDuration', () {
      expect(
        () => TimerActivity(
          id: '1',
          userId: 'user1',
          startAt: DateTime.now(),
          expectedDuration: const Duration(minutes: 5),
          actualDuration: const Duration(minutes: 10),
        ),
        throwsA(isA<ArgumentError>()),
      );
    });

        test('should allow actualDuration to be null', () {
      final timerActivity = TimerActivity(
        id: '1',
        userId: 'user1',
        startAt: DateTime.now(),
        expectedDuration: const Duration(minutes: 10),
        actualDuration: null,
      );

      expect(timerActivity.actualDuration, isNull);
    });

    test('should throw ArgumentError if expectedDuration is zero and actualDuration is null', () {
      expect(
        () => TimerActivity(
          id: '1',
          userId: 'user1',
          startAt: DateTime.now(),
          expectedDuration: Duration.zero,
          actualDuration: null,
        ),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('should not throw ArgumentError if expectedDuration is greater than zero and actualDuration is null', () {
      expect(
        () => TimerActivity(
          id: '1',
          userId: 'user1',
          startAt: DateTime.now(),
          expectedDuration: const Duration(minutes: 10),
          actualDuration: null,
        ),
        returnsNormally,
      );
    });
  });
}