part of 'authentication_provider.dart';

enum AuthenticationType {
  login,
  signup,
}

@immutable
final class AuthenticationProviderState {
  const AuthenticationProviderState({
    this.status = ControllersStatus.initial,
    this.authenticationType = AuthenticationType.login,
    this.errorMessage,
    // this.user,
  });

  const AuthenticationProviderState.initial() : this();

  AuthenticationProviderState.loading(
    AuthenticationProviderState? old,
  ) : this(
          status: ControllersStatus.loading,
          errorMessage: old?.errorMessage,
          authenticationType: old?.authenticationType ?? AuthenticationType.login,
          // user: old.user,
        );

  AuthenticationProviderState.error(
    AuthenticationProviderState? old,
    String? errorMessage,
  ) : this(
          status: ControllersStatus.error,
          errorMessage: errorMessage,
          authenticationType: old?.authenticationType ?? AuthenticationType.login,
          // user: old.user,
        );

  final ControllersStatus status;
  final String? errorMessage;
  // final User? user;
  final AuthenticationType authenticationType;

  AuthenticationProviderState copyWith({
    ControllersStatus? status,
    String? errorMessage,
    AuthenticationType? authenticationType,
    // User? user,
  }) {
    return AuthenticationProviderState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      authenticationType: authenticationType ?? this.authenticationType,
      // user: user ?? this.user,
    );
  }
}
