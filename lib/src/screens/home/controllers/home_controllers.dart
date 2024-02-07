import 'package:flutter/material.dart';
import 'package:rehabox/src/utils/computation.dart';
import 'package:rehabox/src/utils/controllers_status.dart';

part 'home_controllers_state.dart';

class HomeControllers extends ChangeNotifier
    implements ControllersStatusInterface {
  HomeControllersState _state = HomeControllersState(
    endDate: DateTime.now(),
  );

  HomeControllersState get state => _state;

  void changeTabState(TabState tabState) {
    _state = _state.copyWith(tabState: tabState);
    notifyListeners();
  }

  void previousWeek() {
    _state = _state.copyWith(
      endDate: _state.endDate.subtract(
        const Duration(
          days: 7,
        ),
      ),
    );
    notifyListeners();
  }

  void nextWeek() {
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
    notifyListeners();
  }

  void selectDate(DateTime date) {
    if (_state.selectedDate != null && matchDate(date, _state.selectedDate!)) {
      _state = HomeControllersState(
        tabState: _state.tabState,
        endDate: _state.endDate,
        selectedDate: null,
      );
    } else {
      _state = _state.copyWith(selectedDate: date);
    }
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
