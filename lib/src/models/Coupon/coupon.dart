import 'package:json_annotation/json_annotation.dart';

part 'coupon.g.dart';

enum CouponType { streak, timer }

@JsonSerializable()
class Coupon {
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

  Map<String, dynamic> toJson() => _$CouponToJson(this);

  @JsonKey(required: true)
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
}
