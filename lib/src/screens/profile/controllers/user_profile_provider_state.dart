part of 'user_profile_provider.dart';

enum ProfileBodyType {
  activity,
  achievement,
}

@immutable
final class UserProfileProviderState {
  const UserProfileProviderState({
    this.status = ControllersStatus.initial,
    this.profileBodyType = ProfileBodyType.activity,
    this.errorMessage,
    this.user,
  });

  const UserProfileProviderState.initial() : this();

  UserProfileProviderState.loading(
    UserProfileProviderState? old,
  ) : this(
          status: ControllersStatus.loading,
          errorMessage: old?.errorMessage,
          profileBodyType: old?.profileBodyType ?? ProfileBodyType.activity,
          // user: old.user,
        );

  UserProfileProviderState.error(
    UserProfileProviderState? old,
    String? errorMessage,
  ) : this(
          status: ControllersStatus.error,
          errorMessage: errorMessage,
          profileBodyType: old?.profileBodyType ?? ProfileBodyType.activity,
          // user: old.user,
        );

  final ControllersStatus status;
  final String? errorMessage;
  final User? user;
  final ProfileBodyType profileBodyType;

  UserProfileProviderState copyWith({
    ControllersStatus? status,
    String? errorMessage,
    ProfileBodyType? profileBodyType,
    User? user,
  }) {
    return UserProfileProviderState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      profileBodyType: profileBodyType ?? this.profileBodyType,
      user: user ?? this.user,
    );
  }
}
