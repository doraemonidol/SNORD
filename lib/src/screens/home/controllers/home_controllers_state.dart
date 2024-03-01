part of 'home_controllers.dart';

enum TabState { daily, weekly, monthly }

class HomeControllersState {
  HomeControllersState({
    this.tabState = TabState.daily,
    this.status = ControllersStatus.initial,
    required this.endDate,
    this.selectedDate,
    this.errorMessage,
    this.indicatedValue,
    this.selectedMonth,
    this.data,
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
  final double? indicatedValue;
  final int? selectedMonth;
  final List<NicotineConsumption>? data;

  HomeControllersState copyWith({
    TabState? tabState,
    DateTime? selectedDate,
    ControllersStatus? status,
    String? errorMessage,
    DateTime? endDate,
    double? indicatedValue,
    int? selectedMonth,
    List<NicotineConsumption>? data,
  }) {
    return HomeControllersState(
      tabState: tabState ?? this.tabState,
      selectedDate: selectedDate ?? this.selectedDate,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      endDate: endDate ?? this.endDate,
      indicatedValue: indicatedValue ?? this.data?.last.value,
      data: data ?? this.data,
      selectedMonth: selectedMonth ?? this.selectedMonth,
    );
  }
}
