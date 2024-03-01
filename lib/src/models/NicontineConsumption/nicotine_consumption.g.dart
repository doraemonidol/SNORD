part of 'nicotine_consumption.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NicotineConsumption _$NicotineConsumptionFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['metric', 'value'],
  );
  return NicotineConsumption(
    metric: json['metric'] as String,
    value: (json['value'] as num).toDouble(),
  );
}

Map<String, dynamic> _$NicotineConsumptionToJson(NicotineConsumption instance) =>
    <String, dynamic>{
      'metric': instance.metric,
      'value': instance.value,
    };