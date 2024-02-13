import 'package:flutter/material.dart';
import 'package:rehabox/src/repositories/repositories.dart';
import 'package:rehabox/src/utils/controllers_status.dart';

part 'authentication_provider_state.dart';

class AuthenticationProvider extends ChangeNotifier
    implements ControllersStatusInterface {
  AuthenticationProvider(this._userRepository);

  final UserRepositoryInterface _userRepository;

  AuthenticationProviderState _state =
      const AuthenticationProviderState.initial();

  AuthenticationProviderState get state => _state;

  // Fetch user data from the repository.
  Future<void> read() async {
    _state = AuthenticationProviderState.loading(_state);
    notifyListeners();
    try {
      // final user = await _userRepository.read();
      // _state = AuthenticationProviderState.loaded(_state, user);
      await Future<void>.delayed(const Duration(seconds: 3), () {
        throw Exception('Error');
      });
    } catch (e) {
      // _state = AuthenticationProviderState.error(_state, e.toString());
      _state = const AuthenticationProviderState(
        status: ControllersStatus.loaded,
      );
    }
    notifyListeners();
  }

  Future<void> update() async {
    _state = AuthenticationProviderState.loading(_state);
    notifyListeners();
    try {
      // final user = await _userRepository.update();
      // _state = AuthenticationProviderState.loaded(_state, user);
    } catch (e) {
      _state = AuthenticationProviderState.error(_state, e.toString());
    }
    notifyListeners();
  }

  void changeAuthenticationType(AuthenticationType authenticationType) {
    _state = _state.copyWith(authenticationType: authenticationType);
    notifyListeners();
  }

  @override
  String? get errorMessage => state.errorMessage;

  @override
  bool get isError => state.status == ControllersStatus.error;

  @override
  bool get isInitial => state.status == ControllersStatus.initial;

  @override
  bool get isLoaded => state.status == ControllersStatus.loaded;

  @override
  bool get isLoading => state.status == ControllersStatus.loading;
}
