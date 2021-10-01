import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial());

  @override
  Stream<DetailState> mapEventToState(DetailEvent event) async* {
    if (event is InitDetailEvent) {
      yield DetailInitial(name: event.name);
    }
  }
}
