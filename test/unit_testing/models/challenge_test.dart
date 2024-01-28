import 'package:rehabox/src/models/Challenge/challenge.dart';
import 'package:test/test.dart';

void main() {
  group('Challenge', () {
    test('should create Challenge instance from JSON', () {
      final json = {
        'id': '1',
        'name': 'Test Challenge',
        'startDate': '2022-01-01',
        'duration': const Duration(seconds: 10).inMicroseconds,
        'points': 100,
        'description': 'Test Description',
      };

      final challenge = Challenge.fromJson(json);

      expect(challenge, isA<Challenge>());
      expect(challenge.id, '1');
      expect(challenge.name, 'Test Challenge');
      expect(challenge.startDate, '2022-01-01');
      expect(challenge.duration, const Duration(seconds: 10));
      expect(challenge.points, 100);
      expect(challenge.description, 'Test Description');
    });

    test('should convert Challenge instance to JSON', () {
      final challenge = Challenge(
        id: '1',
        name: 'Test Challenge',
        startDate: '2022-01-01',
        duration: const Duration(seconds: 10),
        points: 100,
        description: 'Test Description',
      );

      final json = challenge.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['id'], '1');
      expect(json['name'], 'Test Challenge');
      expect(json['startDate'], '2022-01-01');
      expect(json['duration'], const Duration(seconds: 10).inMicroseconds);
      expect(json['points'], 100);
      expect(json['description'], 'Test Description');
    });

    test('should throw ArgumentError if duration is zero', () {
      expect(
        () => Challenge(
          id: '1',
          name: 'Test Challenge',
          startDate: '2022-01-01',
          duration: Duration.zero,
          points: 100,
          description: 'Test Description',
        ),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('should throw ArgumentError if points is negative', () {
      expect(
        () => Challenge(
          id: '1',
          name: 'Test Challenge',
          startDate: '2022-01-01',
          duration: const Duration(seconds: 10),
          points: -1,
          description: 'Test Description',
        ),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}