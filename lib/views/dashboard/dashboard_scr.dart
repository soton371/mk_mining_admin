import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk_mining_admin/blocs/all_user/all_user_bloc.dart';
import 'package:mk_mining_admin/blocs/sign_in/sign_in_bloc.dart';
import 'package:mk_mining_admin/views/dashboard/components/user_list.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String token = '';
  void fetchData() {
    token = context.read<SignInBloc>().token;
    context.read<AllUserBloc>().add(FetchAllUserEvent(token: token));
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: BlocBuilder<AllUserBloc, AllUserState>(
        builder: (context, state) {
          if (state is AllUserLoadingState) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state is AllUserSuccessState) {
            return UserList(
              allUsers: state.allUsers,
              token: token,
            );
          } else if (state is AllUserFailedState) {
            return Center(
              child: Text(state.msg),
            );
          } else if (state is AllUserUserEmptyState) {
            return const Center(
              child: Text("There are currently no users"),
            );
          } else {
            return const Center(
              child: Text("Else"),
            );
          }
        },
      ),
    );
  }
}
