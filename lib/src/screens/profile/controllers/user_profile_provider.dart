import 'package:flutter/material.dart';
import 'package:rehabox/src/models/User/user.dart';
import 'package:rehabox/src/repositories/repositories.dart';
import 'package:rehabox/src/utils/controllers_status.dart';

part 'user_profile_provider_state.dart';

class UserProfileProvider extends ChangeNotifier
    implements ControllersStatusInterface {
  UserProfileProvider(this._userRepository);

  final UserRepositoryInterface _userRepository;

  UserProfileProviderState _state = const UserProfileProviderState.initial();

  UserProfileProviderState get state => _state;

  // Fetch user data from the repository.
  Future<void> read() async {
    _state = UserProfileProviderState.loading(_state);
    notifyListeners();
    try {
      final user = await _userRepository.read();
      debugPrint("User: $user");
      if (user == null) {
        _state = const UserProfileProviderState(
          status: ControllersStatus.error,
          errorMessage: 'User not found',
        );
      } else {
        _state = _state.copyWith(user: user, status: ControllersStatus.loaded);
      }
    } catch (e) {
      // _state = UserProfileProviderState.error(_state, e.toString());
      _state = const UserProfileProviderState(
        status: ControllersStatus.loaded,
      );
    }
    notifyListeners();
  }

  Future<void> update() async {
    _state = UserProfileProviderState.loading(_state);
    notifyListeners();
    try {
      // final user = await _userRepository.update();
      // _state = UserProfileProviderState.loaded(_state, user);
    } catch (e) {
      _state = UserProfileProviderState.error(_state, e.toString());
    }
    notifyListeners();
  }

  void changeProfileBodyType(ProfileBodyType profileBodyType) {
    _state = _state.copyWith(profileBodyType: profileBodyType);
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
