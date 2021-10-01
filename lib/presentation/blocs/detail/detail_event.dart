part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class InitDetailEvent extends DetailEvent {
  InitDetailEvent({this.name});
  String? name;
}
