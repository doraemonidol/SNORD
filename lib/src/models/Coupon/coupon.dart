import 'package:json_annotation/json_annotation.dart';
import 'package:rehabox/src/models/Model/model.dart';

part 'coupon.g.dart';

enum CouponType { streak, timer }

@JsonSerializable()
class Coupon implements Model {
  Coupon({
    required this.id,
    required this.name,
    required this.type,
    required this.isApplied,
    required Duration duration,
    required double price,
    required this.expiredAt,
    this.description,
  })  : price = price < 0
            ? throw ArgumentError('Price must be greater or equal to 0')
            : price,
        duration = duration <= Duration.zero
            ? throw ArgumentError('Duration must be greater than 0')
            : duration;

  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CouponToJson(this);

  @JsonKey(required: true)
  @override
  final String id;
  @JsonKey(required: true)
  final String name;
  @JsonKey(defaultValue: CouponType.streak)
  final CouponType type;
  @JsonKey(defaultValue: false)
  final bool isApplied;
  @JsonKey(required: true)
  final Duration duration;
  @JsonKey(required: true)
  final double price;
  @JsonKey(required: true)
  final DateTime expiredAt;
  final String? description;

  @override
  String toString() {
    return 'Coupon(id: $id, name: $name, type: $type, isApplied: $isApplied, duration: $duration, price: $price, expiredAt: $expiredAt, description: $description)';
  }

  @override
  Coupon copyWith({
    String? id,
    String? name,
    CouponType? type,
    bool? isApplied,
    Duration? duration,
    double? price,
    DateTime? expiredAt,
    String? description,
  }) =>
      Coupon(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        isApplied: isApplied ?? this.isApplied,
        duration: duration ?? this.duration,
        price: price ?? this.price,
        expiredAt: expiredAt ?? this.expiredAt,
        description: description ?? this.description,
      );
}
