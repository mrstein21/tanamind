import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {}

class CartIsLoading extends CartState {
  @override
  List<Object> get props => [];
}

class CartIsLoaded extends CartState {
  final data;

  CartIsLoaded({this.data});

  @override
  List<Object> get props => [data];
}

class CartIsAdded extends CartState{
  final message;

  CartIsAdded({this.message});

  @override
  List<Object> get props => [message];

}

class CartIsDeleted extends CartState{
  final message;

  CartIsDeleted({this.message});

  @override
  List<Object> get props => [message];

}

class CartIsError extends CartState {
  final message;

  CartIsError({this.message});

  @override
  List<Object> get props => [message];
}
