import 'package:equatable/equatable.dart';

abstract class PlantState extends Equatable {}

class PlantIsLoading extends PlantState {
  @override
  List<Object> get props => [];
}

class PlantIsLoaded extends PlantState {
  final list;

  PlantIsLoaded({this.list});

  @override
  List<Object> get props => [list];
}

class PlantIsError extends PlantState {
  final message;

  PlantIsError({this.message});

  @override
  List<Object> get props => [message];
}
