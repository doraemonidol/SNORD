// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coupon _$CouponFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'name', 'duration', 'price', 'expiredAt'],
  );
  return Coupon(
    id: json['id'] as String,
    name: json['name'] as String,
    type: $enumDecodeNullable(_$CouponTypeEnumMap, json['type']) ??
        CouponType.streak,
    isApplied: json['isApplied'] as bool? ?? false,
    duration: Duration(microseconds: json['duration'] as int),
    price: (json['price'] as num).toDouble(),
    expiredAt: DateTime.parse(json['expiredAt'] as String),
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$CouponToJson(Coupon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$CouponTypeEnumMap[instance.type]!,
      'isApplied': instance.isApplied,
      'duration': instance.duration.inMicroseconds,
      'price': instance.price,
      'expiredAt': instance.expiredAt.toIso8601String(),
      'description': instance.description,
    };

const _$CouponTypeEnumMap = {
  CouponType.streak: 'streak',
  CouponType.timer: 'timer',
};
