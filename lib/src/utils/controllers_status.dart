enum ControllersStatus {
  initial,
  loading,
  loaded,
  error,
}

/// An interface that provides a set of methods to manage the status of a controller.
/// It forces every state controller state to have explicit 4 states:
/// - initial
/// - loading
/// - loaded
/// - error
/// and a set of getters to check the current state of the controller.
abstract interface class ControllersStatusInterface {
  String? get errorMessage;
  bool get isLoading;
  bool get isLoaded;
  bool get isError;
  bool get isInitial;
}
