import 'package:equatable/equatable.dart';

abstract class PotState extends Equatable {}

class PotIsLoading extends PotState {
  @override
  List<Object> get props => [];
}

class PotIsLoaded extends PotState {
  final list;

  PotIsLoaded({this.list});

  @override
  List<Object> get props => [list];
}

class PotIsDeleted extends PotState{
  final message;

  PotIsDeleted({this.message});

  @override
  List<Object> get props => [message];

}

class PotIsError extends PotState {
  final message;

  PotIsError({this.message});

  @override
  List<Object> get props => [message];
}
