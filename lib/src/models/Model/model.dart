/// Interface for all models.
/// This interface is used to ensure that all models have an id and can be converted to JSON
/// in order to be stored locally or remotely
abstract interface class Model {
  String get id;
  Map<String, dynamic> toJson();
  /// Creates a copy of the model with the given id
  Model copyWith({String? id});
}