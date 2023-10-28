import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk_mining_admin/blocs/all_user/all_user_bloc.dart';
import 'package:mk_mining_admin/blocs/sign_in/sign_in_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  void fetchData() {
    final token = context.read<SignInBloc>().token;
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
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemBuilder: (_, i) => Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        child: Text(
                          "S",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Soton Ahmed",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Text("tasmia437@gmail.com"),
                            Text(
                              "Main: 500 | Mining: 01 | Team: 08",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Switch(value: false, onChanged: (v) {}),
                  ],
                ),
              )),
    );
  }
}
