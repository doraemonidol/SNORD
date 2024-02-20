import 'package:flutter/material.dart';
import 'package:rehabox/src/screens/home/widgets/config.dart';
import 'package:rehabox/src/utils/computation.dart';
import 'package:rehabox/src/utils/controllers_status.dart';

part 'home_controllers_state.dart';

class HomeControllers extends ChangeNotifier
    implements ControllersStatusInterface {
  HomeControllersState _state = HomeControllersState(
    endDate: DateTime.now(),
  );

  HomeControllersState get state => _state;

  Future<void> fetchData() async {
    _state = HomeControllersState(
      endDate: _state.endDate,
      tabState: _state.tabState,
      status: ControllersStatus.loading,
      selectedDate: _state.selectedDate,
      selectedMonth: _state.selectedMonth,
    );
    notifyListeners();
    try {
      // final data = await Computation().fetchData();
      await Future.delayed(const Duration(seconds: 2));
      final data = state.tabState == TabState.daily
          ? [...mockData]
          : state.tabState == TabState.weekly
              ? [...mockDataWeekly]
              : [...mockDataMonth];
      _state = _state.copyWith(
        status: ControllersStatus.loaded,
        data: data,
      );
    } catch (e) {
      _state = _state.copyWith(
        status: ControllersStatus.error,
        errorMessage: e.toString(),
      );
    }
    notifyListeners();
  }

  Future<void> changeTabState(TabState tabState) async {
    _state = HomeControllersState(
      endDate: _state.endDate,
      tabState: tabState,
      status: _state.status,
    );
    if (tabState == TabState.monthly) {
      _state = _state.copyWith(
        selectedMonth: DateTime.now().month,
      );
    }
    await fetchData();
  }

  Future<void> previousMonth() async {
    if (_state.selectedMonth == 1) {
      return;
    }
    _state = _state.copyWith(
      selectedMonth: _state.selectedMonth! - 1,
    );
    await fetchData();
  }

  Future<void> nextMonth() async {
    if (_state.selectedMonth == DateTime.now().month) {
      return;
    }
    _state = _state.copyWith(
      selectedMonth: _state.selectedMonth! + 1,
    );
    await fetchData();
  }

  Future<void> previousWeek() async {
    _state = _state.copyWith(
      endDate: _state.endDate.subtract(
        const Duration(
          days: 7,
        ),
      ),
    );

    if (_state.tabState != TabState.daily) {
      await fetchData();
    } else {
      notifyListeners();
    }
  }

  Future<void> nextWeek() async {
    if (_state.endDate.add(const Duration(days: 7)).isAfter(DateTime.now())) {
      return;
    }
    _state = _state.copyWith(
      endDate: _state.endDate.add(
        const Duration(
          days: 7,
        ),
      ),
    );
    if (_state.tabState != TabState.daily) {
      await fetchData();
    } else {
      notifyListeners();
    }
  }

  Future<void> selectDate(DateTime date) async {
    try {
      if (_state.selectedDate == null ||
          !matchDate(date, _state.selectedDate!)) {
        _state = HomeControllersState(
          tabState: _state.tabState,
          endDate: _state.endDate,
          selectedDate: date,
        );
      } else {
        _state = HomeControllersState(
          tabState: _state.tabState,
          endDate: _state.endDate,
          selectedDate: null,
        );
      }
    } catch (e) {
      _state = _state.copyWith(
        status: ControllersStatus.error,
        errorMessage: e.toString(),
      );
    }
    await fetchData();
  }

  void changeIndicatedValue(double? value) {
    _state = _state.copyWith(indicatedValue: value);
    notifyListeners();
  }

  @override
  String? get errorMessage => _state.errorMessage;

  @override
  bool get isError => _state.status == ControllersStatus.error;

  @override
  bool get isInitial => _state.status == ControllersStatus.initial;

  @override
  bool get isLoaded => _state.status == ControllersStatus.loaded;

  @override
  bool get isLoading => _state.status == ControllersStatus.loading;
}
