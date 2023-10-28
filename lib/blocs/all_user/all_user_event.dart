part of 'all_user_bloc.dart';

sealed class AllUserEvent extends Equatable {
  const AllUserEvent();

  @override
  List<Object> get props => [];
}

class FetchAllUserEvent extends AllUserEvent {
  final String token;
  const FetchAllUserEvent({required this.token});

  @override
  List<Object> get props => [token];
}
