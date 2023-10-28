import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mk_mining_admin/models/all_user_mod.dart';
import 'package:mk_mining_admin/services/all_user_ser.dart';

part 'all_user_event.dart';
part 'all_user_state.dart';

class AllUserBloc extends Bloc<AllUserEvent, AllUserState> {
  AllUserBloc() : super(AllUserInitial()) {
    on<FetchAllUserEvent>((event, emit) async {
      debugPrint("call FetchAllUserEvent");
      emit(AllUserLoadingState());
      final result = await allUserService(token: event.token);

      if (result.status == 0) {
        emit(AllUserFailedState(msg: result.message ?? 'Something went wrong'));
        return;
      }

      final data = result.data;
      if (data == null) {
        emit(AllUserFailedState(msg: result.message ?? 'Data is null'));
        return;
      }

      if (data.isEmpty) {
        debugPrint("data size 1: ${data.length}");
        emit(AllUserUserEmptyState());
        return;
      }

      debugPrint("data size 2: ${data.length}");

      emit(AllUserSuccessState(allUsers: data));
    });
  }
}
