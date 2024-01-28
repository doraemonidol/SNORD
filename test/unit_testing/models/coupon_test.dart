import 'package:rehabox/src/models/Coupon/coupon.dart';
import 'package:test/test.dart';

void main() {
  group('Coupon', () {
    test('should create Coupon instance from JSON', () {
      final json = {
        'id': '1',
        'name': 'Test Coupon',
        'type': 'streak',
        'isApplied': true,
        'duration': const Duration(days: 10).inMicroseconds,
        'price': 100,
        'expiredAt': '2022-12-31',
        'description': 'Test Description',
      };

      final coupon = Coupon.fromJson(json);

      expect(coupon, isA<Coupon>());
      expect(coupon.id, '1');
      expect(coupon.name, 'Test Coupon');
      expect(coupon.type, CouponType.streak);
      expect(coupon.isApplied, true);
      expect(coupon.duration, const Duration(days: 10));
      expect(coupon.price, 100);
      expect(coupon.expiredAt, DateTime(2022, 12, 31));
      expect(coupon.description, 'Test Description');
    });

    test('should convert Coupon instance to JSON', () {
      final coupon = Coupon(
        id: '1',
        name: 'Test Coupon',
        type: CouponType.streak,
        isApplied: true,
        duration: const Duration(days: 10),
        price: 100,
        expiredAt: DateTime.parse('2022-12-31'),
        description: 'Test Description',
      );

      final json = coupon.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['id'], '1');
      expect(json['name'], 'Test Coupon');
      expect(json['type'], 'streak');
      expect(json['isApplied'], true);
      expect(json['duration'], const Duration(days: 10).inMicroseconds);
      expect(json['price'], 100);
      expect(json['expiredAt'], DateTime(2022, 12, 31).toIso8601String());
      expect(json['description'], 'Test Description');
    });

    test('should throw FormatException if expiredAt is not a valid date', () {
      final json = {
        'id': '1',
        'name': 'Test Coupon',
        'type': 'streak',
        'isApplied': true,
        'duration': 10,
        'price': 100,
        'expiredAt': 'invalid-date',
        'description': 'Test Description',
      };

      expect(() => Coupon.fromJson(json), throwsA(isA<FormatException>()));
    });

    test('should throw ArgumentError if price is negative', () {
      expect(
        () => Coupon(
          id: '1',
          name: 'Test Coupon',
          type: CouponType.streak,
          isApplied: true,
          duration: const Duration(days: 10),
          price: -100,
          expiredAt: DateTime.parse('2022-12-31'),
          description: 'Test Description',
        ),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('should throw ArgumentError if duration is zero', () {
      expect(
        () => Coupon(
          id: '1',
          name: 'Test Coupon',
          type: CouponType.streak,
          isApplied: true,
          duration: const Duration(days: 0),
          price: 100,
          expiredAt: DateTime.parse('2022-12-31'),
          description: 'Test Description',
        ),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
