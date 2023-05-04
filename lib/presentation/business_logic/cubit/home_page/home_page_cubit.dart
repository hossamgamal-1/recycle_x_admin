import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitialState());
  int _currentNavBarIndex = 0;
  int get currentNavBarIndex => _currentNavBarIndex;

  setNewNavBarIndex(int newIndex) {
    _currentNavBarIndex = newIndex;
    emit(PageChangedState());
  }

  void reSetNavBarIndex() {
    _currentNavBarIndex = 1;
    emit(PageChangedState());
  }
}
