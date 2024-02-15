import 'dart:convert';
import 'package:rehabox/src/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

const modelKeys = {
  "Challenge": 'challenges',
  "Coupon": 'coupons',
  "TimerActivity": 'timer_activities',
};

/// A mock data sources for development purposes
/// [SharedPreferences] is used as a database
///
/// Please note that every model must implement [Model] interface
/// in order to be stored in the local data source
class LocalDataSource {
  LocalDataSource(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  Future<Challenge> createChallenge(Challenge challenge) => _create<Challenge>(
        modelKeys["Challenge"] as String,
        (json) => Challenge.fromJson(json),
        challenge,
      );

  Future<Coupon> createCoupon(Coupon coupon) => _create<Coupon>(
        modelKeys["Coupon"] as String,
        (json) => Coupon.fromJson(json),
        coupon,
      );

  Future<TimerActivity> createTimerActivity(TimerActivity timerActivity) =>
      _create<TimerActivity>(
        modelKeys["TimerActivity"] as String,
        (json) => TimerActivity.fromJson(json),
        timerActivity,
      );

  Future<Challenge> deleteChallenge(String id) => _delete<Challenge>(
        modelKeys["Challenge"] as String,
        (json) => Challenge.fromJson(json),
        id,
      );

  Future<Coupon> deleteCoupon(String id) => _delete<Coupon>(
        modelKeys["Coupon"] as String,
        (json) => Coupon.fromJson(json),
        id,
      );

  Future<TimerActivity> deleteTimerActivity(String id) =>
      _delete<TimerActivity>(
        modelKeys["TimerActivity"] as String,
        (json) => TimerActivity.fromJson(json),
        id,
      );

  Future<Challenge?> readChallenge(String id) => _read<Challenge>(
        modelKeys["Challenge"] as String,
        (json) => Challenge.fromJson(json),
        id,
      );

  Future<Coupon?> readCoupon(String id) => _read<Coupon>(
        modelKeys["Coupon"] as String,
        (json) => Coupon.fromJson(json),
        id,
      );

  Future<TimerActivity?> readTimerActivity(String id) => _read<TimerActivity>(
        modelKeys["TimerActivity"] as String,
        (json) => TimerActivity.fromJson(json),
        id,
      );

  Future<Challenge> updateChallenge(Challenge challenge) => _update<Challenge>(
        modelKeys["Challenge"] as String,
        (json) => Challenge.fromJson(json),
        challenge,
      );

  Future<Coupon> updateCoupon(Coupon coupon) => _update<Coupon>(
        modelKeys["Coupon"] as String,
        (json) => Coupon.fromJson(json),
        coupon,
      );

  Future<TimerActivity> updateTimerActivity(TimerActivity timerActivity) =>
      _update<TimerActivity>(
        modelKeys["TimerActivity"] as String,
        (json) => TimerActivity.fromJson(json),
        timerActivity,
      );

  Future<List<Challenge>> readAllChallenges() => _readAll<Challenge>(
        modelKeys["Challenge"] as String,
        (json) => Challenge.fromJson(json),
      );

  Future<List<Coupon>> readAllCoupons() => _readAll<Coupon>(
        modelKeys["Coupon"] as String,
        (json) => Coupon.fromJson(json),
      );

  Future<List<TimerActivity>> readAllTimerActivities() =>
      _readAll<TimerActivity>(
        modelKeys["TimerActivity"] as String,
        (json) => TimerActivity.fromJson(json),
      );

  Future<T> _create<T extends Model>(
    String key,
    T Function(Map<String, dynamic>) modelFromJson,
    T model,
  ) {
    if (!sharedPreferences.containsKey(key)) {
      sharedPreferences.setStringList(key, []);
    }

    final models = sharedPreferences.getStringList(key) ?? [];

    if (models
        .map((e) => modelFromJson(jsonDecode(e)))
        .toList()
        .where((element) => element.id == model.id)
        .isNotEmpty) {
      throw ArgumentError("${model.runtimeType} already exists");
    }

    models.add(jsonEncode(model.toJson()));

    sharedPreferences.setStringList(key, models);

    return Future.value(model);
  }

  Future<T> _update<T extends Model>(
    String key,
    T Function(Map<String, dynamic>) modelFromJson,
    T model,
  ) {
    if (!sharedPreferences.containsKey(key)) {
      sharedPreferences.setStringList(key, []);
    }

    final models = sharedPreferences.getStringList(key) ?? [];

    if (models
        .map((e) => modelFromJson(jsonDecode(e)))
        .toList()
        .where((element) => element.id == model.id)
        .isEmpty) {
      throw ArgumentError("${model.runtimeType} does not exist");
    }

    models.removeWhere(
        (element) => modelFromJson(jsonDecode(element)).id == model.id);
    models.add(jsonEncode(model.toJson()));

    sharedPreferences.setStringList(key, models);

    return Future.value(model);
  }

  Future<T> _delete<T extends Model>(
    String key,
    T Function(Map<String, dynamic>) modelFromJson,
    String id,
  ) {
    if (!sharedPreferences.containsKey(key)) {
      sharedPreferences.setStringList(key, []);
    }

    final models = sharedPreferences.getStringList(key) ?? [];

    if (models
        .map((e) => modelFromJson(jsonDecode(e)))
        .toList()
        .where((element) => element.id == id)
        .isEmpty) {
      throw ArgumentError(
          "${modelFromJson(jsonDecode(models.first))} does not exist");
    }

    models
        .removeWhere((element) => modelFromJson(jsonDecode(element)).id == id);

    sharedPreferences.setStringList(key, models);

    return Future.value(modelFromJson(jsonDecode(models.first)));
  }

  Future<T> _read<T extends Model>(
    String key,
    T Function(Map<String, dynamic>) modelFromJson,
    String id,
  ) {
    if (!sharedPreferences.containsKey(key)) {
      sharedPreferences.setStringList(key, []);
    }

    final models = sharedPreferences.getStringList(key) ?? [];

    if (models
        .map((e) => modelFromJson(jsonDecode(e)))
        .toList()
        .where((element) => element.id == id)
        .isEmpty) {
      throw ArgumentError(
          "${modelFromJson(jsonDecode(models.first))} does not exist");
    }

    return Future.value(modelFromJson(jsonDecode(models.first)));
  }

  Future<List<T>> _readAll<T extends Model>(
    String key,
    T Function(Map<String, dynamic>) modelFromJson,
  ) {
    if (!sharedPreferences.containsKey(key)) {
      sharedPreferences.setStringList(key, []);
    }

    final models = sharedPreferences.getStringList(key) ?? [];

    return Future.value(
        models.map((e) => modelFromJson(jsonDecode(e))).toList());
  }
}
