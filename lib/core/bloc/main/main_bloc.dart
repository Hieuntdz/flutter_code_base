import 'package:bloc/bloc.dart';

import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState().init());

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is InitEvent) {
      yield await init();
    }
  }

  Future<MainState> init() async {
    return state.clone();
  }
}
