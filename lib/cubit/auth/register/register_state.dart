import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {}

class IsLoadingState extends RegisterState {
  @override
  List<Object> get props => [];
}

class IsLoadedState extends RegisterState {
  final response;

  IsLoadedState(this.response);

  @override
  List<Object> get props => [response];
}

class IsErrorState extends RegisterState {
  final message;

  IsErrorState(this.message);

  @override
  List<Object> get props => [message];
}
