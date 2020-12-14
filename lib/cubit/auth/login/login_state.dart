import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class IsLoadingState extends LoginState {
  @override
  List<Object> get props => [];
}

class IsLoginState extends LoginState {
  final message;

  IsLoginState(this.message);

  @override
  List<Object> get props => [message];
}

class IsLoginErroState extends LoginState {
  final message;

  IsLoginErroState(this.message);

  @override
  List<Object> get props => [message];
}
