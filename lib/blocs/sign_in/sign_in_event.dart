part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class DoSignInEvent extends SignInEvent {
  final String email, password;
  const DoSignInEvent({required this.email, required this.password});
  @override
  List<Object> get props => [email,password];
}
