part of 'all_user_bloc.dart';

sealed class AllUserState extends Equatable {
  const AllUserState();

  @override
  List<Object> get props => [];
}

final class AllUserInitial extends AllUserState {}

final class AllUserLoadingState extends AllUserState {}

final class AllUserSuccessState extends AllUserState {
  final List<Datum> allUsers;
  const AllUserSuccessState({required this.allUsers});

  @override
  List<Object> get props => [allUsers];
}

final class AllUserFailedState extends AllUserState {
  final String msg;
  const AllUserFailedState({required this.msg});

  @override
  List<Object> get props => [msg];
}

final class AllUserUserEmptyState extends AllUserState {}
