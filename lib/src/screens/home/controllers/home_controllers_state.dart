part of 'home_controllers.dart';

enum TabState { daily, weekly, monthly }

class HomeControllersState {
  HomeControllersState({
    this.tabState = TabState.daily,
    this.status = ControllersStatus.initial,
    required this.endDate,
    this.selectedDate,
    this.errorMessage,
  }) : startDate = endDate.subtract(
          const Duration(
            days: 7,
          ),
        );

  final TabState tabState;
  final DateTime? selectedDate;
  final DateTime startDate;
  final DateTime endDate;
  final ControllersStatus status;
  final String? errorMessage;

  HomeControllersState copyWith({
    TabState? tabState,
    DateTime? selectedDate,
    ControllersStatus? status,
    String? errorMessage,
    DateTime? endDate,
  }) {
    return HomeControllersState(
      tabState: tabState ?? this.tabState,
      selectedDate: selectedDate ?? this.selectedDate,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      endDate: endDate ?? this.endDate,
    );
  }
}
