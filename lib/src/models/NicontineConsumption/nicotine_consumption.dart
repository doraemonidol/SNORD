
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nicotine_consumption.g.dart';

@immutable
@JsonSerializable()
class NicotineConsumption {
  const NicotineConsumption({
    required this.metric,
    required this.value,
  });
  final String metric;
  final double value;

  factory NicotineConsumption.fromJson(Map<String, dynamic> json) =>
      _$NicotineConsumptionFromJson(json);

  Map<String, dynamic> toJson() => _$NicotineConsumptionToJson(this);
}
