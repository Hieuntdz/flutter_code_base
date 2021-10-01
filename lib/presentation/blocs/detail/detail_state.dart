part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  DetailState({this.name});
  String? name;

  @override
  List<Object?> get props => [this.name];
}

class DetailInitial extends DetailState {
  DetailInitial({String? name}) : super(name: name);
}
